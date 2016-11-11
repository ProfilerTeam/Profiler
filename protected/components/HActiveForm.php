<?php

/**
 * Profiler
 *  © 2015 Profiler
 */

/**
 * Extends CActiveFrom with extra field types
 * 
 * @package profiler.components
 * @author Andi
 * @since 0.6.3
 */
class HActiveForm extends CActiveForm
{

    /**
     * Renders a datetime field for a model attribute.
     * 
     * Utilizes bootstrap-datetimepicker.js
     * @param CModel $model the data model
     * @param string $attribute the attribute
     * @param array $htmlOptions additional HTML attributes.
     * @param array $fieldOptions additional picker attributes. (see HHTML::activeDateTimeField)
     * 
     * @return string the generated input field
     */
    public function dateTimeField($model, $attribute, $htmlOptions = array(), $fieldOptions = array())
    {
        return HHtml::activeDateTimeField($model, $attribute, $htmlOptions, $fieldOptions);
    }

}
