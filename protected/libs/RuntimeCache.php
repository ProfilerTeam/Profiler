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
 * Simple class that holds some information at runtime
 *
 * @package profiler.libs
 * @since 0.5
 */
class RuntimeCache {

    /**
     *
     * @var Array holds all "cached" Informations
     */
    static $data = array();

    /**
     * Removes an item
     *
     * @param type $key
     */
    static public function Remove($key) {
        if (isset(self::$data[$key]))
            unset(self::$data[$key]);
    }

    /**
     * Returns an item
     *
     * @param type $key
     * @return mixed is the cached object
     */
    static public function get($key) {
        if (isset(self::$data[$key]))
            return self::$data[$key];

        return false;
    }

    /**
     * Sets an new item
     *
     * @param type $key
     * @param mixed $value
     */
    static public function set($key, $val) {
        self::$data[$key] = $val;
    }

}

?>
