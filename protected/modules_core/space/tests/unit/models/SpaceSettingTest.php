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
 * SpaceSettingTest
 * 
 * @package profiler.modules_core.space.tests.unit.models
 * @since 0.9
 * @group space
 */
class SpaceSettingTest extends CDbTestCase
{

    public $fixtures = array(':space_setting');

    protected function setUp()
    {
        parent::setUp();

        Yii::app()->cache->flush();
        RuntimeCache::$data = array();
    }

    public function testGet()
    {
        $this->assertEquals(SpaceSetting::Get(1, 'globalSetting', 'core'), 'xyz');
        $this->assertEquals(SpaceSetting::Get(1, 'globalSetting'), 'xyz');

        $this->assertEquals(SpaceSetting::Get(1, 'moduleSetting', 'someModule'), 'zyx');

        $space = Space::model()->findByPk(1);
        $this->assertEquals($space->getSetting('globalSetting', 'core'), 'xyz');
        $this->assertEquals($space->getSetting('globalSetting'), 'xyz');
        $this->assertEquals($space->getSetting('moduleSetting', 'someModule'), 'zyx');
    }

    public function testSet()
    {
        SpaceSetting::Set(1, 'globalSetting', 'xyz2');
        $this->assertEquals(SpaceSetting::Get(1, 'globalSetting', 'core'), 'xyz2');
    }

}
