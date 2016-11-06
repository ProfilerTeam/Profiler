<?php

/**
 * The Admin Navigation for spaces
 *
 * @author Zak
 * @package profiler.modules_core.space.widgets
 * @since 0.5
 */
class SpaceAdminMenuWidget extends MenuWidget {

    public $template = "application.widgets.views.leftNavigation";

    public function init() {

// Reckon the current controller is a valid space controller
// (Needs to implement the SpaceControllerBehavior)
        $spaceGuid = Yii::app()->getController()->getSpace()->guid;
        $space = Yii::app()->getController()->getSpace();


        $this->addItemGroup(array(
            'id' => 'admin',
            'label' => Yii::t('SpaceModule.widgets_SpaceAdminMenuWidget', '<strong>Group</strong> preferences'),
            'sortOrder' => 100,
        ));

        // check user rights
        if ($space->isAdmin()) {
            $this->addItem(array(
                'label' => Yii::t('SpaceModule.widgets_SpaceAdminMenuWidget', 'General'),
                'group' => 'admin',
                'url' => Yii::app()->createUrl('//space/admin/edit', array('sguid' => $spaceGuid)),
                'icon' => '<i class="fa fa-cogs"></i>',
                'sortOrder' => 100,
                'isActive' => (Yii::app()->controller->id == "admin" && Yii::app()->controller->action->id == "edit"),
            ));
        }

        // check user rights
        if ($space->isAdmin()) {
            $this->addItem(array(
                'label' => Yii::t('SpaceModule.widgets_SpaceAdminMenuWidget', 'Members'),
                'group' => 'admin',
                'url' => Yii::app()->createUrl('//space/admin/members', array('sguid' => $spaceGuid)),
                'icon' => '<i class="fa fa-group"></i>',
                'sortOrder' => 200,
                'isActive' => (Yii::app()->controller->id == "admin" && Yii::app()->controller->action->id == "members"),
            ));
        }
#        $this->addItem(array(
#            'label' => Yii::t('SpaceModule.widgets_SpaceAdminMenuWidget', 'Delete'),
#            'url' => Yii::app()->createUrl('//space/admin/delete', array('sguid'=>$spaceGuid)),
#            'sortOrder' => 500,
#            'isActive' => (Yii::app()->controller->id == "admin" && Yii::app()->controller->action->id == "delete"),
#        ));
#        $this->addItem(array(
#            'label' => Yii::t('SpaceModule.widgets_SpaceAdminMenuWidget', 'Back to workspace'),
#            'url' => Yii::app()->createUrl('//space/space', array('sguid'=>$spaceGuid)),
#            'sortOrder' => 1000,
#        ));


        parent::init();
    }

}

?>
