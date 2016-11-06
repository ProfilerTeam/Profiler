<?php

/**
 * UserSettingTest
 *
 * @package profiler.modules_core.user.tests.unit.models
 * @since 0.9
 * @group user

 */
class UserSettingTest extends CDbTestCase
{

    public $fixtures = array(':user', ':user_setting');

    protected function setUp()
    {
        parent::setUp();

        Yii::app()->cache->flush();
        RuntimeCache::$data = array();
    }

    public function testGet()
    {
        $this->assertEquals(UserSetting::Get(1, 'globalSetting', 'core'), 'abc');
        $this->assertEquals(UserSetting::Get(1, 'globalSetting'), 'abc');

        $this->assertEquals(UserSetting::Get(1, 'moduleSetting', 'someModule'), 'cba');

        $user = User::model()->findByPk(1);
        $this->assertEquals($user->getSetting('globalSetting', 'core'), 'abc');
        $this->assertEquals($user->getSetting('globalSetting'), 'abc');
        $this->assertEquals($user->getSetting('moduleSetting', 'someModule'), 'cba');
    }

    public function testSet()
    {
        UserSetting::Set(1, 'globalSetting', 'abc2');
        $this->assertEquals(UserSetting::Get(1, 'globalSetting', 'core'), 'abc2');
    }

}
