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
 * FileModuleEvents handles all events described in autostart.php
 * 
 * @package profiler.modules_core.file
 * @author Zak
 */
class FileModuleEvents
{

    /**
     * On init of the WallEntryAddonWidget, attach the files of the content.
     *
     * @param CEvent $event
     */
    public static function onWallEntryAddonInit($event)
    {
        $event->sender->addWidget('application.modules_core.file.widgets.ShowFilesWidget', array('object'=>$event->sender->object), array('sortOrder' => 5));
    }

    /**
     * On cron daily run do some cleanup stuff.
     * We delete all files which are not assigned to object_model/object_id
     * within 1 day.
     *
     * @param type $event
     */
    public static function onCronDailyRun($event)
    {

        $cron = $event->sender;

        /**
         * Delete unused files
         */
        $deleteTime = time() - (60 * 60 * 24 * 1); // Older than 1 day
        foreach (File::model()->findAllByAttributes(array(), 'created_at < :date AND (object_model IS NULL or object_model = "")', array(':date' => date('Y-m-d', $deleteTime))) as $file) {
            $file->delete();
        }
    }

    /**
     * On run of integrity check command, validate all module data
     *
     * @param CEvent $event
     */
    public static function onIntegrityCheck($event)
    {

        $integrityChecker = $event->sender;
        $integrityChecker->showTestHeadline("Validating File Module (" . File::model()->count() . " entries)");

        foreach (File::model()->findAll() as $a) {

            if ($a->object_model != "" && $a->object_id != "" && $a->getUnderlyingObject() === null) {
                $integrityChecker->showFix("Deleting file id " . $a->id . " without existing target!");
                if (!$integrityChecker->simulate)
                    $a->delete();
            }
        }
    }

    /**
     * On delete of a model, check there are files bound to it and delete them
     *
     * @param CEvent $event
     */
    public static function onBeforeHActiveRecordDelete($event)
    {
        foreach (File::model()->findAllByAttributes(array('object_id' => $event->sender->getPrimaryKey(), 'object_model' => get_class($event->sender))) as $file) {
            $file->delete();
        }
    }

}
