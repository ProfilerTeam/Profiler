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
 * If an user was invited to a workspace, this notification is fired.
 *
 * @todo Move to space module
 * @package profiler.modules_core.space.notifications
 * @since 0.5
 */
class SpaceInviteNotification extends Notification {

    public $webView = "space.views.notifications.invite";
    public $mailView = "application.modules_core.space.views.notifications.invite_mail";

    public static function fire($originatorUserId, $userId, $workspace) {


        $user = User::model()->findByPk($userId);
        $originator = User::model()->findByPk($originatorUserId);

        // Send Notification to owner
        $notification = new Notification();
        $notification->class = "SpaceInviteNotification";
        $notification->user_id = $user->id;
        $notification->space_id = $workspace->id;

        $notification->source_object_model = "User";
        $notification->source_object_id = $originator->id;

        $notification->target_object_model = "Space";
        $notification->target_object_id = $workspace->id;

        $notification->save();
    }

    /**
     * Remove notification after member had approved/declined the invite
     *
     * @param type $userId
     * @param type $workspace
     */
    public static function remove($userId, $workspace) {

        $notifications = Notification::model()->findAllByAttributes(array(
            'class' => 'SpaceInviteNotification',
            'target_object_model' => 'Space',
            'target_object_id' => $workspace->id,
            'user_id' => $userId
        ));

        foreach ($notifications as $notification) {
            $notification->delete();
        }
    }

    public function redirectToTarget() {

        $space = $this->getTargetObject();
        Yii::app()->getController()->redirect($space->getUrl());
    }

}

?>
