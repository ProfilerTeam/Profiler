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
 * HFormImputElement for Bootstrap 3
 *
 * @author Zak
 */
class HFormInputElement extends CFormInputElement
{

    /**
     * Options for dateTimePicker Element
     * See HHTML::dateTimeField for more datails.
     * 
     * @var Array
     */
    public $dateTimePickerOptions = array();

    /**
     * @var array Core input types (alias=>CHtml method name)
     */
    public static $coreTypes = array(
        'text' => 'activeTextField',
        'hidden' => 'activeHiddenField',
        'password' => 'activePasswordField',
        'textarea' => 'activeTextArea',
        'file' => 'activeFileField',
        'radio' => 'activeRadioButton',
        'checkbox' => 'activeCheckBox',
        'listbox' => 'activeListBox',
        'dropdownlist' => 'activeDropDownList',
        'checkboxlist' => 'activeCheckBoxList',
        'radiolist' => 'activeRadioButtonList',
        'url' => 'activeUrlField',
        'email' => 'activeEmailField',
        'number' => 'activeNumberField',
        'range' => 'activeRangeField',
        'date' => 'activeDateField',
        'datetime' => 'activeDateTimeField',
    );

    /**
     * Renders the input field.
     * The default implementation returns the result of the appropriate CHtml method or the widget.
     * @return string the rendering result
     */
    public function renderInput()
    {
        if (isset(self::$coreTypes[$this->type])) {
            $method = self::$coreTypes[$this->type];
            if (strpos($method, 'List') !== false) {
                return HHtml::$method($this->getParent()->getModel(), $this->name, $this->items, $this->attributes);
            } elseif ($method == "activeDateTimeField") {
                return HHtml::activeDateTimeField($this->getParent()->getModel(), $this->name, $this->attributes, $this->dateTimePickerOptions);
            } else {
                return HHtml::$method($this->getParent()->getModel(), $this->name, $this->attributes);
            }
        } else {
            $attributes = $this->attributes;
            $attributes['model'] = $this->getParent()->getModel();
            $attributes['attribute'] = $this->name;
            ob_start();
            $this->getParent()->getOwner()->widget($this->type, $attributes);
            return ob_get_clean();
        }
    }

    public function render()
    {

        if ($this->type === 'checkbox') {
            $output = "<div class='checkbox'><label>" . $this->renderInput() . $this->getLabel() . $this->renderHint() . "</label></div>";
            return $output;
        }

        return parent::render();
    }

    public function renderHint()
    {
        return $this->hint === null ? '' : ' <p class="help-block">' . $this->hint . '</p>';
    }

}
