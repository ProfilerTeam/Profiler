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
 * ProfileBannerImage is responsible for the profile banner images.
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
class ProfileBannerImage
{

    /**
     * @var String is the guid of user or space
     */
    protected $guid = "";

    /**
     * @var Integer width of the Image
     */
    protected $width = 850;

    /**
     * @var Integer height of the Image
     */
    protected $height = 300;

    /**
     * @var String folder name inside the uploads directory
     */
    protected $folder_images = "profiles";

    /**
     * @var String name of the default image
     */
    protected $defaultImage;

    /**
     * Constructor of Profile Image
     *
     * UserId is optional, if not given the current user will used
     *
     * @param type $guid
     */
    public function __construct($guid, $defaultImage = 'default_banner')
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
			$path .= '/uploads/' . $this->folder_images . '/' . Yii::app()->user->model->username . '/banners/';
			$path .= $this->guid . $prefix;
			$path .= '.jpg';
		} elseif (Yii::app()->theme && Yii::app()->theme != "") {
			// get default image from theme (if exists)
			$path = Yii::app()->theme->getFileUrl('/img/' . $this->defaultImage . '.jpg', true);
		} else {
			$path = Yii::app()->getBaseUrl(true) . '/img/' . $this->defaultImage;
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
        $path = Yii::getPathOfAlias('webroot') . DIRECTORY_SEPARATOR . "uploads" . DIRECTORY_SEPARATOR . $this->folder_images . DIRECTORY_SEPARATOR . Yii::app()->user->model->username . DIRECTORY_SEPARATOR . "banners" . DIRECTORY_SEPARATOR;

        if (!is_dir($path))
            mkdir($path, 0777, true);

        $path .= $this->guid;
        $path .= $prefix;
        $path .= ".jpg";

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

        $image = imagecreatefromjpeg($this->getPath('_org'));

        // Create new destination Image
        $destImage = imagecreatetruecolor($this->width, $this->height);

        if (!imagecopyresampled($destImage, $image, 0, 0, $x, $y, $this->width, $this->height, $w, $h)) {
            return false;
        }

        unlink($this->getPath(''));
        imagejpeg($destImage, $this->getPath(''), 100);
    }

    /**
     * Sets a new profile image by given temp file
     *
     * @param CUploadedFile $file
     */
    public function setNew($file)
    {
        $this->delete();
        ImageConverter::TransformToJpeg($file->getTempName(), $this->getPath('_org'));
        ImageConverter::Resize($this->getPath('_org'), $this->getPath('_org'), array('width' => 850, 'mode' => 'max'));
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

    function debug_to_console( $data ) {

    if ( is_array( $data ) )
        $output = "<script>console.log( 'Debug Objects: " . implode( ',', $data) . "' );</script>";
    else
        $output = "<script>console.log( 'Debug Objects: " . $data . "' );</script>";

    echo $output;
    }
}

?>
