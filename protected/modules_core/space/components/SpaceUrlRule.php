<?php

class SpaceUrlRule extends CBaseUrlRule
{

    public $connectionId = 'db';

    public function createUrl($manager, $route, $params, $ampersand)
    {

        if (isset($params['sguid'])) {
            if ($route == 'space/space' || $route == 'space/space/index') {
                $route = "home";
            }
            $url = "g/" . urlencode($params['sguid']) . "/" . $route;
            unset($params['sguid']);
            $url = rtrim($url . '/' . $manager->createPathInfo($params, '/', '/'), '/');
            return $url;
        }

        return false;
    }

    public function parseUrl($manager, $request, $pathInfo, $rawPathInfo)
    {
        if (substr($pathInfo, 0, 2) == "g/") {
            $parts = explode('/', $pathInfo, 3);
            if (isset($parts[1])) {
                $space = Space::model()->findByAttributes(array('guid' => $parts[1]));

                if ($space !== null) {
                    
                    $_GET['sguid'] = $space->guid;
                    if (!isset($parts[2]) || substr($parts[2], 0, 4) == 'home') {
                        $temp = 1;
                        return 'space/space/index'. str_replace('home', '', $parts[2], $temp);
                    } else {
                        return $parts[2];
                    }
                } else {
                    throw new CHttpException('404', Yii::t('SpaceModule.components_SpaceUrlRule', 'Group not found!'));
                }
            }
        }
        return false;
    }

}
