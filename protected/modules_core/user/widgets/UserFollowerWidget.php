<?php

/**
 * UserFollowerWidget lists all followers of the user
 *
 * @package profiler.modules_core.user.widget
 * @since 0.5
 * @author Zak
 */
class UserFollowerWidget extends HWidget
{

    public function run()
    {
        $user = Yii::app()->getController()->getUser();

        $this->render('userFollower', array(
            'user' => $user,
        ));
    }

}

?>
