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
 * Form Model for account deletion
 * 
 * @package profiler.modules_core.user.forms
 * @since 0.5
 */
class AccountDeleteForm extends CFormModel {

    public $currentPassword;

    /**
     * Declares the validation rules.
     */
    public function rules() {
        return array(
            array('currentPassword', 'required'),
            array('currentPassword', 'CheckPasswordValidator'),
        );
    }

    /**
     * Declares customized attribute labels.
     * If not declared here, an attribute would have a label that is
     * the same as its name with the first letter in upper case.
     */
    public function attributeLabels() {
        return array(
            'currentPassword' => Yii::t('UserModule.forms_AccountDeleteForm', 'Your password'),
        );
    }

}
