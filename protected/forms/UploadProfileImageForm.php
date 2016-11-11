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
 * UploadProfileImageForm allows uploads of profile images.
 *
 * Profile images will used by spaces or users.
 *
 * @package profiler.forms
 * @since 0.5
 */
class UploadProfileImageForm extends CFormModel {

    /**
     * @var String uploaded image
     */
    public $image;

    /**
     * Declares the validation rules.
     *
     * @return Array Validation Rules
     */
    public function rules() {
        return array(
            array('image', 'required'),
            array('image', 'file', 'types' => 'jpg, png, jpeg, tiff', 'maxSize' => 3 * 1024 * 1024),
        );
    }

    /**
     * Declares attribute labels.
     */
    public function attributeLabels() {
        return array(
            'image' => Yii::t('base', 'New profile image'),
        );
    }

}
