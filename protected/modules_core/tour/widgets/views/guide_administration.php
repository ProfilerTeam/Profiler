<script type="text/javascript">


    // Create a new tour
    var administrationTour = new Tour({
        storage: false,
        template: '<div class="popover tour"> <div class="arrow"></div> <h3 class="popover-title"></h3> <div class="popover-content"></div> <div class="popover-navigation"> <div class="btn-group"> <button class="btn btn-sm btn-default" data-role="prev"><?php echo Yii::t('TourModule.base', '« Prev'); ?></button> <button class="btn btn-sm btn-default" data-role="next"><?php echo Yii::t('TourModule.base', 'Next »'); ?></button>  </div> <button class="btn btn-sm btn-default" data-role="end"><?php echo Yii::t('TourModule.base', 'End guide'); ?></button> </div> </div>',
        name: 'administration',
        onEnd: function (tour) {
            tourCompleted();
        }
    });


    // Add tour steps
    administrationTour.addSteps([
        {
            orphan: true,
            backdrop: true,
            title: <?php echo json_encode(Yii::t('TourModule.widgets_views_guide_administration', '<strong>Administration</strong>')); ?>,
            content: <?php echo json_encode(Yii::t('TourModule.widgets_views_guide_administration', "Hey! You're probably a new admin on the Profiler team.<br><br>This guide will give you all the info you need to operate the site correctly.")); ?>
        },
        {
            element: ".list-group-item.users",
            title: <?php echo json_encode(Yii::t('TourModule.widgets_views_guide_administration', '<strong>Users</strong>')); ?>,
            content: <?php echo json_encode(Yii::t('TourModule.widgets_views_guide_administration', 'This is the Users menu. From here, you can add new users and edit existing ones.<br><br>If you need to service a user\'s complete profile, you can become that user by clicking on "Edit this Profile" and clicking "Become this User" at the bottom of the edit profile page.')); ?>,
            placement: "right"
        },
        {
            orphan: true,
            backdrop: true,
            title: <?php echo json_encode(Yii::t('TourModule.widgets_views_guide_administration', "<strong>Hurray!</strong> That's all for now.")); ?>,
            content: <?php echo json_encode(Yii::t('TourModule.widgets_views_guide_administration', 'You have now learned about all the most important features and settings and you should now know the basics of Profiler Admin.<br><br>If you need help with anything to do with admin, just ask Zak!<br><br>Thanks for being part of the Profiler team!')); ?>
        }

    ]);

    // Initialize tour plugin
    administrationTour.init();

    // start the tour
    administrationTour.restart();


    /**
     * Set tour as seen
     */
    function tourCompleted() {
        // load user spaces
        $.ajax({
            'url': '<?php echo Yii::app()->createAbsoluteUrl('//tour/tour/tourCompleted', array('section' => 'administration')); ?>',
            'cache': false,
            'data': jQuery(this).parents("form").serialize()
        });
    }

</script>