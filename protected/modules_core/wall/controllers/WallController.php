<?php

/**
 * The Wall Controller
 *
 * @package profiler.modules_core.wall.controllers
 * @since 0.5
 * @author Zak
 */
class WallController extends Controller {

    /**
     * @return array action filters
     */
    public function filters() {
        return array(
            'accessControl', // perform access control for CRUD operations
        );
    }

    /**
     * Specifies the access control rules.
     * This method is used by the 'accessControl' filter.
     * @return array access control rules
     */
    public function accessRules() {
        return array(
            array('allow', // allow authenticated user to perform 'create' and 'update' actions
                'users' => array('@'),
            ),
            array('deny', // deny all users
                'users' => array('*'),
            ),
        );
    }

    /**
     * Actions
     *
     * @return type
     */
    public function actions() {
        return array(
            'stream' => array(
                'class' => 'application.modules_core.wall.StreamAction',
                'mode' => 'normal',
            ),
            'streamActivity' => array(
                'class' => 'application.modules_core.wall.StreamAction',
                'mode' => 'activity'
            ),
        );
    }
    


}