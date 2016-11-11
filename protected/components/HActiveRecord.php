<?php

/**
 * Profiler
 *  © 2015 Profiler
 */

/**
 * HActiveRecord is an extended version of the CActiveRecord.
 *
 * Each HActiveRecord has some extra meta database fields like:
 *  - created by
 *  - created_at
 *  - updated_by
 *  - updated_at
 *
 * The underlying HActiveRecord table must have these fields.
 *
 * @package profiler.components
 * @since 0.5
 */
abstract class HActiveRecord extends CActiveRecord
{

    // Avoid Errors when fields not exists
    public $created_at;
    public $created_by;
    public $updated_at;
    public $updated_by;

    /**
     * Inits the active records and registers the event interceptor
     */
    public function init()
    {

        parent::init();

        // Intercept this controller
        Yii::app()->interceptor->intercept($this);
    }

    /**
     * Prepares create_time, create_user_id, update_time and update_user_id attributes before performing validation.
     */
    protected function beforeValidate()
    {

        // Check if we got an user object
        if (isset(Yii::app()->user)) {
            $userId = Yii::app()->user->id;
        } else {
            $userId = 0;
        }


        if ($this->isNewRecord) {
            // set the create date, last updated date and the user doing the creating
            $this->created_at = $this->updated_at = new CDbExpression('NOW()');
            if ($this->created_by == "")
                $this->created_by = $userId;
        }
        
        if ($userId != 0) {
            //not a new record, so just set the last updated time and last updated user id
            $this->updated_at = new CDbExpression('NOW()');
            $this->updated_by = $userId;
        }


        return parent::beforeValidate();
    }

    /**
     * Returns the creator user of this active record
     * (Faster than relation() because cached).
     *
     * @return User
     */
    public function getCreator()
    {
        return User::model()->findByPk($this->created_by);
    }

    /**
     * Returns the updater user of this active record
     * (Faster than relation() because cached).
     *
     * @return User
     */
    public function getUpdater()
    {
        return User::model()->findByPk($this->updated_by);
    }

    /**
     * Returns a unique id for this record
     *
     * @return String Unique Id of this record
     */
    public function getUniqueId()
    {
        return get_class($this) . "_" . $this->id;
    }

}
