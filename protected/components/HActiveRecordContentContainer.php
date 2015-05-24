<?php

/**
 * Profiler
 *  © 2015 Profiler
 */

/**
 * 
 * Required Attributes:
 *      - wall_id
 *      - guid
 *  
 * Required Methods:
 *      - getProfileImage()
 *      - getUrl()
 * 
 */
class HActiveRecordContentContainer extends HActiveRecord implements IContentContainer
{

    /**
     * Returns the Profile Image Object for this Content Base
     *
     * @return ProfileImage
     */
    public function getProfileImage()
    {

        if (get_class($this) == 'Space') {
            return new ProfileImage($this->guid, 'default_space');
        }
        return new ProfileImage($this->guid);
    }

    /**
     * Returns the Profile Banner Image Object for this Content Base
     *
     * @return ProfileBannerImage
     */
    public function getProfileBannerImage()
    {

        return new ProfileBannerImage($this->guid);
    }

    /**
     * Should be overwritten by implementation
     */
    public function getUrl()
    {
        return "";
    }

    /**
     * Check write permissions on content container.
     * Overwrite this with your own implementation.
     * 
     * @param type $userId
     * @return boolean
     */
    public function canWrite($userId = "")
    {
        return false;
    }

    /**
     * Creates url in content container scope.
     * E.g. add uguid or sguid parameter to parameters.
     * 
     * @param type $route
     * @param type $params
     * @param type $ampersand
     */
    public function createUrl($route, $params = array(), $ampersand = '&')
    {
        return "";
    }

}

?>
