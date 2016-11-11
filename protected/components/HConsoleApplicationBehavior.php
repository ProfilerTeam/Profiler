<?php

/**
 * Profiler
 *  © 2015 Profiler
 */

/**
 * HConsoleApplicationBehavior is added to all console applications.
 *
 * @author Zak
 * @package profiler.components
 * @since 0.5
 */
class HConsoleApplicationBehavior extends CBehavior {

    /**
     * Adds a null view renderer.
     *
     * @return null
     */
    public function getViewRenderer() {
        return NULL;
    }

    /**
     * Returns null theme.
     *
     * @return null
     */
    public function getTheme() {
        return NULL;
    }

}

?>
