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
 * UserSettingBehavior is a helper for User models to acccess corresponding 
 * UserSetting models.
 * 
 * @since 0.6
 * @author Zak
 */
class UserSettingBehavior extends CActiveRecordBehavior
{

    /**
     * Get an UserSetting Value
     * 
     * @param String $name of setting
     * @param String $moduleId of setting
     * @param String $default value when no setting exists
     * @return String
     */
    public function getSetting($name, $moduleId = "core", $default = "")
    {
        return UserSetting::Get($this->getOwner()->id, $name, $moduleId, $default);
    }

    /**
     * Sets an UserSetting
     * 
     * @param String $name
     * @param String $value
     * @param String $moduleId
     */
    public function setSetting($name, $value, $moduleId = "")
    {
        UserSetting::Set($this->getOwner()->id, $name, $value, $moduleId);
    }

}
