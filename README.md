The Profiler Project ![Travis Build Status](https://travis-ci.org/ProfilerTeam/Profiler.svg?branch=master)
===================

The **Profiler** project is an open-source social networking project built in PHP. It uses the Yii and Zend frameworks and multiple JS libraries such as JQuery and AtWho.

----------


Development
-------------

Profiler is built in PHP and therefore requires a certain development environment to work properly, you can use any server or LAMP/WAMP/XAMPP(Recommended!) stack to test Profiler.

The following requirements need to be met:

 - PHP 5.4+
 - MySQL
 - Apache 2.x
 - [PDO MySQL Extension](http://www.php.net/manual/en/ref.pdo-mysql.php) (php5-mysql)
 - [PHP ZIP Extension](http://php.net/manual/en/book.zip.php)
 - [PHP Multibyte String Support](http://php.net/manual/en/mbstring.setup.php) (php-mbstring)
 - [PHP EXIF Extension](http://php.net/manual/de/book.exif.php)
 - [PHP cURL Extension](http://php.net/manual/en/curl.setup.php) (php5-curl)

~~I am in the process of creating an **SQL** file that can be imported to your database that will automatically create all the tables needed by Profiler.~~
There's an example file now, called profiler.sql. Load that into your db.
The default user for the example file is called "root" and its password is "password".

Fork the repository and clone that repo and make any changes you wish to make, then submit a Pull Request and we will review it. If we approve it, it goes into our source code and you've successfully contributed, you're awesome!

> **Important!**

> - Make sure to set your database credentials in the **/protected/config/local/_settings.php** file!
> - Make sure you have read the requirements list above and installed all required modules/extensions.

Translation
===============================================
Profiler is easy to translate as it uses the Yii Framework, meaning all features are modular and easy to change. Translations are used by using `Yii::t('ExampleModule.category', 'Message');` and then modify the **protected/modules_core/exampleModule/messages/[language]** files like this:
![Swedish Translation Example](http://i.imgur.com/nb1pbeX.png)

Then you can create a pull request and your translation will be added into the main Profiler repository!


- Developers -
Zak and Member1221
