<?php
$this->pageTitle = Yii::app()->name . ' - ' . Yii::t('base', 'Error');
?>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <?php echo Yii::t('base', "Oops..."); ?> <?php echo Yii::t('base', "This page cannot be found. Sorry about that!"); ?>
        </div>
        <div class="panel-body">

            <div class="error">
                <h2><?php echo CHtml::encode($message); ?></h2>
            </div>

            <hr>
            <a href="<?php echo Yii::app()->createUrl('//')?>" class="btn btn-primary"><?php echo Yii::t('base', 'Back to dashboard'); ?></a>
        </div>
    </div>
</div>