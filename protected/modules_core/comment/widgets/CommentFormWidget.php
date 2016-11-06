<?php

/**
 * Profiler
 *  © 2015 Profiler
 *
 * 
 * 
 * 
 *
 * 
 * 
 * 
 *
 * 
 * 
 * 
 * 
 */

/**
 * This widget is used include the comments functionality to a wall entry.
 *
 * Normally it shows a excerpt of all comments, but provides the functionality
 * to show all comments.
 *
 * @package profiler.modules_core.comment
 * @since 0.5
 */
class CommentFormWidget extends HWidget
{

    /**
     * Content Object
     */
    public $object;

    /**
     * Executes the widget.
     */
    public function run()
    {

        $modelName = $this->object->content->object_model;
        $modelId = $this->object->content->object_id;
        $id = $modelName . "_" . $modelId;

        $this->render('form', array(
            'modelName' => $modelName,
            'modelId' => $modelId,
            'id' => $modelName . "_" . $modelId,
        ));
    }

}

?>