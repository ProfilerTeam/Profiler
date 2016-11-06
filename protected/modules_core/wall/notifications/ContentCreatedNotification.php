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
 * ContentCreatedNotification is fired to all users which are manually selected 
 * in ContentFormWidget to receive a notification.
 */
class ContentCreatedNotification extends Notification
{

    // Path to Web View of this Notification
    public $webView = "wall.views.notifications.ContentCreated";
    // Path to Mail Template for this notification
    public $mailView = "application.modules_core.wall.views.notifications.ContentCreated_mail";

}

?>
