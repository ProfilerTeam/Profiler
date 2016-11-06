<?php

/**
 * @package profiler.modules_core.admin.forms 
 * @since 0.5
 */
class BasicSettingsForm extends CFormModel {

    public $name;
    public $baseUrl;
    public $defaultLanguage;
    public $defaultSpaceGuid;
    public $tour;

    /**
     * Declares the validation rules.
     */
    public function rules() {
        return array(
            array('name, baseUrl', 'required'),
            array('name', 'length', 'max' => 150),
            array('defaultLanguage', 'in', 'range' => array_keys(Yii::app()->params['availableLanguages'])),
            array('defaultSpaceGuid', 'checkSpaceGuid'),
            array('tour', 'safe'),
        );
    }

    /**
     * Declares customized attribute labels.
     * If not declared here, an attribute would have a label that is
     * the same as its name with the first letter in upper case.
     */
    public function attributeLabels() {
        return array(
            'name' => Yii::t('AdminModule.forms_BasicSettingsForm', 'Name of the application'),
            'baseUrl' => Yii::t('AdminModule.forms_BasicSettingsForm', 'Base URL'),
            'defaultLanguage' => Yii::t('AdminModule.forms_BasicSettingsForm', 'Default language'),
            'defaultSpaceGuid' => Yii::t('AdminModule.forms_BasicSettingsForm', 'Default group'),
            'tour' => Yii::t('AdminModule.forms_BasicSettingsForm', 'Show introduction tour for new users')
        );
    }

    /**
     * This validator function checks the defaultSpaceGuid.
     *
     * @param type $attribute
     * @param type $params
     */
    public function checkSpaceGuid($attribute, $params) {

        if ($this->defaultSpaceGuid != "") {

            foreach (explode(',', $this->defaultSpaceGuid) as $spaceGuid) {
                if ($spaceGuid != "") {
                    $space = Space::model()->findByAttributes(array('guid' => $spaceGuid));
                    if ($space == null) {
                        $this->addError($attribute, Yii::t('AdminModule.forms_BasicSettingsForm', "Invalid group"));
                    }
                }
            }
        }
    }

}
