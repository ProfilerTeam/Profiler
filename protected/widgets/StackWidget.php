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
 * StackWidget is a widget which can hold a set of subwidgets.
 *
 * This is mainly used to build e.g. sidebars.
 * It allows adding or removing other widgets by events.
 *
 * @package profiler.widgets
 * @since 0.5
 * @author Zak
 */
class StackWidget extends CWidget {

    /**
     * Holds all added widgets
     *
     * Array
     *  [0] Classname
     *  [1] Params Arrays
     *  [2] Additional Options
     *
     * @var Array
     */
    public $widgets = array();

    /**
     * Seperator HTML Code (glue)
     *
     * @var String
     */
    public $seperator = "";

    /**
     * Template for output
     * The placeholder {content} will used to add content.
     *
     * @var String
     */
    public $template = "{content}";

    /**
     * Initializes the sidebar widget.
     */
    public function init() {

        // Intercept this controller
        Yii::app()->interceptor->intercept($this);

        // Fire Event
        if ($this->hasEventHandler('onInit'))
            $this->onInit(new CEvent($this));

        return parent::init();
    }

    /**
     * This event is raised after init is performed.
     * @param CEvent $event the event parameter
     */
    public function onInit($event) {
        $this->raiseEvent('onInit', $event);
    }

    /**
     * Runs the Navigation
     */
    public function run() {

        $content = "";

        $i = 0;
        foreach ($this->getWidgets() as $widget) {
            $i++;

            $out = $this->getController()->widget($widget[0], $widget[1], true);

            if ($out != "") {
                $content .= $out;
                if ($i != count($this->getWidgets()))
                    $content .= $this->seperator;
            }
        }

        print str_replace('{content}', $content, $this->template);
    }

    /**
     * Removes a widget from the stack
     *
     * @todo Code me!
     * @param type $className
     */
    public function removeWidget($className) {
        
    }

    /**
     * Returns all widgets by sortorder
     *
     * @return Array
     */
    protected function getWidgets() {

        usort($this->widgets, function($a, $b) {
            $sortA = (isset($a[2]['sortOrder'])) ? $a[2]['sortOrder'] : 100;
            $sortB = (isset($b[2]['sortOrder'])) ? $b[2]['sortOrder'] : 100;

            if ($sortA == $sortB) {
                return 0;
            } else if ($sortA < $sortB) {
                return -1;
            } else {
                return 1;
            }
        });

        return $this->widgets;
    }

    /**
     * Adds a new widget
     *
     * @param String $className
     * @param Array $params widget definition
     * @param Array $options extra option array with e.g. "sortOrder"
     */
    public function addWidget($className, $params = array(), $options = array()) {

        if (!isset($options['sortOrder']))
            $options['sortOrder'] = 100;

        array_push($this->widgets, array(
            $className,
            $params,
            $options
        ));
    }

}

?>
