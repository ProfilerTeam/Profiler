<?php

/**
 * Profiler
 *  © 2015 Profiler
 */

/**
 * WebApplication is the base WebApplication class
 *
 * @author Zak
 * @package profiler.components
 * @since 0.5
 */
class WebApplication extends CWebApplication
{

    /**
     * Inits the webapplication
     *
     * Also start interceptor to add event support
     */
    protected function init()
    {

        parent::init();

        $this->interceptor->start();
        $this->moduleManager->start();

        $this->interceptor->intercept($this);

        if ($this->hasEventHandler('onInit'))
            $this->onInit(new CEvent($this));
    }

    /**
     * This event is raised after the init is executed.
     * @param CEvent $event the event parameter
     */
    public function onInit($event)
    {
        $this->raiseEvent('onInit', $event);
    }

    /**
     * Returns an array of available language codes
     *
     * @return Array
     */
    public static function getLanguages()
    {

        $languages = array();
        $languages['en'] = 'en';

        $files = scandir(Yii::app()->basePath . '/messages');
        foreach ($files as $file) {
            if ($file == '.' || $file == '..')
                continue;
            $languages[$file] = $file;
        }
        return $languages;
    }

}

?>
