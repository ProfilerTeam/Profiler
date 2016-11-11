<?php

/**
 * Profiler
 *  © 2015 Profiler
 */

/**
 * Optimize command optimizing the search index by calling underlying
 * Zend Lucence Index optimizer.
 *
 * @package profiler.commands.shell.SearchIndexer
 * @since 0.5
 */
class Optimize extends HConsoleCommand {

    public function run($args) {

        $this->printHeader('Search Index Optimizer');


        print "- Optimizing ...\n";
        HSearch::getInstance()->optimize();
        print "- Search Index successfully optimized!\n";

        print "\n";
    }

}
