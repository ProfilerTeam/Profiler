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
 * Form Model for changing e-mail notification settings
 * 
 * @package profiler.modules_core.user.forms
 * @since 0.6
 */
class AccountEmailingForm extends CFormModel
{

    public $receive_email_activities;
    public $receive_email_notifications;

    /**
     * Declares the validation rules.
     */
    public function rules()
    {
        return array(
            array('receive_email_activities, receive_email_notifications', 'in',
                'range' => array(
                    User::RECEIVE_EMAIL_NEVER,
                    User::RECEIVE_EMAIL_DAILY_SUMMARY,
                    User::RECEIVE_EMAIL_WHEN_OFFLINE,
                    User::RECEIVE_EMAIL_ALWAYS),
                'allowEmpty' => true
            ),
        );
    }

    /**
     * Declares customized attribute labels.
     * If not declared here, an attribute would have a label that is
     * the same as its name with the first letter in upper case.
     */
    public function attributeLabels()
    {
        return array(
            'receive_email_notifications' => Yii::t('UserModule.forms_AccountEmailingForm', 'Send notifications?'),
            'receive_email_activities' => Yii::t('UserModule.forms_AccountEmailingForm', 'Send activities?'),
        );
    }

}
