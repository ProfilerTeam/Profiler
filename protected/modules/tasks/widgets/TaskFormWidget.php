<?php

/**
 * PollFormWidget handles the form to create new polls.
 *
 * @package profiler.modules.polls.widgets
 * @since 0.5
 * @author Zak
 */
class TaskFormWidget extends ContentFormWidget {

    public function renderForm() {

        $this->submitUrl = 'tasks/task/create';
        $this->submitButtonText = Yii::t('TasksModule.widgets_TaskFormWidget', 'Create');

        $this->form = $this->render('taskForm', array('contentContainer'=>$this->contentContainer), true);
    }

}

?>