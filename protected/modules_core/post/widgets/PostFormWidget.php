<?php

class PostFormWidget extends ContentFormWidget {

    public $submitUrl = 'post/post/post';

    public function renderForm() {
        $this->form = $this->render('postForm', array(), true);
    }

}

?>