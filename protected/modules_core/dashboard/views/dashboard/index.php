<div class="container">
    <div class="alert alert-success">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        <strong>Status:</strong> Profiler is currently being revamped! (Version <?php echo Yii::app()->params['version']; ?>)
    </div>
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">
					<?php echo Yii::t('DashboardModule.views_dashboard_index', 'Your Feed'); ?>
				</div>
            <?php $this->widget('application.modules_core.post.widgets.PostFormWidget', array('contentContainer' => Yii::app()->user->model)); ?>
            <?php
            $this->widget('application.modules_core.wall.widgets.WallStreamWidget', array(
                'type' => Wall::TYPE_DASHBOARD
            ));
            ?>
        </div>
    </div>
                <div class="col-md-4">
            <?php
            if(Yii::app()->params['statusShown'] === true) {
                $this->widget('application.modules_core.dashboard.widgets.DashboardSidebarWidget', array(
                    'widgets' => array(
                        array('application.modules_core.activity.widgets.ActivityStreamWidget', array('type' => Wall::TYPE_DASHBOARD), array('sortOrder' => 10)),
                        array('application.modules_core.activity.widgets.StatusStreamWidget', array('type' => Wall::TYPE_DASHBOARD), array('sortOrder' => 100)),
                    )
                ));
            }
            else {
                $this->widget('application.modules_core.dashboard.widgets.DashboardSidebarWidget', array(
                    'widgets' => array(
                        array('application.modules_core.activity.widgets.ActivityStreamWidget', array('type' => Wall::TYPE_DASHBOARD), array('sortOrder' => 10)),
                    )
                ));
            }
            ?>
        </div>
    </div>

</div>
