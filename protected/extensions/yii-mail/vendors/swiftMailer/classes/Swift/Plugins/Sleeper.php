<?php

/*
 * This file is part of SwiftMailer.
 * (c) 2004-2009 Zak
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

/**
 * Sleeps for a duration of time.
 *
 * @author     Zak
 */
interface Swift_Plugins_Sleeper
{
    /**
     * Sleep for $seconds.
     *
     * @param int     $seconds
     */
    public function sleep($seconds);
}
