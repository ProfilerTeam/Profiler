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
 * GUID Behavior
 *
 * @author Zak
 * @package profiler.behaviors
 * @since 0.5
 */
class HGuidBehavior extends HActiveRecordBehavior {

    public function beforeValidate($event) {

        if ($this->getOwner()->isNewRecord) {
            if ($this->getOwner()->guid == "") {
                $this->getOwner()->guid = UUID::v4();
            }
        }

        return parent::beforeValidate($event);
    }

}

?>