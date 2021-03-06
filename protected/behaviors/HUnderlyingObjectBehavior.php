<?php

/**
 * Profiler
 *  © 2015 Profiler
 */

/**
 * HUnderlyingObjectBahavior adds the ability to link between arbitrary 
 * records.
 * 
 * This is archived by the database fields object_model & object_id.
 *
 * Required database fields:
 *  - object_model
 *  - object_id
 * 
 * E.g. usage
 *      Like Record -> Post Record or Comment Record or Poll Record
 *  
 * @package profiler.behaviors
 * @since 0.5
 */
class HUnderlyingObjectBehavior extends HActiveRecordBehavior
{

    /**
     * The underlying object needs to be a "instanceof" at least one
     * of this values.
     *
     * (Its also possible to specify a CBehavior name)
     *
     * @var type
     */
    public $mustBeInstanceOf = array();

    /**
     * Cache Object
     */
    private $_cached = null;

    /*
     * Returns the Underlying Object
     *
     * @return mixed
     */

    public function getUnderlyingObject()
    {

        if ($this->_cached !== null) {
            return $this->_cached;
        }

        $className = $this->getOwner()->object_model;
        if ($className == "") {
            return null;
        }
        $object = $className::model()->findByPk($this->getOwner()->object_id);

        if ($object !== null && $this->validateUnderlyingObjectType($object)) {
            $this->_cached = $object;
            return $object;
        }

        return null;
    }

    /**
     * Sets the underlying object
     * 
     * @param mixed $object
     */
    public function setUnderlyingObject($object)
    {
        if ($this->validateUnderlyingObjectType($object)) {
            $this->_cached = $object;
        }
    }

    /**
     * Resets the already loaded $_cached instance of
     * underlying object
     */
    public function resetUnderlyingObject()
    {
        $this->_cached = null;
    }

    /**
     * Validates if given object is of allowed type
     * 
     * @param mixed $object
     * @return boolean
     */
    private function validateUnderlyingObjectType($object)
    {
        if (count($this->mustBeInstanceOf) == 0) {
            return true;
        }

        foreach ($this->mustBeInstanceOf as $instance) {
            if ($object instanceof $instance || $object->asa($instance) !== null) {
                return true;
            }
        }

        Yii::log('Got invalid underlying object type! (' . $className . ')', CLogger::LEVEL_ERROR);
        return false;
    }

}

?>
