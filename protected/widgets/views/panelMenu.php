<ul class="nav nav-pills preferences">
            <a href="javascript:togglePanelUp('<?php echo $id; ?>');" class="panel-collapse"><i
                        class="fa fa-minus-square"></i> <?php echo Yii::t('base', 'Collapse'); ?></a>
            <a href="javascript:togglePanelDown('<?php echo $id; ?>');" class="panel-expand" style="display:none;"><i
                        class="fa fa-plus-square"></i> <?php echo Yii::t('base', 'Expand'); ?></a>
</ul>

<script type = "text/javascript">

    $(document).ready(function() {

        // check and set panel state from cookie
        checkPanelMenuCookie('<?php echo $this->id; ?>');
    });


</script>