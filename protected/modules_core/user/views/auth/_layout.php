<div class="outside login-screen">
    <?php echo $content; ?>
</div>
<?php 
$random = rand(1,5);
if ($random === "1") : ?>
    <style type="text/css">
        body {
            background-image: url(http://Profiler.cf/loginBackground.jpg);
        }
    </style>
<?php endif; ?>
<?php if ($random === "2") : ?>
    <style type="text/css">
        body {
            background-image: url(http://Profiler.cf/loginBackground2.jpg);
        }
    </style>
<?php endif; ?>
