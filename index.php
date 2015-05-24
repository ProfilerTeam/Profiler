<?php

$yii = dirname(__FILE__) . '/protected/vendors/yii/yii.php';
$config = dirname(__FILE__) . '/protected/config/main.php';
$appClass = dirname(__FILE__) . '/protected/components/WebApplication.php';

// Disable these 3 lines when in production mode
defined('YII_DEBUG') or define('YII_DEBUG', true);
defined('YII_TRACE_LEVEL') or define('YII_TRACE_LEVEL', 5);
ini_set('error_reporting', E_ALL);

require_once($yii);
require_once($appClass);

$app = Yii::createApplication('WebApplication', $config);

Yii::import('application.vendors.*');
EZendAutoloader::$prefixes = array('Zend', 'Custom');
Yii::import("ext.yiiext.components.zendAutoloader.EZendAutoloader", true);
Yii::registerAutoloader(array("EZendAutoloader", "loadClass"), true);

$app->run();
