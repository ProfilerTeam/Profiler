<?php

/**
 * StatusStreamWidget shows the current status of Profiler on the dashboard sidebar
 *
 * @author Zak
 * @package profiler.modules_core.activity
 * @since 0.5
 */
class StatusStreamWidget extends HWidget {

    protected $themePath = 'modules/activity';

    /**
     * @var String type of activity stream (dashboard, space, user)
     */
    public $type;

    /**
     * @var String guid of space or user
     */
    public $guid;

    /**
     * Inits the activity stream widget
     */
    public function init() {
        $assetPrefix = Yii::app()->assetManager->publish(dirname(__FILE__) . '/../resources', true, 0, defined('YII_DEBUG'));
        Yii::app()->clientScript->registerScriptFile($assetPrefix . '/activies.js');
    }

    /**
     * Runs the activity widget
     */
    public function run() {

        // Save Wall Type
        Wall::$currentType = $this->type;

        $javascriptVariablePass = "var activityReloadUrl = '" . Yii::app()->createUrl('//wall/wall/streamActivity', array('type' => $this->type, 'guid' => $this->guid, 'limit' => 10, 'from' => 'lastEntryId')) . "';\n";
        $javascriptVariablePass .= "var activityStartUrl = '" . Yii::app()->createUrl('//wall/wall/streamActivity', array('type' => $this->type, 'guid' => $this->guid, 'limit' => 10)) . "';\n";
        $javascriptVariablePass .= "var activityPermaLinkUrl = '" . Yii::app()->createUrl('//wall/perma/wallEntry') . "';\n";

        Yii::app()->clientScript->registerScript('activityUrls', $javascriptVariablePass, CClientScript::POS_BEGIN);

        $this->render('statusStream', array());
    }

}

?>