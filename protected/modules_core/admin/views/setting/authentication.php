<div class="panel panel-default">
    <div class="panel-heading"><?php echo Yii::t('AdminModule.views_setting_authentication', '<strong>Authentication</strong> - Basic'); ?></div>
    <div class="panel-body">

        <ul class="nav nav-pills">
            <li class="active"><a
                    href="<?php echo $this->createUrl('authentication'); ?>"><?php echo Yii::t('AdminModule.views_setting_authentication', 'Basic'); ?></a>
            </li>
            <li>
                <a href="<?php echo $this->createUrl('authenticationLdap'); ?>"><?php echo Yii::t('AdminModule.views_setting_authentication', 'LDAP'); ?></a>
            </li>
        </ul>


        <br/>

        <?php
        $form = $this->beginWidget('CActiveForm', array(
            'id' => 'authentication-settings-form',
            'id' => 'file-settings-form',
            'enableAjaxValidation' => false,
        ));
        ?>

        <?php echo $form->errorSummary($model); ?>

        <div class="form-group">
            <div class="checkbox">
                <label>
                    <?php echo $form->checkBox($model, 'internalAllowAnonymousRegistration'); ?> <?php echo $model->getAttributeLabel('internalAllowAnonymousRegistration'); ?>
                </label>
            </div>
        </div>

        <div class="form-group">
            <div class="checkbox">
                <label>
                    <?php echo $form->checkBox($model, 'internalUsersCanInvite'); ?> <?php echo $model->getAttributeLabel('internalUsersCanInvite'); ?>
                </label>
            </div>
        </div>

        <div class="form-group">
            <div class="checkbox">
                <label>
                    <?php echo $form->checkBox($model, 'internalRequireApprovalAfterRegistration'); ?> <?php echo $model->getAttributeLabel('internalRequireApprovalAfterRegistration'); ?>
                </label>
            </div>
        </div>

        <div class="form-group">
            <?php echo $form->labelEx($model, 'defaultUserGroup'); ?>
            <?php echo $form->dropDownList($model, 'defaultUserGroup', $groups, array('class' => 'form-control', 'readonly' => HSetting::IsFixed('defaultUserGroup', 'authentication_internal'))); ?>
        </div>

        <div class="form-group">
            <?php echo $form->labelEx($model, 'defaultUserIdleTimeoutSec'); ?>
            <?php echo $form->textField($model, 'defaultUserIdleTimeoutSec', array('class' => 'form-control', 'readonly' => HSetting::IsFixed('defaultUserIdleTimeoutSec', 'authentication_internal'))); ?>
        	 <p class="help-block"><?php echo Yii::t('AdminModule.views_setting_authentication', 'Min value is 20 seconds. If not set, session will timeout after 1400 seconds (24 minutes) regardless of activity (default session timeout)'); ?></p>
        </div>
            
        <hr/>

        <?php echo CHtml::submitButton(Yii::t('AdminModule.views_setting_authentication', 'Save'), array('class' => 'btn btn-primary')); ?>

        <!-- show flash message after saving -->
        <?php $this->widget('application.widgets.DataSavedWidget'); ?>

        <?php $this->endWidget(); ?>

    </div>
</div>



