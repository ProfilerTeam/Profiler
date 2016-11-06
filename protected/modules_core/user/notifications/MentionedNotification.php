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
 * MentionedNotification is fired to all users which are mentionied 
 * in a HActiveRecordContent or HActiveRecordContentAddon
 */
class MentionedNotification extends Notification
{

    // Path to Web View of this Notification
    public $webView = "user.views.notifications.Mentioned";
    // Path to Mail Template for this notification
    public $mailView = "application.modules_core.user.views.notifications.Mentioned_mail";

}

?>
