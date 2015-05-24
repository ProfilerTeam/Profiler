<?php
$this->pageTitle = Yii::t('UserModule.views_auth_login', '<strong>Please</strong> sign in');
?>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>

<div class="container" style="text-align: center;">
    <center>
        <div class="loginLogo" id="loginLogo"><img src="http://Profiler.cf/newLoginLogo.png" class="animated"></img></div>
    </center>
</div>
    <script>
    $('#loginLogo').click(function () {
          $(this).effect("bounce", { times:1 }, 30);
    });
    </script>

    <br>

    <div class="container">
        <div class="card card-container">
                        <?php
            $form = $this->beginWidget('CActiveForm', array(
                'id' => 'account-login-form',
                'enableAjaxValidation' => false,
            ));
            ?>
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin">
                <span id="reauth-email" class="reauth-email"></span>
                <div class="form-group">
                <?php echo $form->textField($model, 'username', array('class' => 'form-control', 'id' => 'login_username', 'placeholder' => Yii::t('UserModule.views_auth_login', 'username or email'))); ?>
                <?php echo $form->error($model, 'username'); ?>
                </div>
                <div class="form-group">
                <?php echo $form->passwordField($model, 'password', array('class' => 'form-control', 'id' => 'login_password', 'placeholder' => Yii::t('UserModule.views_auth_login', 'password'))); ?>
                <?php echo $form->error($model, 'password'); ?>
                </div>
                <div id="remember" class="checkbox">
                        <?php echo $form->checkBox($model, 'rememberMe'); ?> <?php echo Yii::t('UserModule.views_auth_login', 'Remember me next time'); ?>
                </div>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Sign in</button>
            </form><!-- /form -->
            <a href="#" class="forgot-password">
                <a href="<?php echo $this->createUrl('//user/auth/recoverPassword'); ?>"><br><?php echo Yii::t('UserModule.views_auth_login', 'Forgot Password') ?></a>
            </a>
            <?php $this->endWidget(); ?>
        </div><!-- /card-container -->
    </div><!-- /container -->

    <!--
    <div class="panel panel-default animated bounceIn" id="login-form" style="max-width: 300px; margin: 0 auto 20px; text-align: left;">

        <div class="panel-heading"><?php echo Yii::t('UserModule.views_auth_login', '<strong>Please</strong> sign in'); ?></div>

        <div class="panel-body">
            <?php
            $form = $this->beginWidget('CActiveForm', array(
                'id' => 'account-login-form',
                'enableAjaxValidation' => false,
            ));
            ?>

            <p><?php echo Yii::t('UserModule.views_auth_login', "If you're already a member, please login with your username/email and password."); ?></p>

            <div class="form-group">
                <?php echo $form->textField($model, 'username', array('class' => 'form-control', 'id' => 'login_username', 'placeholder' => Yii::t('UserModule.views_auth_login', 'username or email'))); ?>
                <?php echo $form->error($model, 'username'); ?>
            </div>

            <div class="form-group">
                <?php echo $form->passwordField($model, 'password', array('class' => 'form-control', 'id' => 'login_password', 'placeholder' => Yii::t('UserModule.views_auth_login', 'password'))); ?>
                <?php echo $form->error($model, 'password'); ?>
            </div>

            <div class="checkbox">
                <label>
                    <?php echo $form->checkBox($model, 'rememberMe'); ?> <?php echo Yii::t('UserModule.views_auth_login', 'Remember me next time'); ?>
                </label>
            </div>

            <hr>
            <div class="row">
                <div class="col-md-4">
                    <?php echo CHtml::submitButton(Yii::t('UserModule.views_auth_login', 'Sign in'), array('class' => 'btn btn-large btn-primary')); ?>
                </div>
                <div class="col-md-8 text-right">
                    <small>
                        <?php echo Yii::t('UserModule.views_auth_login', 'Forgot your password?'); ?>
                        <a href="<?php echo $this->createUrl('//user/auth/recoverPassword'); ?>"><br><?php echo Yii::t('UserModule.views_auth_login', 'Create a new one.') ?></a>
                    </small>
                </div>
            </div>

            <?php $this->endWidget(); ?>
                -->
        </div>
    
    </div>
    
    <?php if ($canRegister) : ?>
        <div id="register-form" class="panel panel-default animated bounceInLeft"
             style="max-width: 300px; margin: 0 auto 20px; text-align: left;">

            <div class="panel-heading"><?php echo Yii::t('UserModule.views_auth_login', '<strong>Sign</strong> up') ?></div>

            <div class="panel-body">

                <p><?php echo Yii::t('UserModule.views_auth_login', "Don't have an account? Join the network by entering your e-mail address."); ?></p>
                <?php
                $form = $this->beginWidget('CActiveForm', array(
                    'id' => 'account-register-form',
                    'enableAjaxValidation' => false,
                ));
                ?>

                <div class="form-group">
                    <?php echo $form->textField($registerModel, 'email', array('class' => 'form-control', 'id' => 'register-email', 'placeholder' => Yii::t('UserModule.views_auth_login', 'email'))); ?>
                    <?php echo $form->error($registerModel, 'email'); ?>
                </div>
                <hr>
                <?php echo CHtml::submitButton(Yii::t('UserModule.views_auth_login', 'Register'), array('class' => 'btn btn-primary')); ?>

                <?php $this->endWidget(); ?>
            </div>
        </div>

    <?php endif; ?>
</div>

<script type="text/javascript">
    $(function() {
        // set cursor to login field
        $('#login_username').focus();
    })

    // Shake panel after wrong validation
<?php if ($form->errorSummary($model) != null) { ?>
        $('#login-form').removeClass('bounceIn');
        $('#login-form').addClass('shake');
        $('#register-form').removeClass('bounceInLeft');
        $('#app-title').removeClass('fadeIn');
<?php } ?>

    // Shake panel after wrong validation
<?php if ($form->errorSummary($registerModel) != null) { ?>
        $('#register-form').removeClass('bounceInLeft');
        $('#register-form').addClass('shake');
        $('#login-form').removeClass('bounceIn');
        $('#app-title').removeClass('fadeIn');
<?php } ?>

</script>
<style>
body {
    background: url(http://Profiler.cf/loginBackground.jpg) no-repeat;
}
</style>

