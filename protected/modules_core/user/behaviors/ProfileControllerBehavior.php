<?php

class ProfileControllerBehavior extends CBehavior
{

    public $user = null;

    public function getUser()
    {

        if ($this->user != null) {
            return $this->user;
        }

        // Get User GUID by parameter
        $guid = Yii::app()->request->getQuery('uguid');
        if ($guid == "") {
            // Workaround for older version
            $guid = Yii::app()->request->getQuery('guid');
        }

        $this->user = User::model()->findByAttributes(array('guid' => $guid));

        if ($this->user == null)
            throw new CHttpException(404, Yii::t('UserModule.behaviors_ProfileControllerBehavior', 'User not found!'));

        $this->checkAccess();

        return $this->user;
    }

    public function checkAccess()
    {
        if ($this->user->status == User::STATUS_NEED_APPROVAL)
            throw new CHttpException(404, 'This user account is not approved yet!');
    }

    /**
     * Creates a user url
     *
     * @deprecated since version 0.9
     * @param type $route
     * @param type $params
     * @param type $ampersand
     * @return type
     */
    public function createUserUrl($route, $params = array(), $ampersand = '&')
    {
        return $this->user->createUrl($route, $params, $ampersand);
    }

}

?>
