<?php

class SpacePickerWidget extends HWidget {

    /**
     * Id of input element which should replaced
     *
     * @var type
     */
    public $inputId = "";

    /**
     * JSON Search URL - default: browse/searchJson
     * 
     * The token -keywordPlaceholder- will replaced by the current search query.
     * 
     * @var String Url with -keywordPlaceholder-
     */
    public $spaceSearchUrl = "";

    /**
     * Maximum spaces
     *
     * @var type
     */
    public $maxSpaces = 10;

    /**
     * @var CModel the data model associated with this widget.
     */
    public $model = null;

    /**
     * @var string the attribute associated with this widget.
     * The name can contain square brackets (e.g. 'name[1]') which is used to collect tabular data input.
     */
    public $attribute = null;

    /**
     * Inits the User Picker
     *
     */
    public function init() {
        if ($this->spaceSearchUrl == "")
            $this->spaceSearchUrl = Yii::app()->getController()->createUrl('//space/browse/searchJson', array('keyword' => '-keywordPlaceholder-'));

        $assetPrefix = Yii::app()->assetManager->publish(dirname(__FILE__) . '/../resources', true, 0, defined('YII_DEBUG'));
        Yii::app()->clientScript->registerScriptFile($assetPrefix . '/spacepicker.js');
    }

    /**
     * Displays / Run the Widgets
     */
    public function run() {

        // Try to get current field value, when model & attribute attributes are specified.
        $currentValue = "";
        if ($this->model != null && $this->attribute != null) {
            $attribute = $this->attribute;
            $currentValue = $this->model->$attribute;
        }

        $this->render('spacePicker', array(
            'spaceSearchUrl' => $this->spaceSearchUrl,
            'maxSpaces' => $this->maxSpaces,
            'currentValue' => $currentValue,
            'inputId' => $this->inputId,
        ));
    }

}

?>
