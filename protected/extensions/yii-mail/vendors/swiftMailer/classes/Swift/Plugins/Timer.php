<?php

/*
 * This file is part of SwiftMailer.
 * (c) 2004-2009 Zak
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

/**
 * Provides timestamp data.
 *
 * @author     Zak
 */
interface Swift_Plugins_Timer
{
    /**
     * Get the current UNIX timestamp.
     *
     * @return int
     */
    public function getTimestamp();
}
