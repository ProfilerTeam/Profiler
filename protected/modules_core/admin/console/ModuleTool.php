<?php

/**
 * Profiler
 *  © 2015 Profiler
 *
 * 
 * 
 * 
 *
 * 
 * 
 * 
 *
 * 
 * 
 * 
 * 
 */

/**
 * Tool for managing modules by command line
 *
 * @package profiler.modules_core.admin.console
 * @since 0.5
 */
class ModuleTool extends HConsoleCommand
{

    public function init()
    {

        Yii::import('application.modules_core.admin.libs.*');
        ModuleManager::flushCache();
        $this->printHeader('Module Tools');
        return parent::init();
    }

    public function beforeAction($action, $params)
    {
        return parent::beforeAction($action, $params);
    }

    public function actionList($args)
    {

        $installedModules = Yii::app()->moduleManager->getInstalledModules();
        ModuleManager::flushCache();

        print "Installed modules: \n\n";

        foreach ($installedModules as $module) {
            print "- [" . $module->getId() . "]\n  " . $module->getName() . " (" . $module->getVersion() . ") " . (($module->isEnabled()) ? "***ENABLED***" : "") . "\n";
            print "  " . $module->getDescription() . "\n\n";
        }
    }

    public function actionListOnline($args)
    {

        $onlineModules = new OnlineModuleManager();
        $modules = $onlineModules->getModules();

        print "Online available modules: \n\n";

        foreach ($modules as $module) {
            print "- [" . $module['id'] . "]\n  " . $module['name'] . " (" . $module['latestVersion'] . ") " . ((Yii::app()->moduleManager->isInstalled($module['id'])) ? "***INSTALLED***" : "") . "\n";
            if (isset($module['latestCompatibleVersion']) && $module['latestCompatibleVersion']) {
                if ($module['latestCompatibleVersion'] != $module['latestVersion']) {
                    print "  Latest compatible version:" . $module['latestCompatibleVersion'] . "\n";
                }
            } else {
                print "  *** NO COMPATIBLE VERSION FOUND!";
            }

            print "  " . $module['description'] . "\n\n";
        }
    }

    public function actionInstall($args)
    {

        if (!isset($args[0])) {
            print "Error: Module Id required!\n\n";
            print $this->getHelp();
            return;
        }

        $moduleId = $args[0];
        $onlineModules = new OnlineModuleManager();
        $onlineModules->install($moduleId);

        print "\nModule " . $moduleId . " successfully installed!\n";
    }

    public function actionUninstall($args)
    {

        if (!isset($args[0])) {
            print "Error: Module Id required!\n\n";
            print $this->getHelp();
            return;
        }

        $moduleId = $args[0];
        $module = Yii::app()->moduleManager->getModule($moduleId);

        if ($module == null) {
            print "\nModule " . $moduleId . " is not installed!\n";
            return;
        }

        $module->uninstall($moduleId);

        print "\nModule " . $moduleId . " successfully uninstalled!\n";
    }

    /**
     * Updates a module
     * 
     * @param type $args
     * @return type
     */
    public function actionUpdate($args, $force=false)
    {

        if (!isset($args[0])) {
            print "Error: Module Id required!\n\n";
            print $this->getHelp();
            return;
        }

        $moduleId = $args[0];

        
        if (!Yii::app()->moduleManager->isInstalled($moduleId)) {
            print "\nModule " . $moduleId . " is not installed!\n";
            return;
        }
        
        // Look online for module
        $onlineModules = new OnlineModuleManager();
        $moduleInfo = $onlineModules->getModuleInfo($moduleId);

        if (!isset($moduleInfo['latestCompatibleVersion'])) {
            print "No compatible version for " . $moduleId . " found online!\n";
            return;
        }
        
        if (!$force) {
            $module = Yii::app()->moduleManager->getModule($moduleId);
            
            if ($moduleInfo['latestCompatibleVersion']['version'] == $module->getVersion()) {
                print "Module " . $moduleId . " already up to date!\n";
                return;
            }
        }

        $onlineModules->update($moduleId);

        print "Module " . $moduleId . " successfully updated!\n";
    }

    public function actionUpdateAll($args)
    {
        $installedModules = Yii::app()->moduleManager->getInstalledModules(false, true);
        ModuleManager::flushCache();

        print "Updating modules: \n\n";
        foreach ($installedModules as $moduleId => $moduleClass) {
            $this->actionUpdate(array($moduleId), true);
        }
    }

    function getHelp()
    {
        return <<<EOD
USAGE
  yiic module [action] [parameter]

DESCRIPTION
  This command provides a console interface for manipulating modules. 

EXAMPLES
 * yiic module list
   Lists all installed modules
        
 * yiic module listonline
   Lists all online available modules

 * yiic module install moduleId
   Updates a given module to the last available version.

 * yiic module uninstall moduleId
   Updates a given module to the last available version.
        
 * yiic module update moduleId
   Updates a given module to the last available version.
        
 * yiic module updateall
   Updates all modules to the latest available version

EOD;
    }

}
