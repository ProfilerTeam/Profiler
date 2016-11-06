<?php $this->beginContent('application.modules_core.activity.views.activityLayout', array('activity' => $activity)); ?>

<?php if ($workspace != null && Wall::$currentType != Wall::TYPE_SPACE): ?>

    <?php echo Yii::t('ActivityModule.views_activities_ActivitySpaceMemberRemoved', "%displayName% left the group %spaceName%", array(
        '%displayName%' => '<strong>' . CHtml::encode($user->displayName) . '</strong>',
        '%spaceName%' => '<strong>' . CHtml::encode(Helpers::truncateText($workspace->name, 40)) . '</strong>'
    )); ?>

<?php else: ?>

    <?php echo Yii::t('ActivityModule.views_activities_ActivitySpaceMemberRemoved', "%displayName% left this group.", array(
        '%displayName%' => '<strong>' . CHtml::encode($user->displayName) . '</strong>'
    )); ?>

<?php endif; ?>

<?php $this->endContent(); ?>
