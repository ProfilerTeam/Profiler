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
 * SpaceSettingBehavior is a helper for Space models to acccess corresponding 
 * SpaceSetting models.
 * 
 * @since 0.6
 * @author Zak
 */
class SpaceSettingBehavior extends CActiveRecordBehavior
{

    /**
     * Get an SpaceSetting Value
     * 
     * @param String $name of setting
     * @param String $moduleId of setting
     * @param String $default value when no setting exists
     * @return String
     */
    public function getSetting($name, $moduleId = "core", $default = "")
    {
        return SpaceSetting::Get($this->getOwner()->id, $name, $moduleId, $default);
    }

    /**
     * Sets an SpaceSetting
     * 
     * @param String $name
     * @param String $value
     * @param String $moduleId
     */
    public function setSetting($name, $value, $moduleId = "")
    {
        SpaceSetting::Set($this->getOwner()->id, $name, $value, $moduleId);
    }

}
