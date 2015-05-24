<?php if ($object->content->isSticked()) : ?>
    <span class="label label-danger"><?php echo Yii::t('WallModule.widgets_views_label', 'Sticked'); ?></span>
<?php endif; ?>

<?php if ($object->content->isArchived()) : ?>
    <span class="label label-warning"><?php echo Yii::t('WallModule.widgets_views_label', 'Archived'); ?></span>
<?php endif; ?>

<?php if ($object->content->isPublic()) : ?>
    <span class="label label-success"><?php echo Yii::t('WallModule.widgets_views_label', 'Public'); ?></span>
<?php endif; ?>

