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
 * Description of ContentFormWidget
 *
 * @author Zak
 */
class ContentFormWidget extends HWidget {

    /**
     * URL to Submit ContentForm to
     */
    public $submitUrl;
    public $submitButtonText;

    /**
     *
     * @var type 
     */
    public $contentContainer;

    /**
     * Form HTML
     */
    protected $form = "";

    public function init() {

        if ($this->submitButtonText == "")
            $this->submitButtonText  = Yii::t('WallModule.widgets_ContentFormWidget', 'Submit');
        
        if ($this->contentContainer == null || !$this->contentContainer instanceof HActiveRecordContentContainer) {
            throw new CHttpException(500, "No Content Container given!");
        }

        return parent::init();
    }

    /**
     * Renders form and stores output in $form
     * Overwrite me!
     */
    public function renderForm() {
        return "";
    }

    
    /**
     * Checks write permissions
     */
    protected function hasWritePermission() {
        return $this->contentContainer->canWrite();
    }
    
    
    public function run() {
        
        if (!$this->hasWritePermission())
            return;
        
        $this->renderForm();
        
        $this->render('application.modules_core.wall.widgets.views.contentForm', array(
            'form' => $this->form,
            'contentContainer' => $this->contentContainer,
            'submitUrl' => $this->submitUrl,
            'submitButtonText' => $this->submitButtonText
        ));
    }

}
