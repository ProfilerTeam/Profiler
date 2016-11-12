<?php if ($this->user->profile->isnsfw === "yes") : ?>
    <script type="text/javascript" src="js/bootbox.min.js"></script>
    <script>
    bootbox.dialog({
  message: "<p>The profile you are trying to access contains NSFW/mature content, are you sure you want to continue?<br><br><a href='http://Profiler.cf/dashboard'>Back to Dashboard</a>",
  title: "<strong>NSFW Warning</strong>",
  buttons: {
    danger: {
      label: "Proceed",
      className: "btn-danger",
      callback: function() {
        console.log("NSFW check: OK");
      }
    }
  }
});
    </script>
<?php endif; ?>

<?php if ($this->user->profile->backgroundimage !== "") : ?>
    <style>
        body {
            background-image: url(<?php echo $this->user->profile->backgroundimage; ?>) !important;
        }
    </style>
<?php endif; ?>

<div class="container">

    <div class="row">

        <div class="col-md-9">
            <?php $this->widget('application.modules_core.user.widgets.ProfileHeaderWidget');?>
            <div class="row">
                <div class="profile-nav-container col-md-3">
                    <?php $this->widget('application.modules_core.user.widgets.ProfileMenuWidget', array()); ?>
                </div>
                <div class="col-md-9">
                    <?php echo $content; ?>
                </div>
            </div>
        </div>
</div>
