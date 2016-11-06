<?php

class PostFormWidget extends ContentFormWidget {

    public $submitUrl = 'post/post/post';

    public function renderForm() {
		$this->submitButtonText  = Yii::t('WallModule.widgets_ContentFormWidget', 'Post');
        $this->form = $this->render('postForm', array(), true);
    }

}

?>
