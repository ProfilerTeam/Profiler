<?php

$this->widget('application.modules_core.post.widgets.PostFormWidget', array(
	'contentContainer' => Yii::app()->user->model
));
?>
<?php

$this->widget('application.modules_core.wall.widgets.WallStreamWidget', array(
    'type' => Wall::TYPE_COMMUNITY));
?>

