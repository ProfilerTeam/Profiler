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
 * HSettingTest
 *
 * @package profiler.tests.unit.models
 * @since 0.9
 * @group core
 * 
 * @author Zak
 */
class HSettingTest extends CDbTestCase
{

    public $fixtures = array(':setting');

    public function testSetGet()
    {
        // Without Module
        $this->assertTrue((HSetting::Get('theme') == 'Profiler'));

        HSetting::Set('theme', 'Profiler2');
        $this->assertTrue((HSetting::Get('theme') == 'Profiler2'));
        $this->assertTrue((HSetting::Get('theme', '') == 'Profiler2'));

        // Module 
        $this->assertFalse((HSetting::Get('expireTime') == '3600'));
        $this->assertTrue((HSetting::Get('expireTime', 'cache') == '3600'));

        HSetting::Set('expireTime', '3601', 'cache');
        $this->assertTrue((HSetting::Get('expireTime', 'cache') == '3601'));

        // Create
        HSetting::Set('newSetting', 'newValue');
        $this->assertTrue((HSetting::Get('newSetting') == 'newValue'));

        HSetting::Set('newSetting', 'newValue2', 'someModuleId');
        $this->assertTrue((HSetting::Get('newSetting', 'someModuleId') == 'newValue2'));
    }

    public function testTextSettings()
    {
        $longText = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.";
        HSetting::SetText('longText', $longText);
        HSetting::SetText('longText', $longText . "2", 'testModule');

        $this->assertEquals(HSetting::GetText('longText'), $longText);
        $this->assertEquals(HSetting::GetText('longText', 'testModule'), $longText . "2");

        $this->assertEquals(HSetting::Get('longText'), "");
    }

    public function testFixedSettings()
    {
        Yii::app()->params['HSettingFixed'] = array('test' => 'abc');
        $this->assertEquals(HSetting::Get('test'), 'abc');
        HSetting::Set('test', 'bcd');
        $this->assertEquals(HSetting::Get('test'), 'abc');
    }

    public function testDynamicConfig()
    {
        HSetting::Set('theme', 'Profiler2');

        $config = HSetting::getConfiguration();

        $this->assertArrayHasKey('theme', $config);
        $this->assertEquals($config['theme'], 'Profiler2');
    }

    public function testInstalled()
    {
        $this->assertTrue(HSetting::IsInstalled());
    }

}
