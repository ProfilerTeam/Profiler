<?php

/**
 *
 * @package profiler.modules_core.user
 * @since 0.5
 * @author Zak
 */
class UserModule extends HWebModule
{

    public $isCoreModule = true;

    public function init()
    {
        $this->setImport(array(
            'user.models.*',
            'user.components.*',
        ));
    }

    /**
     * On rebuild of the search index, rebuild all user records
     *
     * @param type $event
     */
    public static function onSearchRebuild($event)
    {

        foreach (User::model()->findAll() as $obj) {
            HSearch::getInstance()->addModel($obj);
            print "u";
        }
    }

}
