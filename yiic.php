<?php

$baseDir = '/';
$config=$baseDir.'/protected/config/console.php';

defined('STDIN') or define('STDIN', fopen('php://stdin', 'r'));
defined('YII_DEBUG') or define('YII_DEBUG',true);

require_once(dirname(__FILE__) . '/../../etc/Yii.php');
require_once($baseDir.'/protected/components/HConsoleApplication.php');

$sharedConfig = array(
    'runtimePath' => dirname(__FILE__) . '/runtime',
    'modulePath' => dirname(__FILE__) . '/modules',      
    'components' => array(
        'themeManager' => array(
            'basePath' => dirname(__FILE__) . '/themes'
        )
    ),
    'params' => array(
        'dynamicConfigFile' => dirname(__FILE__) . '/_settings.php',
    ),
); 

Yii::setPathOfAlias('modules_hosted', dirname(__FILE__) . '/modules');

$config = CMap::mergeArray(require($config),$sharedConfig);
$config = CMap::mergeArray($config, require(dirname(__FILE__) . '/_settings.php'));

$app=Yii::createApplication('HConsoleApplication', $config);

Yii::setPathOfAlias('webroot', realpath(dirname(__FILE__)));

$app->commandRunner->addCommands(YII_PATH.'/cli/commands');

$app->run();
