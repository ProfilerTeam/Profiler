<p><?php echo Yii::t('AdminModule.views_module_header', 'Work In Progress Modules outsourced from other open-source scripts, only for Zak!')?></p>
<hr/>
<ul class="nav nav-pills" id="moduleTabs">
    <li <?php if ($this->action->id == 'list') echo 'class="active"'; ?>><?php echo CHtml::link(Yii::t('AdminModule.views_module_header', 'Installed'), $this->createUrl('list')); ?></li>
</ul>

