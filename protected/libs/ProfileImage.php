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
 * ProfileImage is responsible for all profile images.
 *
 * This class handles all tasks related to profile images.
 * Will used for Space or User Profiles.
 *
 * Prefixes:
 *  "" = Resized profile image
 *  "_org" = Orginal uploaded file
 *
 * @package profiler.modules_core.file
 * @since 0.5
 * @author Zak
 */
class ProfileImage
{

    /**
     * @var String is the guid of user or space
     */
    protected $guid = "";

    /**
     * @var Integer width of the Image
     */
    protected $width = 150;

    /**
     * @var Integer height of the Image
     */
    protected $height = 150;

    /**
     * @var String folder name inside the uploads directory
     */
    protected $folder_images = "profiles";

    /**
     * @var String name of the default image
     */
    protected $defaultImage;
    
    public function getUsername($IDuser=NULL)
    {
        if($IDuser!=NULL)
            $username=User::findOne($IDuser);
        else
            $username=User::findOne(Yii::$app->user->getId());
        return $username->username;
    }

    /**
     * Constructor of Profile Image
     *
     * UserId is optional, if not given the current user will used
     *
     * @param type $guid
     */
    public function __construct($guid, $defaultImage = 'default_user')
    {
        $this->guid = $guid;
        $this->defaultImage = $defaultImage;
    }

    /**
     * Returns the URl of the Modified Profile Image
     *
     * @param String $prefix Prefix of the returned image
     * @return String Url of the profile image
     */
    public function getUrl($prefix = "")
    {

        $cacheId = 0;
        $path = "";

        // Workaround for absolute urls in console applications (Cron)
        if (Yii::app() instanceof CConsoleApplication) {
            $path = Yii::app()->request->getBaseUrl();
        } else {
            $path = Yii::app()->getBaseUrl(true);
        }


        if (file_exists($this->getPath($prefix))) {
            $path .= '/uploads/' . $this->folder_images . '/' . Yii::app()->user->model->username . '/avatars/';
            $path .= $this->guid . $prefix;
	        $path .= '.png';
        } elseif (is_object(Yii::app()->theme)) {
	        // get default image from theme (if exists)
	        $path = Yii::app()->theme->getFileUrl('/img/' . $this->defaultImage . '.jpg', true);
        } else {
	        $path .= '/img/' . $this->defaultImage . Yii::app()->user->model->username . '/avatars';
	        $path .= '.jpg';
        }

        $path .= '?cacheId=' . $cacheId;
        return $path;
    }

    /**
     * Indicates there is a custom profile image
     *
     * @return Boolean is there a profile image
     */
    public function hasImage()
    {
        return file_exists($this->getPath("_org"));
    }

    /**
     * Returns the Path of the Modified Profile Image
     *
     * @param String $prefix for the profile image
     * @return String Path to the profile image
     */
    public function getPath($prefix = "")
    {
        //$userdir = Yii::$app->user->identity->username;
        
        $path = Yii::getPathOfAlias('webroot') . DIRECTORY_SEPARATOR . "uploads" . DIRECTORY_SEPARATOR . $this->folder_images . DIRECTORY_SEPARATOR . Yii::app()->user->model->username . DIRECTORY_SEPARATOR . "avatars" . DIRECTORY_SEPARATOR;

        if (!file_exists($path))
            mkdir($path, 0777, true);

        $path .= $this->guid;
        $path .= $prefix;
        $path .= ".png";

        return $path;
    }

    /**
     * Crops the Original Image
     *
     * @param Int $x
     * @param Int $y
     * @param Int $h
     * @param Int $w
     * @return boolean indicates the success
     */
    public function cropOriginal($x, $y, $h, $w)
    {

        $image = imagecreatefrompng($this->getPath('_org'));

        // Create new destination Image
        $destImage = imagecreatetruecolor($this->width, $this->height);

        if (!imagecopyresampled($destImage, $image, 0, 0, $x, $y, $this->width, $this->height, $w, $h)) {
            return false;
        }

        unlink($this->getPath(''));
        imagepng($destImage, $this->getPath(''), 100);
    }

    /**
     * Sets a new profile image by given temp file
     *
     * @param mixed $file CUploadedFile or file path
     */
    public function setNew($file)
    {

        if ($file instanceof CUploadedFile) {
            $file = $file->getTempName();
        }

        $this->delete();
        ImageConverter::TransformToPNG($file, $this->getPath('_org'));
        ImageConverter::Resize($this->getPath('_org'), $this->getPath('_org'), array('width' => 400, 'mode' => 'max'));
        ImageConverter::Resize($this->getPath('_org'), $this->getPath(''), array('width' => $this->width, 'height' => $this->height));
    }

    /**
     * Deletes current profile
     */
    public function delete()
    {
        @unlink($this->getPath());
        @unlink($this->getPath('_org'));
    }

}

?>
