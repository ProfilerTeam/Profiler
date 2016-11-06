<?php

class ProfileHeaderWidget extends HWidget
{

    protected $user;
    protected $isProfileOwner = false;


    public function init()
    {
        $this->user = $this->getController()->getUser();
        $this->isProfileOwner = (Yii::app()->user->id == $this->user->id);

        // Only include uploading javascripts on own user profiles
        if ($this->isProfileOwner) {
            $assetPrefix = Yii::app()->assetManager->publish(dirname(__FILE__) . '/../resources', true, 0, defined('YII_DEBUG'));
            Yii::app()->clientScript->registerScriptFile($assetPrefix . '/profileHeaderImageUpload.js');

            Yii::app()->clientScript->setJavascriptVariable('profileImageUploaderUrl', Yii::app()->createUrl('//user/account/profileImageUpload'));
            Yii::app()->clientScript->setJavascriptVariable('profileHeaderUploaderUrl', Yii::app()->createUrl('//user/account/bannerImageUpload'));
        }
    }

    public function run()
    {
        $this->render('profileHeader', array(
            'user' => $this->user,
            'isProfileOwner' => $this->isProfileOwner
        ));
    }

}

?>
