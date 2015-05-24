<?php

/*
 * This file is part of SwiftMailer.
 * (c) 2004-2009 Zak
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

/**
 * Logs events in the Transport system.
 *
 * @author     Zak
 */
interface Swift_Plugins_Logger
{
    /**
     * Add a log entry.
     *
     * @param string $entry
     */
    public function add($entry);

    /**
     * Clear the log contents.
     */
    public function clear();

    /**
     * Get this log as a string.
     *
     * @return string
     */
    public function dump();
}
