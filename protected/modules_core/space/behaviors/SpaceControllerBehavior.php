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
 * SpaceControllerBehavior is a controller behavior used for space modules/controllers.
 *
 * @author Zak
 * @package profiler.modules_core.space.behaviors
 * @since 0.6
 */
class SpaceControllerBehavior extends CBehavior
{

    public $space = null;

    /**
     * Returns the current selected space by parameter guid
     *
     * If space doesnt exists or there a no permissions and exception
     * will thrown.
     *
     * @return Space
     */
    public function getSpace()
    {

        if ($this->space != null) {
            return $this->space;
        }

        // Get Space GUID by parameter
        $guid = Yii::app()->request->getQuery('sguid');
        if ($guid == "") {
            // Workaround for older version
            $guid = Yii::app()->request->getQuery('guid');
        }

        // Try Load the space
        $this->space = Space::model()->findByAttributes(array('guid' => $guid));
        if ($this->space == null)
            throw new CHttpException(404, Yii::t('SpaceModule.behaviors_SpaceControllerBehavior', 'Space not found!'));

        $this->checkAccess();

        // Store current space to stash
        Yii::app()->params['currentSpace'] = $this->space;

        return $this->space;
    }

    public function checkAccess() {
        
        // Save users last action on this space
        $membership = $this->space->getMembership(Yii::app()->user->id);
        if ($membership != null) {
            $membership->updateLastVisit();
        } else {

            // Super Admin can always enter
            if (!Yii::app()->user->isAdmin()) {
                // Space invisible?
                if ($this->space->visibility == Space::VISIBILITY_NONE) {
                    // Not Space Member
                    throw new CHttpException(404, Yii::t('SpaceModule.behaviors_SpaceControllerBehavior', 'Space is invisible!'));
                }
            }
        }

        // Delete all pending notifications for this space
        $notifications = Notification::model()->findAllByAttributes(array('space_id' => $this->space->id, 'user_id' => Yii::app()->user->id), 'seen != 1');
        foreach ($notifications as $n) {
            // Ignore Approval Notifications
            if ($n->class == "SpaceApprovalRequestNotification" || $n->class == "SpaceInviteNotification") {
                continue;
            }
            $n->seen = 1;
            $n->save();
        }
        
        
    }

    /**
     * Create a space url
     * 
     * @deprecated since version 0.9
     * @param type $route
     * @param type $params
     * @param type $ampersand
     * @return type
     */
    public function createSpaceUrl($route, $params = array(), $ampersand = '&')
    {
        return $this->space->createUrl($route, $params, $ampersand);
    }

}

?>
