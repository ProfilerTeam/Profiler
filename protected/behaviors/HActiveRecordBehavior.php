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
 * HActiveRecordBehavior is the base behavior for all Active Record Behaviors.
 *
 * @package profiler.behaviors
 * @since 0.5
 */
class HActiveRecordBehavior extends CActiveRecordBehavior
{

    /**
     * On after construct event of an active record
     *
     * @param type $event
     */
    public function afterConstruct($event)
    {

        // Intercept this controller
        Yii::app()->interceptor->intercept($this);

        parent::afterConstruct($event);
    }

}

?>
