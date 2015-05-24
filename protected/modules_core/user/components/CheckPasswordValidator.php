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
 * CheckPasswordValidator checks password of currently logged in user.
 *
 * @author Zak
 */
class CheckPasswordValidator extends CValidator {

    protected function validateAttribute($object, $attribute) {
        $value = $object->$attribute;

        $identity = new UserIdentity(Yii::app()->user->getModel()->username, $value);
        $identity->authenticate();

        if (!$identity->isAuthenticated) {
            $object->addError($attribute, Yii::t('UserModule.components_CheckPasswordValidator', "Your password is incorrect!"));
        }
    }

}
