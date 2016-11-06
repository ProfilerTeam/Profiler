<?php

/**
 * @package profiler.modules_core.admin
 * @since 0.5
 */
class AdminModule extends HWebModule
{

    public $isCoreModule = true;

    public function init()
    {

        $this->setImport(array(
            'admin.models.*',
            'admin.forms.*',
            'admin.libs.*',
            'admin.*',
        ));
    }

    /**
     * On Init of Dashboard Sidebar, add the approve notification widget
     *
     * @param type $event
     */
    public static function onDashboardSidebarInit($event)
    {
        if (Yii::app()->user->canApproveUsers()) {
            $event->sender->addWidget('application.modules_core.admin.widgets.ApprovalDashboardWidget', array(), array('sortOrder' => 99));
        }
    }

}
