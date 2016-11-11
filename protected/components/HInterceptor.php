<?php

/**
 * Profiler
 *  © 2015 Profiler
 */

/**
 * HInterceptor allows modules to attach events and behaviors to all SIComponents.
 *
 * @author Zak
 * @package profiler.components
 * @since 0.5
 */
class HInterceptor extends CApplicationComponent {

    /**
     * @var Array list of events and callbacks
     */
    private $events = array();

    /**
     * Starts interceptor service
     */
    public function start() {
        
    }

    /**
     * Intercepts a given object instance
     *
     * @param Object $obj
     */
    public function intercept($obj) {

        // Attach Event Handler for this class
        $className = get_class($obj);
        if (isset($this->events[$className])) {
            foreach ($this->events[$className] as $event) {
                $obj->attachEventHandler($event[0], $event[1]);
            }
        }

        // Install also for parent classes
        $parentClassName = get_parent_class($className);
        while ($parentClassName !== false) {
            if (isset($this->events[$parentClassName])) {
                foreach ($this->events[$parentClassName] as $event) {
                    $obj->attachEventHandler($event[0], $event[1]);
                }
            }
            $parentClassName = get_parent_class($parentClassName);
        }
    }

    /**
     * Pre-Attaches an event handler to an event of a class.
     * 
     * After the class is instanciated the given event handler will be attached.
     * 
     * An event handler must be a valid PHP callback, i.e., a string referring to
     * a global function name, or an array containing two elements with
     * the first element being an object and the second element a method name
     * of the object.
     *
     * @param String $className
     * @param String $eventName
     * @param callback $handler the event handler
     */
    public function preattachEventHandler($className, $eventName, $handler = null) {

        if (!isset($this->events[$className]))
            $this->events[$className] = array();

        $this->events[$className][] = array($eventName, $handler);
    }

}

?>
