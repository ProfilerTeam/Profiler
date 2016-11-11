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
 * SelfTest is a helper class which checks all dependencies of the application.
 *
 * @package profiler.libs
 * @since 0.5
 * @author Zak
 */
class SelfTest {

    /**
     * Get Results of the Application SelfTest.
     *
     * Fields
     *  - title
     *  - state (OK, WARNING or ERROR)
     *  - hint
     *
     * @return Array
     */
    public static function getResults() {
        /**
         * ['title']
         * ['state']    = OK, WARNING, ERROR
         * ['hint']
         */
        $checks = array();

        // Checks PHP Version
        $title = 'PHP - Version - ' . PHP_VERSION;
        # && version_compare(PHP_VERSION, '5.9.0', '<')
        if (version_compare(PHP_VERSION, '5.4.0', '>=')) {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'OK'
            );
        } elseif (version_compare(PHP_VERSION, '5.4.0', '<=')) {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'WARNING',
                'hint' => 'Untested on this version!'
            );
        } else {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'ERROR',
                'hint' => 'Minimum 5.3'
            );
        }

        // Checks GD Extension
        $title = 'PHP - GD Extension';
        if (function_exists('gd_info')) {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'OK'
            );
        } else {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'ERROR',
                'hint' => 'Install GD Extension'
            );
        }

        // Checks CURL Extension
        $title = 'PHP - Multibyte String Functions';
        if (function_exists('mb_substr')) {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'OK'
            );
        } else {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'ERROR',
                'hint' => 'Install PHP Multibyte Extension'
            );
        }

        // Checks CURL Extension
        $title = 'PHP - Curl Extension';
        if (function_exists('curl_version')) {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'OK'
            );
        } else {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'ERROR',
                'hint' => 'Install Curl Extension'
            );
        }

        // Checks LDAP Extension
        $title = 'PHP - LDAP Support';
        if (function_exists('ldap_bind')) {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'OK'
            );
        } else {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'WARNING',
                'hint' => 'Optional - Install LDAP Extension for LDAP Support'
            );
        }

        // Checks APC Extension
        $title = 'PHP - APC Support';
        if (function_exists('apc_add')) {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'OK'
            );
        } else {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'WARNING',
                'hint' => 'Optional - Install APC Extension for APC Caching'
            );
        }

        // Checks SQLite3 Extension
        $title = 'PHP - SQLite3 Support';
        if (class_exists('SQLite3')) {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'OK'
            );
        } else {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'WARNING',
                'hint' => 'Optional - Install SQLite3 Extension for DB Caching'
            );
        }

        // Checks Writeable Config
        $title = 'Permissions - Config';
        $configFile = dirname(Yii::app()->params['dynamicConfigFile']);
        if (is_writeable($configFile)) {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'OK'
            );
        } else {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'ERROR',
                'hint' => 'Make ' . $configFile . " writable for the webserver/php!"
            );
        }


        // Check Runtime Directory
        $title = 'Permissions - Runtime';
        if (is_writeable(Yii::app()->runtimePath)) {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'OK'
            );
        } else {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'ERROR',
                'hint' => 'Make ' . $path . " writable for the webserver/php!"
            );
        }

        // Check Assets Directory
        $title = 'Permissions - Assets';
        $path = Yii::getPathOfAlias('webroot') . DIRECTORY_SEPARATOR . "assets";
        if (is_writeable($path)) {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'OK'
            );
        } else {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'ERROR',
                'hint' => 'Make ' . $path . " writable for the webserver/php!"
            );
        }


        // Check Uploads Directory
        $title = 'Permissions - Uploads';
        $path = Yii::getPathOfAlias('webroot') . DIRECTORY_SEPARATOR . "uploads";
        if (is_writeable($path)) {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'OK'
            );
        } else {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'ERROR',
                'hint' => 'Make ' . $path . " writable for the webserver/php!"
            );
        }

        // Check Custom Modules Directory
        $title = 'Permissions - Module Directory';
        $path = Yii::getPathOfAlias('application.modules');
        if (is_writeable($path)) {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'OK'
            );
        } else {
            $checks[] = array(
                'title' => Yii::t('base', $title),
                'state' => 'ERROR',
                'hint' => 'Make ' . $path . " writable for the webserver/php!"
            );
        }        
        
        return $checks;
    }

}

?>
