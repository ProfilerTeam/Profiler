<?php

/**
 * Shows pending approvals on dashboard
 *
 * @package profiler.modules_core.admin.widgets
 * @since 0.7
 * @author Zak
 */
class ApprovalDashboardWidget extends StackWidget {

    public function run() {
        $model = new User('search');
        if (count($model->resetScope()->searchNeedApproval()->getData()) != 0) {
            $this->render('profileActivities', array());
        }
    }

}

?>
