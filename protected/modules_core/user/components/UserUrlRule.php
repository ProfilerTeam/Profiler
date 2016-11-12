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
 * UserUrlRule creates /u/userGuid style urls.
 *
 * @package profiler.modules_core.user.components
 * @since 0.6
 */
class UserUrlRule extends CBaseUrlRule
{

    public $connectionId = 'db';

    /**
     * Store already looked up usernames
     *
     * @var Array
     */
    private static $loadedUserNamesByGuid = array();

    public function createUrl($manager, $route, $params, $ampersand)
    {
        if (isset($params['uguid'])) {

            $userName = self::getUserNameByGuid($params['uguid']);
            unset($params['uguid']);

            $url = $route . "/" . urlencode(strtolower($userName));
            $url = rtrim($url . '/' . $manager->createPathInfo($params, '/', '/'), '/');
            return $url;
        }

        return false;
    }

	public function parseUrl($manager, $request, $pathInfo, $rawPathInfo)
    {
        if (isset($pathInfo)) {
            $user = User::model()->findByAttributes(array('username' => $pathInfo));
            if ($user !== null) {

                $_GET['uguid'] = $user->guid;
                return 'user/profile/index/' . $pathInfo;
            }
        }
        return false;
    }

    /**
     * Looks up username by given user guid
     *
     * @param String $guid of user
     * @return Username
     * @throws CException when user not found
     */
    public static function getUserNameByGuid($guid)
    {

        if (isset(self::$loadedUserNamesByGuid[$guid])) {
            return self::$loadedUserNamesByGuid[$guid];
        }

        $user = User::model()->resetScope()->findByAttributes(array('guid' => $guid));

        if ($user != null) {
            self::$loadedUserNamesByGuid[$guid] = $user->username;
            return self::$loadedUserNamesByGuid[$guid];
        } else {
            throw new CException("Could not find user by user guid!");
        }

        return "";
    }

}
