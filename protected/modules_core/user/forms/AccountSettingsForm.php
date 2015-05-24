<?php

class AccountSettingsForm extends CFormModel
{

    public $tags;
    public $language;
    public $show_introduction_tour;

    /**
     * Declares the validation rules.
     */
    public function rules()
    {
        return array(
            array('language', 'length', 'max' => 5),
            array('tags', 'length', 'max' => 100),
            array('show_introduction_tour', 'numerical', 'integerOnly' => true),            
            array('language', 'match', 'not' => true, 'pattern' => '/[^a-zA-Z_]/', 'message' => Yii::t('UserModule.forms_AccountSettingsForm', 'Invalid language!')),
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
            'tags' => Yii::t('UserModule.forms_AccountSettingsForm', 'Tags'),
            'language' => Yii::t('UserModule.forms_AccountSettingsForm', 'Language'),
            'show_introduction_tour' => Yii::t('UserModule.forms_AccountSettingsForm', 'Hide panel on dashboard'),
        );
    }

}
