<?php

class ProfileMenuWidget extends MenuWidget {

    public $template = "application.widgets.views.leftNavigation";

    public function init() {

        // Reckon the current controller is a valid profile controller
        // (Needs to implement the ProfileControllerBehavior)
        $userGuid = Yii::app()->getController()->getUser()->guid;

        $this->addItemGroup(array(
            'id' => 'profile',
            'label' => Yii::t('UserModule.widgets_ProfileMenuWidget', '<strong>Profile</strong> menu'),
            'sortOrder' => 100,
        ));


        $this->addItem(array(
            'label' => Yii::t('UserModule.widgets_ProfileMenuWidget', 'Feed'),
            'group' => 'profile',
            'url' => Yii::app()->createUrl('//user/profile', array('uguid' => $userGuid)),
            'sortOrder' => 200,
            'isActive' => (Yii::app()->controller->id == "profile" && Yii::app()->controller->action->id == "index"),
        ));

        //if (Yii::app()->getController()->getUser()->profile->about != "") {
            $this->addItem(array(
                'label' => Yii::t('UserModule.widgets_ProfileMenuWidget', 'About'),
                'group' => 'profile',
                'url' => Yii::app()->createUrl('//user/profile/about', array('uguid' => $userGuid)),
                'sortOrder' => 300,
                'isActive' => (Yii::app()->controller->id == "profile" && Yii::app()->controller->action->id == "about"),
            ));
        //}

        parent::init();
    }

}

?>
