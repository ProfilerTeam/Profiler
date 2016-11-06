<?php

class PostWidget extends HWidget
{

    /**
     * The post object
     *
     * @var Post
     */
    public $post;

    /**
     * Indicates the post was just edited
     * 
     * @var boolean
     */
    public $justEdited = false;

    /**
     * Executes the widget.
     */
    public function run()
    {

        $user = $this->post->creator;

        $this->render('post', array(
            'post' => $this->post,
            'user' => $user,
            'justEdited' => $this->justEdited
        ));
    }

}

?>