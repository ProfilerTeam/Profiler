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
 * Interface for Searchable Models
 *
 * @package profiler.interfaces
 * @since 0.5
 * @author Zak
 */
interface ISearchable {

    /**
     * Returns an array of informations which are required to index the object.
     *
     * Example Array:
     * return array(
     *       // Assignments
     *      'belongsToType' => 'Space',		// or user *MUST BE SET*	(Space, User)
     *      'belongsToId' => 2,			// Id of User or Space	(i
     *      'belongsToGuid' => 'asdf',		// Space or Users GUID
     *
     *      // Informations about the record
     *      'model' => 'User',			// Model of Result
     *      'pk' => '1',				// Primary Key for ->findByPk
     *      'title' => 'asdf',			// Title of Result
     *      'url' => '/zeros_social_intranet/...',	// Target URL
     *
     *      // Some extra indexed fields
     *      'fieldX' => 'valueY',
     * );
     *
     * @return Array of attributes required for indexing
     */
    public function getSearchAttributes();

    /**
     * Returns the output of the search result.
     *
     * @return String HTML output of the search result
     */
    public function getSearchResult();
}

?>
