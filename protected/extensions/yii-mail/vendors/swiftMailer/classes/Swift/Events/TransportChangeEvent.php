<?php

/*
 * This file is part of SwiftMailer.
 * (c) 2004-2009 Zak
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

/**
 * Generated when the state of a Transport is changed (i.e. stopped/started).
 *
 * @author     Zak
 */
class Swift_Events_TransportChangeEvent extends Swift_Events_EventObject
{
    /**
     * Get the Transport.
     *
     * @return Swift_Transport
     */
    public function getTransport()
    {
        return $this->getSource();
    }
}
