<?php

/**
 * Space Administration Controller
 *
 * @package profiler.modules_core.admin.controllers
 * @since 0.5
 */
class SpaceController extends Controller
{

    /**
     * Layout View to use
     *
     * @var type
     */
    public $subLayout = "/_layout";

    /**
     * @return array action filters
     */
    public function filters()
    {
        return array(
            'accessControl', // perform access control for CRUD operations
        );
    }

    /**
     * Specifies the access control rules.
     * This method is used by the 'accessControl' filter.
     * @return array access control rules
     */
    public function accessRules()
    {
        return array(
            array('allow',
                'expression' => 'Yii::app()->user->isAdmin()'
            ),
            array('deny', // deny all users
                'users' => array('*'),
            ),
        );
    }

    /**
     * List all available user spaces
     */
    public function actionIndex()
    {

        $model = new Space('search');
        if (isset($_GET['Space']))
            $model->attributes = $_GET['Space'];

        $this->render('index', array(
            'model' => $model
        ));
    }

    /**
     * Edits or Creates a user space
     */
    public function actionEdit()
    {

        // Create Space Edit Form
        $space = Space::model()->findByPk(Yii::app()->request->getQuery('id'));
        if ($space === null) {
            $space = new Space();
        }
        $space->scenario = 'edit';
        $space->populateDefaultSpaceGuid();
        $space->populateAdminGuids();


        // uncomment the following code to enable ajax-based validation
        if (isset($_POST['ajax']) && $_POST['ajax'] === 'admin-space-form') {
            echo CActiveForm::validate($model);
            Yii::app()->end();
        }

        if (isset($_POST['Space'])) {
            $_POST = Yii::app()->input->stripClean($_POST);
            $space->attributes = $_POST['Space'];

            if ($space->validate()) {
                $space->save();

                // Redirect to admin spaces overview
                $this->redirect(Yii::app()->createUrl('//admin/space'));
            }
        }
        $this->render('edit', array('space' => $space));
    }

    /**
     * Deletes a space
     *
     * On deletion all space members will be moved to another space.
     */
    public function actionDelete()
    {
        Yii::import('admin.forms.*');

        $id = (int) Yii::app()->request->getQuery('id');

        $space = Space::model()->findByPk($id);

        if ($space == null)
            throw new CHttpException(404, Yii::t('AdminModule.controllers_SpaceController', 'Space not found!'));

        // uncomment the following code to enable ajax-based validation
        if (isset($_POST['ajax']) && $_POST['ajax'] === 'admin-deleteSpace-form') {
            echo CActiveForm::validate($space);
            Yii::app()->end();
        }

        $model = new AdminDeleteSpaceForm;
        if (isset($_POST['AdminDeleteSpaceForm'])) {
            $model->attributes = $_POST['AdminDeleteSpaceForm'];
            if ($model->validate()) {
                foreach (User::model()->findAllByAttributes(array('space_id' => $space->id)) as $user) {
                    $user->space_id = $model->space_id;
                    $user->save();
                }
                $space->delete();
                $this->redirect(Yii::app()->createUrl('//admin/space'));
            }
        }

        $this->render('delete', array('space' => $space, 'model' => $model));
    }

}
