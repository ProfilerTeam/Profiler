<div class="panel panel-default panel-activities">

    <div class="panel-heading"><?php echo Yii::t('ActivityModule.widgets_views_statusStream', '<strong>About</strong>'); ?></div>
    <div id="activityStream">

    </div>
</div>

<script type="text/javascript">

    // set niceScroll to activity list
    $("#activityContents").niceScroll({
        cursorwidth: "7",
        cursorborder:"",
        cursorcolor:"#555",
        cursoropacitymax:"0.2",
        railpadding:{top:0,right:3,left:0,bottom:0}
    });

    // update nicescroll object with new content height after ajax request
    $(document).ajaxComplete(function(event, xhr, settings) {
        $("#activityContents").getNiceScroll().resize();
    })

</script>

