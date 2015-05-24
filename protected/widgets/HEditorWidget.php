<?php

class HEditorWidget extends HWidget
{

    /**
     * Id of input element which should replaced
     *
     * @var string
     */
    public $id = "";

    /**
     * JSON Search URL
     */
    public $searchUrl = "//search/mentioning";


    public $inputContent = "";


    /**
     * Inits the widget
     *
     */
    public function init()
    {

        // load resources
        $assetPrefix = Yii::app()->assetManager->publish(dirname(__FILE__) . '/resources/at', true, 0, defined('YII_DEBUG'));
        
        Yii::app()->clientScript->registerScriptFile($assetPrefix . '/jquery.caret.min.js');
        Yii::app()->clientScript->registerScriptFile($assetPrefix . '/jquery.atwho.min.js');
        Yii::app()->clientScript->registerCssFile($assetPrefix . '/jquery.atwho.css');

        $this->inputContent = HHtml::translateEmojis($this->inputContent);
        $this->inputContent = HHtml::translateMentioning($this->inputContent);
        $this->inputContent = nl2br($this->inputContent);

    }

    public function run() {

        // render heditor view
        $this->render('heditor', array('id' => $this->id, 'userSearchUrl' => $this->searchUrl, 'inputContent' => $this->inputContent));

    }

}
