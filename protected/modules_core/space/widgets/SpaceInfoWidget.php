<?php

/**
 * This widget will added to the sidebar and show infos about the current selected space
 *
 * @author Zak
 * @package profiler.modules_core.space.widgets
 * @since 0.5
 */
class SpaceInfoWidget extends HWidget
{

    //public $template = "application.widgets.views.leftNavigation";

    public function run()
    {
        $this->render('spaceInfo', array('space' => Yii::app()->getController()->getSpace()));
    }

}

?>