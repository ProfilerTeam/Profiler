<?php

/**
 * UserSpacesWidget lists all public spaces of the user
 *
 * @package profiler.modules_core.user.widget
 * @since 0.5
 * @author Zak
 */
class UserSpacesWidget extends HWidget {

    public function run() {

        $showSpaces = 30;
        $spaces = array();
        $user = Yii::app()->getController()->getUser();
        $i = 0;

        foreach (SpaceMembership::GetUserSpaces($user->id) as $space) {
            if ($space->visibility == Space::VISIBILITY_NONE)
                continue;
            if ($space->status != Space::STATUS_ENABLED)
                continue;
            $i++;

            if ($i > $showSpaces)
                break;

            $spaces[] = $space;
        }

        $this->render('userSpaces', array('spaces' => $spaces));
    }

}
?>
