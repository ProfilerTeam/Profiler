<ul class="nav nav-tabs wallFilterPanel" id="filter" style="display: none; background-color: #ffffff; margin-bottom: 0px;">
    <li class=" dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" href="#"><?php echo Yii::t('TasksModule.widgets_views_stream', 'Filter'); ?> <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="#" class="wallFilter" id="filter_tasks_meAssigned"><i class="fa fa-square-o"></i> <?php echo Yii::t('TasksModule.widgets_views_stream', 'Assigned to me'); ?></a></li>
            <li><a href="#" class="wallFilter" id="filter_entry_mine"><i class="fa fa-square-o"></i> <?php echo Yii::t('TasksModule.widgets_views_stream', 'Created by me'); ?></a></li>
            <li><a href="#" class="wallFilter" id="filter_tasks_open"><i class="fa fa-square-oy"></i> <?php echo Yii::t('TasksModule.widgets_views_stream', 'State is open'); ?></a></li>
            <li><a href="#" class="wallFilter" id="filter_tasks_finished"><i class="fa fa-square-o"></i> <?php echo Yii::t('TasksModule.widgets_views_stream', 'State is finished'); ?></a></li>
            <li><a href="#" class="wallFilter" id="filter_tasks_notassigned"><i class="fa fa-square-o"></i> <?php echo Yii::t('TasksModule.widgets_views_stream', 'Nobody assigned'); ?></a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><?php echo Yii::t('TasksModule.widgets_views_stream', 'Sorting'); ?> <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="#" class="wallSorting" id="sorting_c"><i class="fa fa-check-square-o"></i> <?php echo Yii::t('TasksModule.widgets_views_stream', 'Creation time'); ?></a></li>
            <li><a href="#" class="wallSorting" id="sorting_u"><i class="fa fa-square-o"></i> <?php echo Yii::t('TasksModule.widgets_views_stream', 'Last update'); ?></a></li>
        </ul>
    </li>
</ul>


<div id="taskStream">

    <!-- DIV for an normal wall stream -->
    <div class="s2_stream" style="display:none">

        <div class="s2_streamContent"></div>
        <div class="loader streamLoader"></div>

        <div class="emptyStreamMessage">
            <?php if ($this->contentContainer->canWrite()) { ?>
                <div class="placeholder placeholder-empty-stream">
                    <?php echo Yii::t('TasksModule.widgets_views_stream', '<b>There are no tasks yet!</b><br>Be the first and create one...'); ?>
                </div>
            <?php }?>
        </div>

        <div class="emptyFilterStreamMessage">
            <div class="placeholder">
                <b><?php echo Yii::t('TasksModule.widgets_views_stream', 'No tasks found which matches your current filter(s)!'); ?></b>
            </div>
        </div>

    </div>

    <!-- DIV for an single wall entry -->
    <div class="s2_single" style="display: none;">
        <a href="#" class="singleBackLink"><?php echo Yii::t('TasksModule.widgets_views_stream', 'Back to stream'); ?></a>

        <div class="s2_singleContent"></div>
        <div class="loader streamLoaderSingle"></div>

        <a href="#" class="singleBackLink"><?php echo Yii::t('TasksModule.widgets_views_stream', 'Back to stream'); ?></a>
    </div>
</div>


<script>
    // Kill current stream
    if (currentStream) {
        currentStream.clear();
    }

    s = new Stream("#taskStream", "<?php echo $startUrl; ?>", "<?php echo $reloadUrl; ?>", "<?php echo $singleEntryUrl; ?>");
    s.showStream();
    currentStream = s;

</script>
