<?php

/*
 * This file is part of SwiftMailer.
 * (c) 2004-2009 Zak
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

/**
 * TransportException thrown when an error occurs in the Transport subsystem.
 *
 * @author     Zak
 */
class Swift_TransportException extends Swift_IoException
{
    /**
     * Create a new TransportException with $message.
     *
     * @param string $message
     */
    public function __construct($message)
    {
        parent::__construct($message);
    }
}
