<?php
/**
 * Created by JetBrains PhpStorm.
 * User: yiqing
 * Date: 11-12-24
 * Time: 下午11:10
 * To change this template use File | Settings | File Templates.
 * @see  https://github.com/rmm5t/jquery-timeago
 * ----------------------------------------
 *
 * ----------------------------------------
 */
class JTimeAgo extends CWidget
{

    /**
     * @static
     * @param bool $hashByName
     * @return string
     * return the widget assetsUrl
     */
    public static function getAssetsUrl($hashByName = false)
    {
        // return CHtml::asset(dirname(__FILE__) . DIRECTORY_SEPARATOR . 'assets', $hashByName);
        return Yii::app()->getAssetManager()->publish(dirname(__FILE__) . DIRECTORY_SEPARATOR . 'assets', $hashByName, -1, YII_DEBUG);
    }

    /**
     * @param bool $autoGenerate
     * @return string
     */
    public function getId($autoGenerate = true)
    {
        $id = parent::getId($autoGenerate);
        if ($this->startsWith($id, 'yw')) {
            return __CLASS__ . substr($id, 2);
        }
        return $id;
    }

    /**
     * @param $h
     * @param $n
     * @return bool
     * if $h  stars with $n
     *
     */
    protected function startsWith($h, $n)
    {
        return (false !== ($i = strrpos($h, $n)) &&
            $i === strlen($h) - strlen($n));
    }

    /**
     * @var CClientScript
     */
    protected $cs;

    /**
     * @var bool
     */
    public $debugMode;

    //=================above is common usage code ================================================================================


    //--------<must specified variables>------------------------------------------
    /**
     * @var string
     */
    public $selector;
    //--------<must specified variables/>------------------------------------------


    /**
     * @var array
     */
    public $options = array();


    /**
     * @var string
     */
    protected $baseUrl = '';

    /**
     * @return void
     * --------------------------
     * best practice for write the init method:
     * init(){
     *    //preConditionCheck();
     *    parent::init();
     *   //defaultSettings();
     * }
     *
     * ---------------------------
     */
    public function init()
    {
        if (empty($this->selector)) {
            throw new CException('want to use this widget ? you must give an selector which is css selector string');
        }
        //  most of places use it so make it as instance variable and for intelligence tips from IDE
        $this->cs = Yii::app()->getClientScript();

        parent::init();

        if (!isset($this->debugMode)) {
            $this->debugMode = defined(YII_DEBUG) ? YII_DEBUG : true;
        }
    }


    /**
     * @return void
     */
    public function  run()
    {
        $this->publishAssets()
            ->registerClientScripts();

    }


    /**
     * @return JTimeAgo
     */
    public function publishAssets()
    {
        $assetsDir = dirname(__FILE__) . DIRECTORY_SEPARATOR . 'assets';
        $this->baseUrl = Yii::app()->getAssetManager()->publish($assetsDir, false, -1, $this->debugMode);
        return $this;
    }

   /**
    * @return JTimeAgo
    */
    public function registerClientScripts()
    {
        //> .register js file;
        $this->cs->registerCoreScript('jquery')->registerScriptFile($this->baseUrl . '/jquery.timeago.js');

        $jsCode = '';

        //> i18n message support
        $jsCode = $this->handleI18n();

        //> handle some settings
        if (!empty($this->settings) && is_array($this->settings)) {
            $settings = CJavaScript::encode($this->settings);
            $jsCode .= <<<SETTINGS
   jQuery.timeago.settings = {$settings};
SETTINGS;
            $jsCode .= "\n";
        }

        $options = CJavaScript::encode($this->options);
        //>  the js code for setup
        $jsCode .= <<<SETUP
        jQuery("{$this->selector}").timeago({$options});
SETUP;

        //> register jsCode
        $this->cs->registerScript(__CLASS__ . '#' . $this->getId(), $jsCode, CClientScript::POS_READY);
        return $this;
    }

    /**
     * @param $name
     * @param $value
     */
    public function __set($name, $value)
    {
        try {
            //shouldn't swallow the parent ' __set operation
            parent::__set($name, $value);
        } catch (Exception $e) {
            $this->options[$name] = $value;
        }
    }

//----------below is optional or extra functionality support --------------------------------------------------------


    /**
     * @var array
     */
    public $settings = array();

    /**
     * @var array
     * language code and the corresponding js name ,the js file is under i18n dir.
     *  eg:   array('zh_cn'=>jquery.timeAgo.zh_cn.js)
     *
     */
    public $langMap = array();

    /**
     * @var bool
     * whether or not the language settings as global settings!
     *
     */
    public $langGlobal = false;

    /**
     * @return string
     */
    public function handleI18n(){
      $langSettings = '';
      $language = Yii::app()->language;
        if(isset($this->langMap[$language])){
          $jsFileName = $this->langMap[$language];
        }else{
            $jsFileName = 'jquery.timeago.'.$language.'.js';
        }
        $jsFilePath = dirname(__FILE__) . DIRECTORY_SEPARATOR . 'assets'. DIRECTORY_SEPARATOR .'i18n'. DIRECTORY_SEPARATOR. $jsFileName;
          if(is_file($jsFilePath)){
              if($this->langGlobal == true){
                  $this->cs->registerScriptFile($this->baseUrl.'/i18n/'.$jsFileName);
              }else{
                  $langSettings = file_get_contents($jsFilePath);
                 // die(__LINE__ .__FILE__.$langSettings);
                  /**
                  ob_start();
                  include($jsFilePath);
                  $langSettings = ob_get_clean();
                   * */
              }
          }
        return $langSettings;
    }

}

