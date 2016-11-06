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
 * SpaceInviteDeclinedNotification is sent to the originator of the invite to 
 * inform him about the decline.
 *
 * @package profiler.modules.space.notifications
 * @since 0.5
 * @author Zak
 */
class SpaceInviteDeclinedNotification extends Notification {

    // Path to Web View of this Notification
    public $webView = "space.views.notifications.inviteDeclined";
    // Path to Mail Template for this notification
    public $mailView = "application.modules_core.space.views.notifications.inviteDeclined_mail";

    public static function fire($invitorUserId, $invitedUser, $space) {

        // Send Notification to owner
        $notification = new Notification();
        $notification->class = "SpaceInviteDeclinedNotification";
        $notification->user_id = $invitorUserId;
        $notification->space_id = $space->id;

        $notification->source_object_model = "User";
        $notification->source_object_id = $invitedUser->id;

        $notification->target_object_model = "Space";
        $notification->target_object_id = $space->id;

        $notification->save();
    }

    public function redirectToTarget() {
        Yii::app()->getController()->redirect($this->space->getUrl());
    }

}

?>
