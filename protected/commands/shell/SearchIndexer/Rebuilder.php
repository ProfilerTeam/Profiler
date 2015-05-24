<?php

/**
 * Profiler
 *  © 2015 Profiler
 */

/**
 * Rebuilder command purges all search index files and rebuilds the whole index.
 *
 * @package profiler.commands.shell.SearchIndexer
 * @since 0.5
 */
class Rebuilder extends HConsoleCommand {

    public function run($args) {

        $this->printHeader('Rebuild Search Index\n');

        print "Deleting old index files: ";
        HSearch::getInstance()->flushIndex();
        print " done!\n";

        print "Rebuilding index: ";
        HSearch::getInstance()->rebuild();
        print " done!\n";

        print "\n";
    }

}
