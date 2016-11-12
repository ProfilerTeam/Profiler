<?php

return array(
    'basePath' => dirname(__FILE__) . DIRECTORY_SEPARATOR . '..',
    // Default Application Name
    'name' => 'Profiler',
    'preload' => array('log', 'input'),
    'components' => array(
        // Database
        'db' => array(
            'connectionString' => 'mysql:host=localhost;dbname=profiler',
            'emulatePrepare' => true,
            'charset' => 'utf8',
            'enableProfiling' => true,
            'enableParamLogging' => true,
            'schemaCachingDuration' => 3600,
        ),
        'urlManager' => array(
            'urlFormat' => 'get',
            'showScriptName' => true,
            'rules' => array(
                array(
                    'class' => 'application.modules_core.space.components.SpaceUrlRule',
                    'connectionId' => 'db',
                ),
                array(
                    'class' => 'application.modules_core.user.components.UserUrlRule',
                    'connectionId' => 'db',
                ),
                '/' => '//',
                'dashboard' => 'dashboard/dashboard',
                'directory/members' => 'directory/directory/members',
                'directory/spaces' => 'directory/directory/groups',
                '<controller:\w+>/<id:\d+>' => '<controller>/view',
                '<controller:\w+>/<action:\w+>/<id:\d+>' => '<controller>/<action>',
                '<controller:\w+>/<action:\w+>' => '<controller>/<action>',
            ),
        ),
        'moduleManager' => array(
            'class' => 'application.components.ModuleManager',
        ),
        'messages' => array(
            'class' => 'application.components.HPhpMessageSource',
        ),
        'input' => array(
            'class' => 'application.extensions.CmsInput',
            'cleanPost' => false,
            'cleanGet' => false,
        ),
        'interceptor' => array(
            'class' => 'HInterceptor',
        ),
        'session' => array(
            'class' => 'application.modules_core.user.components.SIHttpSession',
            'connectionID' => 'db',
            'sessionName' => 'sin',
        ),
        'request' => array(
        //'enableCsrfValidation' => true,
        ),
        // Caching (Will replaced at runtime)
        'cache' => array(
            'class' => 'CDummyCache'
        ),
        'log' => array(
            'class' => 'CLogRouter',
            'routes' => array(
                array(
                    'class' => 'CFileLogRoute',
                    'levels' => 'error, warning',
                ),
                array(
                    'class' => 'CDbLogRoute',
                    'levels' => 'error, warning',
                    'logTableName' => 'logging',
                    'connectionID' => 'db',
                    'autoCreateLogTable' => false,
                ),
            ),
        ),
    ),
    // Modules
    'modules' => array(
    // All Profiler Modules will automatically loaded via
    // /modules/*/autostart.php
    //   or
    // /modules_core/*/autostart.php
    ),
    // autoloading model and component classes
    'import' => array(
        'application.models.*',
        'application.forms.*',
        'application.components.*',
        'application.behaviors.*',
        'application.interfaces.*',
        'application.libs.*',
        'application.widgets.*',
        // 3rd Party Extensions
        'ext.yii-mail.YiiMailMessage',
        'ext.EZendAutoloader.EZendAutoloader',
        'ext.controller-events.*'
    ),
    // application-level parameters that can be accessed
    // using Yii::app()->params['paramName']
    'params' => array(
        // Installed Flag
        'version' => '0.9.4',
        'versionFlag' => 'Beta Revamp',
        'statusShown' => true,
        'maintenance' => false,
        'installed' => false,
        'availableLanguages' => array(
            'en_gb' => 'English (UK)',
            'en' => 'English (US)',
            'de' => 'Deutsch',
            'fr' => 'FranÃ§ais',
            'es' => 'EspaÃ±ol',
            'nl' => 'Nederlands',
            'pl' => 'Polski',
            'da' => 'Dansk',
            'sv' => 'Svenska',
            'nb_no' => 'Nnorsk bokmÃ¥l',
            'pt' => 'PortuguÃªs',
            'pt_br' => 'PortuguÃªs do Brasil',
            'ca' => 'CatalÃ ',
            'it' => 'Italiano',
            'th' => 'à¹„à¸—à¸¢',
            'tr' => 'TÃ¼rk',
            'ru' => 'PÑƒÑ?Ñ?ÐºÐ¸Ð¹',
            'uk' => 'Ð£ÐºÑ€Ð°Ñ—Ð½Ñ?ÑŒÐºÐ¸Ð¹',
            'el' => 'ÎµÎ»Î»Î·Î½Î¹ÎºÎ¬',
            'ja' => 'æ—¥æœ¬äºº',
            'hu' => 'Magyar',
            'zh_cn' => 'ä¸­å›½ï¼ˆç®€ä½“ï¼‰',
            'zh_tw' => 'ä¸­åœ‹ï¼ˆç¹?é«”ï¼‰',
            'an' => 'AragonÃ©s',
            'vi' => 'Tiáº¿ng Viá»‡t',
            'cs' => 'ÄŒeÅ¡tina',
            'uz' => 'O\'zbekiston',
            'fa_ir' => 'Ù?Ø§Ø±Ø³ÛŒ',
            'bg' => 'Ð±ÑŠÐ»Ð³Ð°Ñ€Ñ?ÐºÐ¸',
            'sk' => 'SlovenÄ?ina',
            'leet' => '1337'
        ),
        'dynamicConfigFile' => dirname(__FILE__) . '/local/_settings.php',
    ),
);
?>
