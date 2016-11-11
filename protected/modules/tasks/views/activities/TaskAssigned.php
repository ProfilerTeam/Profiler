<?php $this->beginContent('application.modules_core.activity.views.activityLayout', array('activity' => $activity)); ?>
<?php

echo Yii::t('TasksModule.views_activities_TaskAssigned', '{userName} assigned to task {task}.', array(
    '{userName}' => '<strong>' . CHtml::encode($user->displayName) . '</strong>',
    '{task}' => '<strong>' . ActivityModule::formatOutput($target->getContentTitle()) . '</strong>'
));
?>
<?php $this->endContent(); ?>