<?php

/**
 * Profiler
 *  © 2015 Profiler
 */

/**
 * HHttpRequest extends the CHttpRequest.
 *
 * @author Zak
 * @package profiler.components
 * @since 0.5
 */
class HHttpRequest extends CHttpRequest {

    public $csrfTokenName = 'CSRF_TOKEN';

    /**
     * Returns whether this is an AJAX (XMLHttpRequest) request.
     * @return boolean whether this is an AJAX (XMLHttpRequest) request.
     */
    public function getIsAjaxRequest() {

        if (!parent::getIsAjaxRequest()) {
            if (isset($_REQUEST['ajax'])) {
                return true;
            }
            return false;
        }
        return true;
    }

}

?>
