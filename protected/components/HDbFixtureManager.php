<?php

/**
 * Profiler
 *  © 2015 Profiler 
 */

/**
 * HDbFixtureManager also allows fixtures for modules.
 *
 * @author Zak
 * @package profiler.components
 * @since 0.9
 */
class HDbFixtureManager extends CDbFixtureManager
{

    public $moduleBasePaths = array();
    protected $_fixtures;

    public function init()
    {
        parent::init();

        foreach (Yii::app()->moduleManager->getInstalledModules(true, false) as $moduleId => $module) {
            $moduleFixturePath = $module->getPath() . DIRECTORY_SEPARATOR . 'tests' . DIRECTORY_SEPARATOR . 'fixtures';
            if (is_dir($moduleFixturePath)) {
                $this->moduleBasePaths[] = $moduleFixturePath;
                $this->prepareModule($moduleFixturePath);
            }
        }
    }

    public function prepareModule($modulePath)
    {
        $initFile = $modulePath . DIRECTORY_SEPARATOR . $this->initScript;

        $this->checkIntegrity(false);

        if (is_file($initFile))
            require($initFile);
        else {
            foreach ($this->getFixturesModule($modulePath) as $tableName => $fixturePath) {
                $this->resetTable($tableName);
                $this->loadFixture($tableName);
            }
        }
        $this->checkIntegrity(true);
    }

    public function resetTable($tableName)
    {
        $initFile = dirname($this->fixtures[$tableName]) . DIRECTORY_SEPARATOR . $tableName . $this->initScriptSuffix;

        if (is_file($initFile))
            require($initFile);
        else
            $this->truncateTable($tableName);
    }

    public function loadFixture($tableName)
    {

        $fileName = $this->_fixtures[$tableName];
        if (!is_file($fileName))
            return false;

        $rows = array();
        $schema = $this->getDbConnection()->getSchema();
        $builder = $schema->getCommandBuilder();
        $table = $schema->getTable($tableName);

        foreach (require($fileName) as $alias => $row) {
            $builder->createInsertCommand($table, $row)->execute();
            $primaryKey = $table->primaryKey;
            if ($table->sequenceName !== null) {
                if (is_string($primaryKey) && !isset($row[$primaryKey]))
                    $row[$primaryKey] = $builder->getLastInsertID($table);
                elseif (is_array($primaryKey)) {
                    foreach ($primaryKey as $pk) {
                        if (!isset($row[$pk])) {
                            $row[$pk] = $builder->getLastInsertID($table);
                            break;
                        }
                    }
                }
            }
            $rows[$alias] = $row;
        }
        return $rows;
    }

    public function getFixtures()
    {
        if ($this->_fixtures === null) {
            $this->_fixtures = array();
            $schema = $this->getDbConnection()->getSchema();
            $folder = opendir($this->basePath);
            $suffixLen = strlen($this->initScriptSuffix);
            while ($file = readdir($folder)) {
                if ($file === '.' || $file === '..' || $file === $this->initScript)
                    continue;
                $path = $this->basePath . DIRECTORY_SEPARATOR . $file;
                if (substr($file, -4) === '.php' && is_file($path) && substr($file, -$suffixLen) !== $this->initScriptSuffix) {
                    $tableName = substr($file, 0, -4);
                    if ($schema->getTable($tableName) !== null)
                        $this->_fixtures[$tableName] = $path;
                }
            }
            closedir($folder);
        }
        return $this->_fixtures;
    }

    public function getFixturesModule($modulePath)
    {
        
        $moduleFixtures = array();
        
        $schema = $this->getDbConnection()->getSchema();
        $folder = opendir($modulePath);
        $suffixLen = strlen($this->initScriptSuffix);
        while ($file = readdir($folder)) {
            if ($file === '.' || $file === '..' || $file === $this->initScript)
                continue;
            $path = $modulePath . DIRECTORY_SEPARATOR . $file;
            if (substr($file, -4) === '.php' && is_file($path) && substr($file, -$suffixLen) !== $this->initScriptSuffix) {
                $tableName = substr($file, 0, -4);
                if ($schema->getTable($tableName) !== null) {
                    $this->_fixtures[$tableName] = $path;
                    $moduleFixtures[$tableName] = $path;
                }
            }
        }
        closedir($folder);
        return $moduleFixtures;
    }

}
