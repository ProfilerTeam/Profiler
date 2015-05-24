<?php

class SearchMenuWidget extends HWidget {

    public function init() {
        // publish resource files
        $assetPrefix = Yii::app()->assetManager->publish(dirname(__FILE__) . '/resources', true, 0, defined('YII_DEBUG'));
        Yii::app()->clientScript->registerScriptFile($assetPrefix . '/searchmenu.js');
        Yii::app()->clientScript->setJavaScriptVariable('searchAjaxUrl', $this->createUrl('//search/index', array('mode'=>'quick', 'keyword'=>'-searchKeyword-')));
    }

    /**
     * Displays / Run the Widgets
     */
    public function run() {
        $this->render('searchMenu', array());
    }

}
