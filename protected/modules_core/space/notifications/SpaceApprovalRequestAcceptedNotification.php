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
 * SpaceApprovalRequestAcceptedNotification
 *
 * @package profiler.modules_core.space.notifications
 * @since 0.5
 * @todo Move to space module
 */
class SpaceApprovalRequestAcceptedNotification extends Notification {

    public $webView = "space.views.notifications.approvalRequestAccepted";
    public $mailView = "application.modules_core.space.views.notifications.approvalRequestAccepted_mail";

    public static function fire($approverUserId, $requestor, $workspace) {
        // Send Notification to owner
        $notification = new Notification();
        $notification->class = "SpaceApprovalRequestAcceptedNotification";
        $notification->user_id = $requestor->id;
        $notification->space_id = $workspace->id;

        $notification->source_object_model = "User";
        $notification->source_object_id = $approverUserId;

        $notification->target_object_model = "Space";
        $notification->target_object_id = $workspace->id;

        $notification->save();
    }

    public function redirectToTarget() {

        $space = $this->getTargetObject();
        Yii::app()->getController()->redirect($space->getUrl());
    }

}

?>