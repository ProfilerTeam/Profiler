<?php $this->beginContent('application.modules_core.notification.views.notificationLayout', array('notification' => $notification, 'iconClass' => 'fa fa-check-circle approval accepted')); ?>
<?php echo Yii::t('SpaceModule.views_notifications_inviteAccepted', '{userName} accepted your invite for the group {spaceName}', array(
    '{userName}' => '<strong>' . CHtml::encode($creator->displayName) . '</strong>',
    '{spaceName}' => '<strong>' . CHtml::encode($targetObject->name) . '</strong>'
)); ?>
<?php $this->endContent(); ?>