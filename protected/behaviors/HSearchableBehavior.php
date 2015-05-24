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
 * Searchable Behavior
 * 
 *
 * @author Zak
 * @package profiler.behaviors
 * @since 0.5
 */
class HSearchableBehavior extends HActiveRecordBehavior {

    public function afterSave($event) {

        if ($this->getOwner() instanceof ISearchable) {

            if (!$this->getOwner()->isNewRecord)
                HSearch::getInstance()->deleteModel($this->getOwner());

            HSearch::getInstance()->addModel($this->getOwner());
        }

        parent::afterSave($event);
    }

    public function afterDelete($event) {

        if ($this->getOwner() instanceof ISearchable) {
            HSearch::getInstance()->deleteModel($this->getOwner());
        }

        parent::afterDelete($event);
    }

}

?>