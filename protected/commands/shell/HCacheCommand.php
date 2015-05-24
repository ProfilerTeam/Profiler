<?php

/**
 * Profiler
 *  © 2015 Profiler
 */

/**
 * HCacheCommand provides console access to caching functions.
 *
 * @package profiler.commands.shell
 * @since 0.5
 */
class HCacheCommand extends CConsoleCommand {

    public function actionIndex() {
        print $this->getHelp();
    }

    /**
     * Flushes all application cache data
     */
    public function actionFlush() {
        Yii::app()->cache->flush();
        ModuleManager::flushCache();

        if (Yii::app()->cache instanceof CApcCache) {
            print "Warning: Could not flush APC Cache! - Restart Webserver!\n";
        }

        print "All application caches flushed!\n";
    }

    /**
     * Disables application cache
     */
    public function actionDisable() {
        HSetting::Set('type', 'CDummyCache', 'cache');
        print "Application Cache disabled!\n";
    }

    public function getHelp() {
        return <<<EOD
USAGE
  yiic cache [action]

DESCRIPTION
  This command provides access to the caching backend.

EXAMPLES
 * yiic cache flush
   Flushes all application caches.

 * yiic cache disable
   Disables application cache.

EOD;
    }

}
