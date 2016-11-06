<?php
/**
 * This view shows the stick or unstick link for wall entries.
 * Its used by StickLinkWidget.
 *
 * @property Object $object is the target content object (e.g. Post)
 * @property String $model the model name (e.g. Post)
 * @property String $id the primary key of the model (e.g. 1)
 *
 * @package profiler.modules_core.wall
 * @since 0.5
 */
?>
<?php if ((Wall::$currentType == Wall::TYPE_SPACE || Wall::$currentType == Wall::TYPE_USER) && $object->content->canStick()) : ?>
    <li>
    <?php if ($object->content->isSticked()): ?>
        <a href="#" onClick="wallUnstick('<?php echo $model; ?>', '<?php echo $id; ?>');
                return false;"><i class="fa fa-arrow-up"></i> <?php echo Yii::t('WallModule.widgets_views_stickLink', 'Unstick'); ?></a>
       <?php else: ?>
        <a href="#" onClick="wallStick('<?php echo $model; ?>', '<?php echo $id; ?>');
                return false;"><i class="fa fa-arrow-up"></i> <?php echo Yii::t('WallModule.widgets_views_stickLink', 'Stick'); ?></a>
    <?php endif; ?>
    </li>
<?php endif; ?>