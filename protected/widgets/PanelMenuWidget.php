<?php

class PanelMenuWidget extends HWidget
{

    /**
     * @var String unique id from panel element
     */
    public $id = "";

    /**
     * Workaround to inject menu items to PanelMenu
     * 
     * @deprecated since version 0.9
     * @internal description
     * @var String 
     */
    public $extraMenus = "";

    public function init()
    {
        $assetPrefix = Yii::app()->assetManager->publish(dirname(__FILE__) . '/resources', true, 0, defined('YII_DEBUG'));
        Yii::app()->clientScript->registerScriptFile($assetPrefix . '/panelMenu.js', CClientScript::POS_BEGIN);

        return parent::init();
    }

    /**
     * Displays / Run the Widgets
     */
    public function run()
    {


        $this->render('panelMenu', array(
            'id' => $this->id,
            'extraMenus' => $this->extraMenus,
        ));
    }

}

?>