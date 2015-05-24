The Profiler Project
===================


The **Profiler** project is an open-source social networking project built in PHP. It uses the Yii and Zend frameworks and multiple JS libraries such as JQuery and AtWho.

----------


Development
-------------

Profiler is built in PHP and therefore requires a certain development environment to work properly, you can use any server or LAMP/WAMP stack to test Profiler.

The following requirements need to be met:

 - PHP 5.4+
 - MySQL
 - Apache 2.x
 - [PDO MySQL Extension](http://www.php.net/manual/en/ref.pdo-mysql.php) (php5-mysql)
 - [PHP ZIP Extension](http://php.net/manual/en/book.zip.php)
 - [PHP Multibyte String Support](http://php.net/manual/en/mbstring.setup.php) (php-mbstring)
 - [PHP EXIF Extension](http://php.net/manual/de/book.exif.php)
 - [PHP cURL Extension](http://php.net/manual/en/curl.setup.php) (php5-curl)

You will need to set up a MySQL database and import the **import.sql** file to set up the database structure and also add a few example users and posts so you can fully test the app.

Fork the repository and clone that repo and make any changes you wish to make, then submit a Pull Request and we will review it. If we approve it, it goes into our source code and you've successfully contributed, you're awesome!

> **Important!**

> - Make sure to set your database credentials in the **/protected/config/local/_settings.php** file!
> - Make sure you have read the requirements list above and installed all required modules/extensions.

