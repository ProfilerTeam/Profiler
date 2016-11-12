-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 12, 2016 at 12:32
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `profiler`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `module` varchar(100) DEFAULT '',
  `object_model` varchar(100) DEFAULT '',
  `object_id` varchar(100) DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `message` text,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `space_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `guid` varchar(45) NOT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `visibility` tinyint(4) DEFAULT NULL,
  `sticked` tinyint(4) DEFAULT NULL,
  `archived` tinytext,
  `space_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_page`
--

CREATE TABLE `custom_pages_page` (
  `id` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `content` text,
  `sort_order` int(11) DEFAULT NULL,
  `navigation_class` varchar(255) NOT NULL,
  `admin_only` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `id` int(11) NOT NULL,
  `guid` varchar(45) DEFAULT NULL,
  `object_model` varchar(100) DEFAULT '',
  `object_id` varchar(100) DEFAULT '',
  `file_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `mime_type` varchar(150) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `file`
--

INSERT INTO `file` (`id`, `guid`, `object_model`, `object_id`, `file_name`, `title`, `mime_type`, `size`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(3, '43127839-d3cb-48fd-b183-5ebefd44ee19', 'Post', '143', 'ProfilerLaunchPoster.png', 'ProfilerLaunchPoster.png', 'image/png', '874564', '2015-05-03 14:17:52', 1, '2015-05-03 14:18:01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `space_id` int(10) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_dn` varchar(255) DEFAULT NULL,
  `can_create_public_spaces` int(1) DEFAULT '1',
  `can_create_private_spaces` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`id`, `space_id`, `name`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `ldap_dn`, `can_create_public_spaces`, `can_create_private_spaces`) VALUES
(1, NULL, 'Users', 'Main and ONLY users group\n', '2015-03-02 23:30:46', NULL, '2015-03-03 23:07:55', 1, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_admin`
--

CREATE TABLE `group_admin` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_admin`
--

INSERT INTO `group_admin` (`id`, `user_id`, `group_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 1, '2015-03-03 23:07:55', 1, '2015-03-03 23:07:55', 1);

-- --------------------------------------------------------

--
-- Table structure for table `like`
--

CREATE TABLE `like` (
  `id` int(11) NOT NULL,
  `target_user_id` int(11) DEFAULT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logging`
--

CREATE TABLE `logging` (
  `id` int(11) NOT NULL,
  `level` varchar(128) DEFAULT NULL,
  `category` varchar(128) DEFAULT NULL,
  `logtime` int(11) DEFAULT NULL,
  `message` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logging`
--

INSERT INTO `logging` (`id`, `level`, `category`, `logtime`, `message`) VALUES
(5392, 'error', 'exception.CHttpException.404', 1478410207, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/logging/i...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/logging/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/logging/index\n---'),
(5393, 'error', 'exception.CHttpException.404', 1478410208, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/logging/i...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/logging/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/logging/index\n---'),
(5394, 'error', 'exception.CHttpException.404', 1478410211, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/setting/i...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/setting/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting/statistic\n---'),
(5395, 'error', 'exception.CHttpException.404', 1478410211, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/setting/i...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/setting/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting/statistic\n---'),
(5396, 'error', 'exception.CHttpException.404', 1478410222, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/setting/i...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/setting/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting/caching\n---'),
(5397, 'error', 'exception.CHttpException.404', 1478410222, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/setting/i...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/setting/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting/caching\n---'),
(5398, 'error', 'exception.CHttpException.404', 1478410231, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/setting/i...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/setting/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting/file\n---'),
(5399, 'error', 'exception.CHttpException.404', 1478410232, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/setting/i...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/setting/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting/file\n---'),
(5400, 'error', 'exception.CHttpException.404', 1478410240, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/setting/i...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/setting/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting/proxy\n---'),
(5401, 'error', 'exception.CHttpException.404', 1478410242, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/setting/i...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/setting/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting/proxy\n---'),
(5402, 'error', 'exception.CHttpException.404', 1478410244, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/setting/i...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/setting/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting/design\n---'),
(5403, 'error', 'exception.CHttpException.404', 1478410245, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/setting/i...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/setting/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting/design\n---'),
(5404, 'error', 'php', 1478410248, 'file_put_contents(/opt/lampp/htdocs/protected/config/local/_settings.php): failed to open stream: Adgang nægtet (/opt/lampp/htdocs/protected/models/HSetting.php:431)\nStack trace:\n#0 /opt/lampp/htdocs/protected/models/HSetting.php(317): rewriteConfiguration()\n#1 /opt/lampp/htdocs/protected/vendors/yii/db/ar/CActiveRecord.php(1126): HSetting->afterSave()\n#2 /opt/lampp/htdocs/protected/vendors/yii/db/ar/CActiveRecord.php(806): HSetting->update()\n#3 /opt/lampp/htdocs/protected/models/HSetting.php(188): HSetting->save()\n#4 /opt/lampp/htdocs/protected/modules_core/admin/controllers/SettingController.php(432): Set()\n#5 /opt/lampp/htdocs/protected/vendors/yii/web/actions/CInlineAction.php(49): SettingController->actionDesign()\n#6 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(308): CInlineAction->runWithParams()\n#7 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(133): SettingController->runAction()\n#8 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilter.php(40): CFilterChain->run()\n#9 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(1145): CAccessControlFilter->filter()\n#10 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CInlineFilter.php(58): SettingController->filterAccessControl()\n#11 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(130): CInlineFilter->filter()\n#12 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(291): CFilterChain->run()\n#13 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(265): SettingController->runActionWithFilters()\n#14 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): SettingController->run()\n#15 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): WebApplication->runController()\n#16 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): WebApplication->processRequest()\n#17 /opt/lampp/htdocs/index.php(22): WebApplication->run()\nREQUEST_URI=/admin/setting/design\nin /opt/lampp/htdocs/protected/models/HSetting.php (431)\nin /opt/lampp/htdocs/protected/models/HSetting.php (397)\nin /opt/lampp/htdocs/protected/models/HSetting.php (317)\nin /opt/lampp/htdocs/protected/models/HSetting.php (188)\nin /opt/lampp/htdocs/protected/modules_core/admin/controllers/SettingController.php (432)'),
(5405, 'error', 'exception.CHttpException.404', 1478410272, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/setting/i...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/setting/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting/design\n---'),
(5406, 'error', 'exception.CHttpException.404', 1478410272, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/setting/i...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/setting/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting/design\n---'),
(5407, 'error', 'exception.CHttpException.404', 1478410275, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/setting/i...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/setting/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting/design\n---'),
(5408, 'error', 'exception.CHttpException.404', 1478410276, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/setting/i...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/setting/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting/design\n---'),
(5409, 'error', 'exception.CHttpException.404', 1478410279, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5410, 'error', 'exception.CHttpException.404', 1478410491, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5411, 'error', 'exception.CHttpException.404', 1478410634, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5412, 'error', 'exception.CHttpException.404', 1478410720, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5413, 'error', 'exception.CHttpException.404', 1478410974, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5414, 'error', 'exception.CHttpException.404', 1478411381, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5415, 'error', 'exception.CHttpException.404', 1478411439, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5416, 'error', 'exception.CHttpException.404', 1478411474, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5417, 'error', 'exception.CHttpException.404', 1478411727, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5418, 'error', 'exception.CHttpException.404', 1478411741, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5419, 'error', 'exception.CHttpException.404', 1478411852, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5420, 'error', 'exception.CException', 1478412156, 'exception ''CException'' with message ''Property "PostFormWidget.type" is not defined.'' in /opt/lampp/htdocs/protected/vendors/yii/base/CComponent.php:173\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWidgetFactory.php(161): CComponent->__set(''type'', ''Dashboard'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CBaseController.php(146): CWidgetFactory->createWidget(Object(DashboardController), ''application.mod...'', Array)\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CBaseController.php(172): CBaseController->createWidget(''application.mod...'', Array)\n#3 /opt/lampp/htdocs/protected/modules_core/dashboard/views/dashboard/index.php(12): CBaseController->widget(''application.mod...'', Array)\n#4 /opt/lampp/htdocs/protected/vendors/yii/web/CBaseController.php(126): require(''/opt/lampp/htdo...'')\n#5 /opt/lampp/htdocs/protected/vendors/yii/web/CBaseController.php(95): CBaseController->renderInternal(''/opt/lampp/htdo...'', Array, true)\n#6 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(869): CBaseController->renderFile(''/opt/lampp/htdo...'', Array, true)\n#7 /opt/lampp/htdocs/protected/components/Controller.php(185): CController->renderPartial(''index'', Array, true, false)\n#8 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(782): Controller->renderPartial(''index'', Array, true)\n#9 /opt/lampp/htdocs/protected/modules_core/dashboard/controllers/DashboardController.php(40): CController->render(''index'', Array)\n#10 /opt/lampp/htdocs/protected/vendors/yii/web/actions/CInlineAction.php(49): DashboardController->actionIndex()\n#11 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(308): CInlineAction->runWithParams(Array)\n#12 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(133): CController->runAction(Object(CInlineAction))\n#13 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilter.php(40): CFilterChain->run()\n#14 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(1145): CFilter->filter(Object(CFilterChain))\n#15 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CInlineFilter.php(58): CController->filterAccessControl(Object(CFilterChain))\n#16 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(130): CInlineFilter->filter(Object(CFilterChain))\n#17 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(291): CFilterChain->run()\n#18 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(265): CController->runActionWithFilters(Object(CInlineAction), Array)\n#19 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run('''')\n#20 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''dashboard/dashb...'')\n#21 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#22 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#23 {main}\nREQUEST_URI=/dashboard\n---'),
(5421, 'error', 'exception.CHttpException.404', 1478412383, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5422, 'error', 'exception.CHttpException.404', 1478413315, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5423, 'error', 'exception.CHttpException.404', 1478413323, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5424, 'error', 'exception.CHttpException.404', 1478413326, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5425, 'error', 'exception.CHttpException.404', 1478413326, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5426, 'error', 'exception.CHttpException.404', 1478413327, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5427, 'error', 'exception.CHttpException.404', 1478413327, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5428, 'error', 'exception.CHttpException.404', 1478413327, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5429, 'error', 'exception.CHttpException.404', 1478413358, 'exception ''CHttpException'' with message ''Unable to resolve the request "localhost/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''localhost/img/P...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/localhost/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5430, 'error', 'exception.CHttpException.404', 1478413380, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5431, 'error', 'exception.CHttpException.404', 1478413391, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5432, 'error', 'exception.CHttpException.404', 1478413397, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5433, 'error', 'exception.CHttpException.404', 1478413397, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5434, 'error', 'exception.CHttpException.404', 1478413398, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5435, 'error', 'exception.CHttpException.404', 1478413398, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5436, 'error', 'exception.CHttpException.404', 1478413399, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5437, 'error', 'exception.CHttpException.404', 1478413406, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5438, 'error', 'exception.CHttpException.404', 1478413406, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5439, 'error', 'exception.CHttpException.404', 1478413407, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5440, 'error', 'exception.CHttpException.404', 1478413408, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5441, 'error', 'exception.CHttpException.404', 1478413408, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5442, 'error', 'exception.CHttpException.404', 1478413410, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''js'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''js'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/profile/js...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/u/admin/user/profile/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/user/profile/about\n---'),
(5443, 'error', 'exception.CHttpException.404', 1478413410, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/profile/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/u/admin/user/profile/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/user/profile/about\n---'),
(5444, 'error', 'exception.CHttpException.404', 1478413411, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/profile/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/u/admin/user/profile/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/user/profile/about\n---'),
(5445, 'error', 'exception.CHttpException.404', 1478413411, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''js'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''js'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/profile/js...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/u/admin/user/profile/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/user/profile/about\n---'),
(5446, 'error', 'exception.CHttpException.404', 1478413416, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5447, 'error', 'exception.CHttpException.404', 1478413416, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5448, 'error', 'exception.CHttpException.404', 1478413417, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5449, 'error', 'exception.CHttpException.404', 1478413417, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5450, 'error', 'exception.CHttpException.404', 1478413417, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5451, 'error', 'exception.CHttpException.404', 1478413421, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5452, 'error', 'exception.CHttpException.404', 1478413421, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5453, 'error', 'exception.CHttpException.404', 1478413426, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting\n---');
INSERT INTO `logging` (`id`, `level`, `category`, `logtime`, `message`) VALUES
(5454, 'error', 'exception.CHttpException.404', 1478413427, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting\n---'),
(5455, 'error', 'exception.CHttpException.404', 1478413434, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5456, 'error', 'exception.CHttpException.404', 1478413436, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5457, 'error', 'exception.CHttpException.404', 1478413440, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/userprofi...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/userprofile/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/userprofile/index\n---'),
(5458, 'error', 'exception.CHttpException.404', 1478413440, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/userprofi...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/userprofile/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/userprofile/index\n---'),
(5459, 'error', 'exception.CHttpException.404', 1478413460, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/userprofile\n---'),
(5460, 'error', 'exception.CHttpException.404', 1478413461, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/userprofile\n---'),
(5461, 'error', 'exception.CHttpException.404', 1478413474, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/userprofile\n---'),
(5462, 'error', 'exception.CHttpException.404', 1478413475, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/userprofile\n---'),
(5463, 'error', 'exception.CHttpException.404', 1478413494, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5464, 'error', 'exception.CHttpException.404', 1478413494, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5465, 'error', 'exception.CHttpException.404', 1478413495, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5466, 'error', 'exception.CHttpException.404', 1478413495, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5467, 'error', 'exception.CHttpException.404', 1478413495, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5468, 'error', 'exception.CHttpException.404', 1478413498, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5469, 'error', 'exception.CHttpException.404', 1478413498, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5470, 'error', 'exception.CHttpException.404', 1478413517, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5471, 'error', 'exception.CHttpException.404', 1478413521, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5472, 'error', 'exception.CHttpException.404', 1478413521, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5473, 'error', 'exception.CHttpException.404', 1478413521, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5474, 'error', 'exception.CHttpException.404', 1478413521, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5475, 'error', 'exception.CHttpException.404', 1478413521, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5476, 'error', 'exception.CHttpException.404', 1478413527, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting\n---'),
(5477, 'error', 'exception.CHttpException.404', 1478413527, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting\n---'),
(5478, 'error', 'exception.CHttpException.404', 1478413708, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5479, 'error', 'exception.CHttpException.404', 1478413711, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5480, 'error', 'exception.CHttpException.404', 1478413711, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5481, 'error', 'exception.CHttpException.404', 1478413711, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5482, 'error', 'exception.CHttpException.404', 1478413711, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5483, 'error', 'exception.CHttpException.404', 1478413711, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5484, 'error', 'exception.CHttpException.404', 1478413716, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5485, 'error', 'exception.CHttpException.404', 1478413718, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5486, 'error', 'exception.CHttpException.404', 1478413724, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5487, 'error', 'exception.CHttpException.404', 1478413726, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5488, 'error', 'exception.CHttpException.404', 1478413730, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting\n---'),
(5489, 'error', 'exception.CHttpException.404', 1478413730, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting\n---'),
(5490, 'error', 'exception.CHttpException.404', 1478413733, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/userprofi...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/userprofile/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/userprofile/index\n---'),
(5491, 'error', 'exception.CHttpException.404', 1478413734, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/userprofi...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/userprofile/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/userprofile/index\n---'),
(5492, 'error', 'exception.CHttpException.404', 1478413821, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5493, 'error', 'exception.CHttpException.404', 1478413830, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5494, 'error', 'exception.CHttpException.404', 1478413830, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5495, 'error', 'exception.CHttpException.404', 1478413832, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5496, 'error', 'exception.CHttpException.404', 1478413832, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5497, 'error', 'exception.CHttpException.404', 1478413832, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5498, 'error', 'exception.CHttpException.404', 1478413834, 'exception ''CHttpException'' with message ''Unable to resolve the request "undefined".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''undefined'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/undefined\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5499, 'error', 'exception.CHttpException.404', 1478413834, 'exception ''CHttpException'' with message ''Unable to resolve the request "undefined".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''undefined'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/undefined\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5500, 'error', 'exception.CHttpException.404', 1478413835, 'exception ''CHttpException'' with message ''Unable to resolve the request "undefined".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''undefined'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/undefined\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5501, 'error', 'exception.CHttpException.404', 1478413919, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5502, 'error', 'exception.CHttpException.404', 1478413919, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5503, 'error', 'exception.CHttpException.404', 1478413920, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5504, 'error', 'exception.CHttpException.404', 1478413920, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5505, 'error', 'exception.CHttpException.404', 1478413920, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5506, 'error', 'exception.CHttpException.404', 1478413924, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting\n---'),
(5507, 'error', 'exception.CHttpException.404', 1478413926, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting\n---'),
(5508, 'error', 'exception.CHttpException.404', 1478413929, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5509, 'error', 'exception.CHttpException.404', 1478413930, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5510, 'error', 'exception.CHttpException.404', 1478414074, 'exception ''CHttpException'' with message ''User not found!'' in /opt/lampp/htdocs/protected/modules_core/admin/controllers/UserController.php:71\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/actions/CInlineAction.php(49): UserController->actionEdit()\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(308): CInlineAction->runWithParams(Array)\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(133): CController->runAction(Object(CInlineAction))\n#3 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilter.php(40): CFilterChain->run()\n#4 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(1145): CFilter->filter(Object(CFilterChain))\n#5 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CInlineFilter.php(58): CController->filterAccessControl(Object(CFilterChain))\n#6 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(130): CInlineFilter->filter(Object(CFilterChain))\n#7 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(291): CFilterChain->run()\n#8 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(265): CController->runActionWithFilters(Object(CInlineAction), Array)\n#9 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''edit'')\n#10 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/edit...'')\n#11 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#12 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#13 {main}\nREQUEST_URI=/admin/user/edit/id/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user/edit/id/34\n---'),
(5511, 'error', 'exception.CHttpException.404', 1478414074, 'exception ''CHttpException'' with message ''User not found!'' in /opt/lampp/htdocs/protected/modules_core/admin/controllers/UserController.php:71\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/actions/CInlineAction.php(49): UserController->actionEdit()\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(308): CInlineAction->runWithParams(Array)\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(133): CController->runAction(Object(CInlineAction))\n#3 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilter.php(40): CFilterChain->run()\n#4 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(1145): CFilter->filter(Object(CFilterChain))\n#5 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CInlineFilter.php(58): CController->filterAccessControl(Object(CFilterChain))\n#6 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(130): CInlineFilter->filter(Object(CFilterChain))\n#7 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(291): CFilterChain->run()\n#8 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(265): CController->runActionWithFilters(Object(CInlineAction), Array)\n#9 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''edit'')\n#10 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/edit...'')\n#11 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#12 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#13 {main}\nREQUEST_URI=/admin/user/edit/id/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user/edit/id/34\n---'),
(5512, 'error', 'exception.CHttpException.404', 1478414083, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5513, 'error', 'exception.CHttpException.404', 1478414083, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5514, 'error', 'exception.CHttpException.404', 1478414083, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5515, 'error', 'exception.CHttpException.404', 1478414083, 'exception ''CHttpException'' with message ''Unable to resolve the request "js/bootbox.min.js".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''js/bootbox.min....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/admin/js/bootbox.min.js\nHTTP_REFERER=http://localhost/u/admin/home\n---'),
(5516, 'error', 'exception.CHttpException.404', 1478414084, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5517, 'error', 'exception.CHttpException.404', 1478414086, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5518, 'error', 'exception.CHttpException.404', 1478414088, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5519, 'error', 'exception.CHttpException.404', 1478414096, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5520, 'error', 'exception.CHttpException.404', 1478414098, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5521, 'error', 'exception.CHttpException.404', 1478414178, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting\n---'),
(5522, 'error', 'exception.CHttpException.404', 1478414179, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting\n---');
INSERT INTO `logging` (`id`, `level`, `category`, `logtime`, `message`) VALUES
(5523, 'error', 'exception.CHttpException.404', 1478414184, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5524, 'error', 'exception.CHttpException.404', 1478414185, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5525, 'error', 'exception.CHttpException.404', 1478414187, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/img/...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/user/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user/add\n---'),
(5526, 'error', 'exception.CHttpException.404', 1478414188, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/img/...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/user/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user/add\n---'),
(5527, 'error', 'exception.CHttpException.404', 1478414217, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/img/...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/user/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user/add\n---'),
(5528, 'error', 'exception.CHttpException.404', 1478414218, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/img/...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/user/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user/add\n---'),
(5529, 'error', 'exception.CHttpException.404', 1478414226, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/img/...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/user/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user/index\n---'),
(5530, 'error', 'exception.CHttpException.404', 1478414228, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/img/...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/user/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user/index\n---'),
(5531, 'error', 'exception.CHttpException.404', 1478414248, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5532, 'error', 'exception.CHttpException.404', 1478414252, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5533, 'error', 'exception.CHttpException.404', 1478414253, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5534, 'error', 'exception.CHttpException.404', 1478414258, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5535, 'error', 'exception.CHttpException.404', 1478414259, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5536, 'error', 'exception.CHttpException.404', 1478414262, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting\n---'),
(5537, 'error', 'exception.CHttpException.404', 1478414264, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting\n---'),
(5538, 'error', 'exception.CHttpException.404', 1478414267, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5539, 'error', 'exception.CHttpException.404', 1478414267, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5540, 'error', 'exception.CHttpException.404', 1478414271, 'exception ''CHttpException'' with message ''User not found!'' in /opt/lampp/htdocs/protected/modules_core/admin/controllers/UserController.php:71\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/actions/CInlineAction.php(49): UserController->actionEdit()\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(308): CInlineAction->runWithParams(Array)\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(133): CController->runAction(Object(CInlineAction))\n#3 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilter.php(40): CFilterChain->run()\n#4 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(1145): CFilter->filter(Object(CFilterChain))\n#5 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CInlineFilter.php(58): CController->filterAccessControl(Object(CFilterChain))\n#6 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(130): CInlineFilter->filter(Object(CFilterChain))\n#7 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(291): CFilterChain->run()\n#8 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(265): CController->runActionWithFilters(Object(CInlineAction), Array)\n#9 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''edit'')\n#10 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/edit...'')\n#11 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#12 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#13 {main}\nREQUEST_URI=/admin/user/edit/id/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user/edit/id/34\n---'),
(5541, 'error', 'exception.CHttpException.404', 1478414271, 'exception ''CHttpException'' with message ''User not found!'' in /opt/lampp/htdocs/protected/modules_core/admin/controllers/UserController.php:71\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/actions/CInlineAction.php(49): UserController->actionEdit()\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(308): CInlineAction->runWithParams(Array)\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(133): CController->runAction(Object(CInlineAction))\n#3 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilter.php(40): CFilterChain->run()\n#4 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(1145): CFilter->filter(Object(CFilterChain))\n#5 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CInlineFilter.php(58): CController->filterAccessControl(Object(CFilterChain))\n#6 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(130): CInlineFilter->filter(Object(CFilterChain))\n#7 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(291): CFilterChain->run()\n#8 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(265): CController->runActionWithFilters(Object(CInlineAction), Array)\n#9 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''edit'')\n#10 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/edit...'')\n#11 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#12 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#13 {main}\nREQUEST_URI=/admin/user/edit/id/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user/edit/id/34\n---'),
(5542, 'error', 'exception.CHttpException.404', 1478414291, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5543, 'error', 'exception.CHttpException.404', 1478414291, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5544, 'error', 'exception.CHttpException.404', 1478414294, 'exception ''CHttpException'' with message ''User not found!'' in /opt/lampp/htdocs/protected/modules_core/admin/controllers/UserController.php:71\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/actions/CInlineAction.php(49): UserController->actionEdit()\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(308): CInlineAction->runWithParams(Array)\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(133): CController->runAction(Object(CInlineAction))\n#3 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilter.php(40): CFilterChain->run()\n#4 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(1145): CFilter->filter(Object(CFilterChain))\n#5 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CInlineFilter.php(58): CController->filterAccessControl(Object(CFilterChain))\n#6 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(130): CInlineFilter->filter(Object(CFilterChain))\n#7 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(291): CFilterChain->run()\n#8 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(265): CController->runActionWithFilters(Object(CInlineAction), Array)\n#9 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''edit'')\n#10 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/edit...'')\n#11 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#12 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#13 {main}\nREQUEST_URI=/admin/user/edit/id/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user/edit/id/35\n---'),
(5545, 'error', 'exception.CHttpException.404', 1478414295, 'exception ''CHttpException'' with message ''User not found!'' in /opt/lampp/htdocs/protected/modules_core/admin/controllers/UserController.php:71\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/actions/CInlineAction.php(49): UserController->actionEdit()\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(308): CInlineAction->runWithParams(Array)\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(133): CController->runAction(Object(CInlineAction))\n#3 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilter.php(40): CFilterChain->run()\n#4 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(1145): CFilter->filter(Object(CFilterChain))\n#5 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CInlineFilter.php(58): CController->filterAccessControl(Object(CFilterChain))\n#6 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(130): CInlineFilter->filter(Object(CFilterChain))\n#7 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(291): CFilterChain->run()\n#8 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(265): CController->runActionWithFilters(Object(CInlineAction), Array)\n#9 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''edit'')\n#10 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/edit...'')\n#11 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#12 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#13 {main}\nREQUEST_URI=/admin/user/edit/id/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user/edit/id/35\n---'),
(5546, 'error', 'exception.CHttpException.404', 1478414322, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5547, 'error', 'exception.CHttpException.404', 1478414322, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5548, 'error', 'exception.CHttpException.404', 1478414334, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5549, 'error', 'exception.CHttpException.404', 1478414341, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5550, 'error', 'exception.CHttpException.404', 1478414342, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5551, 'error', 'exception.CHttpException.404', 1478414348, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5552, 'error', 'exception.CHttpException.404', 1478414350, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/user/account/edit\n---'),
(5553, 'error', 'exception.CHttpException.404', 1478414354, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting\n---'),
(5554, 'error', 'exception.CHttpException.404', 1478414354, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting\n---'),
(5555, 'error', 'exception.CHttpException.404', 1478414359, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5556, 'error', 'exception.CHttpException.404', 1478414359, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5557, 'error', 'exception.CHttpException.404', 1478414361, 'exception ''CHttpException'' with message ''User not found!'' in /opt/lampp/htdocs/protected/modules_core/admin/controllers/UserController.php:300\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/actions/CInlineAction.php(49): UserController->actionDelete()\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(308): CInlineAction->runWithParams(Array)\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(133): CController->runAction(Object(CInlineAction))\n#3 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilter.php(40): CFilterChain->run()\n#4 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(1145): CFilter->filter(Object(CFilterChain))\n#5 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CInlineFilter.php(58): CController->filterAccessControl(Object(CFilterChain))\n#6 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(130): CInlineFilter->filter(Object(CFilterChain))\n#7 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(291): CFilterChain->run()\n#8 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(265): CController->runActionWithFilters(Object(CInlineAction), Array)\n#9 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''delete'')\n#10 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/dele...'')\n#11 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#12 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#13 {main}\nREQUEST_URI=/admin/user/delete/id/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user/delete/id/34\n---'),
(5558, 'error', 'exception.CHttpException.404', 1478414362, 'exception ''CHttpException'' with message ''User not found!'' in /opt/lampp/htdocs/protected/modules_core/admin/controllers/UserController.php:300\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/actions/CInlineAction.php(49): UserController->actionDelete()\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(308): CInlineAction->runWithParams(Array)\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(133): CController->runAction(Object(CInlineAction))\n#3 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilter.php(40): CFilterChain->run()\n#4 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(1145): CFilter->filter(Object(CFilterChain))\n#5 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CInlineFilter.php(58): CController->filterAccessControl(Object(CFilterChain))\n#6 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(130): CInlineFilter->filter(Object(CFilterChain))\n#7 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(291): CFilterChain->run()\n#8 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(265): CController->runActionWithFilters(Object(CInlineAction), Array)\n#9 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''delete'')\n#10 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/dele...'')\n#11 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#12 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#13 {main}\nREQUEST_URI=/admin/user/delete/id/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user/delete/id/34\n---'),
(5559, 'error', 'exception.CHttpException.404', 1478414364, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5560, 'error', 'exception.CHttpException.404', 1478414365, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5561, 'error', 'exception.CHttpException.404', 1478414430, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5562, 'error', 'exception.CHttpException.404', 1478414433, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/root/home\n---'),
(5563, 'error', 'exception.CHttpException.404', 1478414433, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/root/home\n---'),
(5564, 'error', 'exception.CHttpException.404', 1478414433, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5565, 'error', 'exception.CHttpException.404', 1478433604, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5566, 'error', 'exception.CHttpException.404', 1478433632, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5567, 'error', 'exception.CHttpException.404', 1478433636, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/root/home\n---'),
(5568, 'error', 'exception.CHttpException.404', 1478433636, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/root/home\n---'),
(5569, 'error', 'exception.CHttpException.404', 1478433636, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5570, 'error', 'exception.CHttpException.404', 1478433663, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting\n---'),
(5571, 'error', 'exception.CHttpException.404', 1478433663, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/setting\n---'),
(5572, 'error', 'exception.CHttpException.404', 1478433666, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5573, 'error', 'exception.CHttpException.404', 1478433666, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5574, 'error', 'exception.CHttpException.404', 1478433668, 'exception ''CHttpException'' with message ''User not found!'' in /opt/lampp/htdocs/protected/modules_core/admin/controllers/UserController.php:71\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/actions/CInlineAction.php(49): UserController->actionEdit()\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(308): CInlineAction->runWithParams(Array)\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(133): CController->runAction(Object(CInlineAction))\n#3 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilter.php(40): CFilterChain->run()\n#4 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(1145): CFilter->filter(Object(CFilterChain))\n#5 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CInlineFilter.php(58): CController->filterAccessControl(Object(CFilterChain))\n#6 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(130): CInlineFilter->filter(Object(CFilterChain))\n#7 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(291): CFilterChain->run()\n#8 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(265): CController->runActionWithFilters(Object(CInlineAction), Array)\n#9 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''edit'')\n#10 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/edit...'')\n#11 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#12 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#13 {main}\nREQUEST_URI=/admin/user/edit/id/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user/edit/id/35\n---'),
(5575, 'error', 'exception.CHttpException.404', 1478433669, 'exception ''CHttpException'' with message ''User not found!'' in /opt/lampp/htdocs/protected/modules_core/admin/controllers/UserController.php:71\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/actions/CInlineAction.php(49): UserController->actionEdit()\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(308): CInlineAction->runWithParams(Array)\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(133): CController->runAction(Object(CInlineAction))\n#3 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilter.php(40): CFilterChain->run()\n#4 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(1145): CFilter->filter(Object(CFilterChain))\n#5 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CInlineFilter.php(58): CController->filterAccessControl(Object(CFilterChain))\n#6 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(130): CInlineFilter->filter(Object(CFilterChain))\n#7 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(291): CFilterChain->run()\n#8 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(265): CController->runActionWithFilters(Object(CInlineAction), Array)\n#9 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''edit'')\n#10 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/edit...'')\n#11 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#12 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#13 {main}\nREQUEST_URI=/admin/user/edit/id/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user/edit/id/35\n---'),
(5576, 'error', 'exception.CHttpException.404', 1478433680, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5577, 'error', 'exception.CHttpException.404', 1478433680, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/admin/user\n---'),
(5578, 'error', 'exception.CHttpException.404', 1478433682, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/root/home\n---'),
(5579, 'error', 'exception.CHttpException.404', 1478433682, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/root/home\n---'),
(5580, 'error', 'exception.CHttpException.404', 1478433682, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---');
INSERT INTO `logging` (`id`, `level`, `category`, `logtime`, `message`) VALUES
(5581, 'error', 'exception.CHttpException.404', 1478433696, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/root/home\n---'),
(5582, 'error', 'exception.CHttpException.404', 1478433696, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/root/home\n---'),
(5583, 'error', 'exception.CHttpException.404', 1478433696, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5584, 'error', 'exception.CHttpException.404', 1478433703, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/root/home\n---'),
(5585, 'error', 'exception.CHttpException.404', 1478433703, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/root/home\n---'),
(5586, 'error', 'exception.CHttpException.404', 1478433703, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5587, 'error', 'exception.CHttpException.404', 1478433927, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5588, 'error', 'exception.CHttpException.404', 1478433951, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5589, 'error', 'exception.CHttpException.404', 1478433963, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/root/home\n---'),
(5590, 'error', 'exception.CHttpException.404', 1478433963, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/root/home\n---'),
(5591, 'error', 'exception.CHttpException.404', 1478433964, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5592, 'error', 'exception.CHttpException.404', 1478433982, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/profile/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/u/root/user/profile/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/root/user/profile/about\n---'),
(5593, 'error', 'exception.CHttpException.404', 1478433982, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/profile/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/u/root/user/profile/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/root/user/profile/about\n---'),
(5594, 'error', 'exception.CHttpException.404', 1478433984, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/root/home\n---'),
(5595, 'error', 'exception.CHttpException.404', 1478433985, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://localhost/u/root/home\n---'),
(5596, 'error', 'exception.CHttpException.404', 1478433985, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://localhost/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5597, 'error', 'exception.CHttpException.404', 1478899586, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5598, 'error', 'exception.CHttpException.404', 1478899591, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://b22a8e83.ngrok.io/user/account/edit\n---'),
(5599, 'error', 'exception.CHttpException.404', 1478899615, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/account/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/user/account/img/PAGE_LOGO2.png\nHTTP_REFERER=http://b22a8e83.ngrok.io/user/account/edit\n---'),
(5600, 'error', 'exception.CHttpException.404', 1478899624, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://b22a8e83.ngrok.io/admin/setting\n---'),
(5601, 'error', 'exception.CHttpException.404', 1478899628, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=http://b22a8e83.ngrok.io/admin/user\n---'),
(5602, 'error', 'exception.CHttpException.404', 1478899631, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/img/...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/user/img/PAGE_LOGO2.png\nHTTP_REFERER=http://b22a8e83.ngrok.io/admin/user/add\n---'),
(5603, 'error', 'exception.CHttpException.404', 1478899654, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/img/...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/user/img/PAGE_LOGO2.png\nHTTP_REFERER=http://b22a8e83.ngrok.io/admin/user/add\n---'),
(5604, 'error', 'exception.CHttpException.404', 1478899677, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/img/...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/user/img/PAGE_LOGO2.png\nHTTP_REFERER=http://b22a8e83.ngrok.io/admin/user/index\n---'),
(5605, 'error', 'exception.CHttpException.404', 1478899708, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5606, 'error', 'exception.CHttpException.404', 1478899724, 'exception ''CHttpException'' with message ''Unable to resolve the request "undefined".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''undefined'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/undefined\nHTTP_REFERER=http://b22a8e83.ngrok.io/dashboard\n---'),
(5607, 'error', 'exception.CHttpException.404', 1478899724, 'exception ''CHttpException'' with message ''Unable to resolve the request "undefined".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''undefined'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/undefined\nHTTP_REFERER=http://b22a8e83.ngrok.io/dashboard\n---'),
(5608, 'error', 'exception.CHttpException.500', 1478899736, 'exception ''CHttpException'' with message ''Invalid target class given'' in /opt/lampp/htdocs/protected/modules_core/comment/controllers/CommentController.php:73\nStack trace:\n#0 /opt/lampp/htdocs/protected/modules_core/comment/controllers/CommentController.php(218): CommentController->loadTargetModel()\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/actions/CInlineAction.php(49): CommentController->actionDelete()\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(308): CInlineAction->runWithParams(Array)\n#3 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(133): CController->runAction(Object(CInlineAction))\n#4 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilter.php(40): CFilterChain->run()\n#5 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(1145): CFilter->filter(Object(CFilterChain))\n#6 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CInlineFilter.php(58): CController->filterAccessControl(Object(CFilterChain))\n#7 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(130): CInlineFilter->filter(Object(CFilterChain))\n#8 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(291): CFilterChain->run()\n#9 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(265): CController->runActionWithFilters(Object(CInlineAction), Array)\n#10 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''delete'')\n#11 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''comment/comment...'')\n#12 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#13 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#14 {main}\nREQUEST_URI=/comment/comment/delete/model/Post/id/1/cid/1\nHTTP_REFERER=http://b22a8e83.ngrok.io/dashboard\n---'),
(5609, 'error', 'exception.CHttpException.404', 1478899743, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5610, 'error', 'exception.CHttpException.404', 1478899822, 'exception ''CHttpException'' with message ''Unable to resolve the request "undefined".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''undefined'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/undefined\nHTTP_REFERER=http://b22a8e83.ngrok.io/dashboard\n---'),
(5611, 'error', 'exception.CHttpException.404', 1478899827, 'exception ''CHttpException'' with message ''Unable to resolve the request "undefined".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''undefined'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/undefined\nHTTP_REFERER=http://b22a8e83.ngrok.io/dashboard\n---'),
(5612, 'error', 'exception.CHttpException.404', 1478899939, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://b22a8e83.ngrok.io/u/root/home\n---'),
(5613, 'error', 'exception.CHttpException.404', 1478899940, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5614, 'error', 'exception.CHttpException.404', 1478900020, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/profile/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/u/root/user/profile/img/PAGE_LOGO2.png\nHTTP_REFERER=http://b22a8e83.ngrok.io/u/root/user/profile/about\n---'),
(5615, 'error', 'exception.CHttpException.404', 1478900021, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/profile/im...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/u/root/user/profile/img/PAGE_LOGO2.png\nHTTP_REFERER=http://b22a8e83.ngrok.io/u/root/user/profile/about\n---'),
(5616, 'error', 'exception.CHttpException.404', 1478900038, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5617, 'error', 'exception.CHttpException.404', 1478900122, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5618, 'error', 'exception.CHttpException.404', 1478900182, 'exception ''CHttpException'' with message ''Could not find any public space to run tour!'' in /opt/lampp/htdocs/protected/modules_core/tour/controllers/TourController.php:62\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/actions/CInlineAction.php(49): TourController->actionStartSpaceTour()\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(308): CInlineAction->runWithParams(Array)\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(286): CController->runAction(Object(CInlineAction))\n#3 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(265): CController->runActionWithFilters(Object(CInlineAction), Array)\n#4 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''startSpaceTour'')\n#5 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''tour/tour/start...'')\n#6 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#7 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#8 {main}\nREQUEST_URI=/tour/tour/startSpaceTour\nHTTP_REFERER=http://b22a8e83.ngrok.io/dashboard?tour=1\n---'),
(5619, 'error', 'exception.CHttpException.404', 1478900183, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''tour/tour/img/P...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/tour/tour/img/PAGE_LOGO2.png\nHTTP_REFERER=http://b22a8e83.ngrok.io/tour/tour/startSpaceTour\n---'),
(5620, 'error', 'exception.CHttpException.404', 1478900191, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5621, 'error', 'exception.CHttpException.404', 1478900258, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5622, 'error', 'exception.CHttpException.404', 1478900307, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://b22a8e83.ngrok.io/u/root/home\n---'),
(5623, 'error', 'exception.CHttpException.404', 1478900308, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5624, 'error', 'exception.CHttpException.404', 1478900346, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5625, 'error', 'exception.CHttpException.404', 1478901138, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5626, 'error', 'exception.CHttpException.404', 1478901153, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5627, 'error', 'exception.CHttpException.404', 1478901157, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/admin/setting\n---'),
(5628, 'error', 'exception.CHttpException.404', 1478901161, 'exception ''CHttpException'' with message ''Unable to resolve the request "admin/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/img/PAGE_...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/admin/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/admin/user\n---'),
(5629, 'error', 'exception.CHttpException.404', 1478901165, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/img/...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/user/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/admin/user/add\n---'),
(5630, 'error', 'exception.CHttpException.404', 1478901166, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/img/...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/user/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/admin/user/add\n---'),
(5631, 'error', 'exception.CHttpException.404', 1478901189, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''admin/user/img/...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/admin/user/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/admin/user/index\n---'),
(5632, 'error', 'exception.CHttpException.404', 1478901284, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5633, 'error', 'exception.CHttpException.404', 1478901292, 'exception ''CHttpException'' with message ''The system is unable to find the requested action "img".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CController.php:483\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(270): CController->missingAction(''img'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''img'')\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''mail/mail/img/P...'')\n#3 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#4 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#5 {main}\nREQUEST_URI=/mail/mail/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/mail/mail/index\n---'),
(5634, 'error', 'exception.CHttpException.404', 1478901297, 'exception ''CHttpException'' with message ''Unable to resolve the request "directory/img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''directory/img/P...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/directory/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/directory/members\n---'),
(5635, 'error', 'exception.CHttpException.404', 1478901339, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5636, 'error', 'exception.CHttpException.404', 1478901340, 'exception ''CHttpException'' with message ''Unable to resolve the request "undefined".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''undefined'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/undefined\nHTTP_REFERER=https://b22a8e83.ngrok.io/dashboard\n---'),
(5637, 'error', 'exception.CHttpException.404', 1478901512, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5638, 'error', 'exception.CHttpException.404', 1478901513, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5639, 'error', 'exception.CHttpException.404', 1478901766, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5640, 'error', 'exception.CHttpException.404', 1478901766, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5641, 'error', 'exception.CHttpException.404', 1478901799, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5642, 'error', 'exception.CHttpException.404', 1478901820, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5643, 'error', 'exception.CHttpException.404', 1478901821, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5644, 'error', 'exception.CHttpException.404', 1478901837, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5645, 'error', 'exception.CHttpException.404', 1478901895, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5646, 'error', 'exception.CHttpException.404', 1478901903, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5647, 'error', 'exception.CHttpException.404', 1478901903, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5648, 'error', 'exception.CHttpException.404', 1478902164, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---');
INSERT INTO `logging` (`id`, `level`, `category`, `logtime`, `message`) VALUES
(5649, 'error', 'exception.CHttpException.404', 1478902555, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5650, 'error', 'exception.CHttpException.404', 1478902557, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5651, 'error', 'exception.CHttpException.404', 1478902557, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5652, 'error', 'exception.CHttpException.404', 1478903503, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5653, 'error', 'exception.CHttpException.404', 1478903505, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5654, 'error', 'exception.CHttpException.404', 1478903505, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5655, 'error', 'exception.CHttpException.404', 1478903565, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5656, 'error', 'exception.CHttpException.404', 1478903566, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5657, 'error', 'exception.CHttpException.404', 1478903567, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5658, 'error', 'exception.CHttpException.404', 1478903583, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5659, 'error', 'exception.CHttpException.404', 1478903583, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5660, 'error', 'exception.CHttpException.404', 1478903631, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5661, 'error', 'exception.CHttpException.404', 1478903631, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5662, 'error', 'exception.CHttpException.404', 1478903802, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5663, 'error', 'exception.CHttpException.404', 1478903803, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5664, 'error', 'exception.CHttpException.404', 1478903861, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5665, 'error', 'exception.CHttpException.404', 1478903862, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5666, 'error', 'exception.CHttpException.404', 1478903878, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5667, 'error', 'exception.CHttpException.404', 1478903878, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5668, 'error', 'exception.CHttpException.404', 1478903889, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5669, 'error', 'exception.CHttpException.404', 1478903890, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5670, 'error', 'exception.CHttpException.404', 1478904104, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5671, 'error', 'exception.CHttpException.404', 1478904104, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5672, 'error', 'exception.CHttpException.404', 1478904123, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5673, 'error', 'exception.CHttpException.404', 1478904124, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5674, 'error', 'exception.CHttpException.404', 1478904164, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5675, 'error', 'exception.CHttpException.404', 1478904165, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5676, 'error', 'exception.CHttpException.404', 1478904220, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5677, 'error', 'exception.CHttpException.404', 1478904221, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5678, 'error', 'exception.CHttpException.404', 1478904235, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5679, 'error', 'exception.CHttpException.404', 1478904236, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5680, 'error', 'exception.CHttpException.404', 1478904279, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5681, 'error', 'exception.CHttpException.404', 1478904280, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5682, 'error', 'exception.CHttpException.404', 1478904322, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5683, 'error', 'exception.CHttpException.404', 1478904323, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5684, 'error', 'exception.CHttpException.404', 1478904339, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5685, 'error', 'exception.CHttpException.404', 1478904340, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5686, 'error', 'exception.CHttpException.404', 1478904340, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5687, 'error', 'exception.CHttpException.404', 1478904385, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5688, 'error', 'exception.CHttpException.404', 1478904386, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5689, 'error', 'exception.CHttpException.404', 1478904416, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5690, 'error', 'exception.CHttpException.404', 1478904417, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5691, 'error', 'exception.CHttpException.404', 1478904470, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=https://b22a8e83.ngrok.io/u/root/home\n---'),
(5692, 'error', 'exception.CHttpException.404', 1478904471, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=https://b22a8e83.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5693, 'error', 'exception.CHttpException.404', 1478904872, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5694, 'error', 'exception.CHttpException.404', 1478904883, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://bb11e3e1.ngrok.io/u/root/home\n---'),
(5695, 'error', 'exception.CHttpException.404', 1478904884, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5696, 'error', 'exception.CHttpException.404', 1478904887, 'exception ''CHttpException'' with message ''Unable to resolve the request "poni".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''poni'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/poni\n---'),
(5697, 'error', 'exception.CHttpException.404', 1478904888, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://bb11e3e1.ngrok.io/u/root/poni\n---'),
(5698, 'error', 'php', 1478904928, 'Undefined offset: 2 (/opt/lampp/htdocs/protected/modules_core/user/components/UserUrlRule.php:71)\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): WebApplication->processRequest()\n#1 /opt/lampp/htdocs/index.php(22): WebApplication->run()\nREQUEST_URI=/u/poni\nin /opt/lampp/htdocs/protected/modules_core/user/components/UserUrlRule.php (71)\nin /opt/lampp/htdocs/index.php (22)'),
(5699, 'error', 'exception.CHttpException.404', 1478904935, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/poni/img/PAGE_LOGO2.png\nHTTP_REFERER=http://bb11e3e1.ngrok.io/u/poni/home\n---'),
(5700, 'error', 'exception.CHttpException.404', 1478904936, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/poni/img/PAGE_LOGO2.png\nHTTP_REFERER=http://bb11e3e1.ngrok.io/u/poni/home\n---'),
(5701, 'error', 'exception.CHttpException.404', 1478904936, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5702, 'error', 'exception.CHttpException.404', 1478904940, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/poni/img/PAGE_LOGO2.png\nHTTP_REFERER=http://bb11e3e1.ngrok.io/u/poni/home\n---'),
(5703, 'error', 'exception.CHttpException.404', 1478904940, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5704, 'error', 'exception.CHttpException.404', 1478904946, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5705, 'error', 'exception.CHttpException.404', 1478905385, 'exception ''CHttpException'' with message ''Unable to resolve the request "undefined".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''undefined'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/undefined\nHTTP_REFERER=http://bb11e3e1.ngrok.io/dashboard\n---'),
(5706, 'error', 'exception.CHttpException.500', 1478905395, 'exception ''CHttpException'' with message ''Invalid target class given'' in /opt/lampp/htdocs/protected/modules_core/comment/controllers/CommentController.php:73\nStack trace:\n#0 /opt/lampp/htdocs/protected/modules_core/comment/controllers/CommentController.php(139): CommentController->loadTargetModel()\n#1 /opt/lampp/htdocs/protected/vendors/yii/web/actions/CInlineAction.php(49): CommentController->actionPost()\n#2 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(308): CInlineAction->runWithParams(Array)\n#3 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(133): CController->runAction(Object(CInlineAction))\n#4 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilter.php(40): CFilterChain->run()\n#5 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(1145): CFilter->filter(Object(CFilterChain))\n#6 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CInlineFilter.php(58): CController->filterAccessControl(Object(CFilterChain))\n#7 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(130): CInlineFilter->filter(Object(CFilterChain))\n#8 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(291): CFilterChain->run()\n#9 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(265): CController->runActionWithFilters(Object(CInlineAction), Array)\n#10 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''post'')\n#11 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''comment/comment...'')\n#12 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#13 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#14 {main}\nREQUEST_URI=/comment/comment/post\nHTTP_REFERER=http://bb11e3e1.ngrok.io/dashboard\n---'),
(5707, 'error', 'exception.CHttpException.404', 1478905427, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5708, 'error', 'exception.CHttpException.404', 1478905445, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5709, 'error', 'exception.CHttpException.404', 1478905454, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5710, 'error', 'exception.CHttpException.404', 1478905652, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://bb11e3e1.ngrok.io/u/root/home\n---'),
(5711, 'error', 'exception.CHttpException.404', 1478905653, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO2.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO2....'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO2.png\nHTTP_REFERER=http://bb11e3e1.ngrok.io/u/root/home\n---'),
(5712, 'error', 'exception.CHttpException.404', 1478905654, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5713, 'error', 'exception.CHttpException.404', 1478905683, 'exception ''CHttpException'' with message ''Unable to resolve the request "img/PAGE_LOGO.png".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''img/PAGE_LOGO.p...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/u/root/img/PAGE_LOGO.png\nHTTP_REFERER=http://bb11e3e1.ngrok.io/u/root/home\n---'),
(5714, 'error', 'exception.CHttpException.404', 1478905755, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5715, 'error', 'exception.CHttpException.404', 1478905783, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5716, 'error', 'exception.CHttpException.404', 1478905816, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5717, 'error', 'exception.CHttpException.404', 1478905828, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5718, 'error', 'system.db.CDbCommand', 1478905964, 'CDbCommand::fetchAll() failed: SQLSTATE[42S22]: Column not found: 1054 Unknown column ''userprofile.name'' in ''where clause''. The SQL statement executed was: SELECT `t`.`id` AS `t0_c0`, `t`.`guid` AS `t0_c1`, `t`.`wall_id` AS `t0_c2`, `t`.`group_id` AS `t0_c3`, `t`.`status` AS `t0_c4`, `t`.`super_admin` AS `t0_c5`, `t`.`username` AS `t0_c6`, `t`.`email` AS `t0_c7`, `t`.`auth_mode` AS `t0_c8`, `t`.`tags` AS `t0_c9`, `t`.`language` AS `t0_c10`, `t`.`last_activity_email` AS `t0_c11`, `t`.`created_at` AS `t0_c12`, `t`.`created_by` AS `t0_c13`, `t`.`updated_at` AS `t0_c14`, `t`.`updated_by` AS `t0_c15`, `t`.`last_login` AS `t0_c16`, `t`.`verified` AS `t0_c17`, `userProfile`.`user_id` AS `t1_c0`, `userProfile`.`name` AS `t1_c1`, `userProfile`.`title` AS `t1_c2`, `userProfile`.`gender` AS `t1_c3`, `userProfile`.`street` AS `t1_c4`, `userProfile`.`zip` AS `t1_c5`, `userProfile`.`city` AS `t1_c6`, `userProfile`.`country` AS `t1_c7`, `userProfile`.`state` AS `t1_c8`, `userProfile`.`birthday_hide_year` AS `t1_c9`, `userProfile`.`birthday` AS `t1_c10`, `userProfile`.`about` AS `t1_c11`, `userProfile`.`phone_private` AS `t1_c12`, `userProfile`.`phone_work` AS `t1_c13`, `userProfile`.`mobile` AS `t1_c14`, `userProfile`.`fax` AS `t1_c15`, `userProfile`.`im_skype` AS `t1_c16`, `userProfile`.`im_msn` AS `t1_c17`, `userProfile`.`im_icq` AS `t1_c18`, `userProfile`.`im_xmpp` AS `t1_c19`, `userProfile`.`url` AS `t1_c20`, `userProfile`.`url_facebook` AS `t1_c21`, `userProfile`.`url_linkedin` AS `t1_c22`, `userProfile`.`url_xing` AS `t1_c23`, `userProfile`.`url_youtube` AS `t1_c24`, `userProfile`.`url_vimeo` AS `t1_c25`, `userProfile`.`url_flickr` AS `t1_c26`, `userProfile`.`url_myspace` AS `t1_c27`, `userProfile`.`url_googleplus` AS `t1_c28`, `userProfile`.`url_twitter` AS `t1_c29`, `userProfile`.`soundcloudlink` AS `t1_c30`, `userProfile`.`twitterlink` AS `t1_c31`, `userProfile`.`verified` AS `t1_c32`, `userProfile`.`isnsfw` AS `t1_c33`, `userProfile`.`developer` AS `t1_c34`, `userProfile`.`inception` AS `t1_c35`, `userProfile`.`fireworks` AS `t1_c36`, `userProfile`.`flashyname` AS `t1_c37`, `userProfile`.`rickroll` AS `t1_c38`, `userProfile`.`kombat` AS `t1_c39` FROM `user` `t`  LEFT OUTER JOIN `profile` `userProfile` ON (`userProfile`.`user_id`=`t`.`id`)  WHERE ((status=''1'' OR status=''0'') AND (1 AND (t.email LIKE :match1 OR t.username LIKE :match1 OR userprofile.name LIKE :match1 OR userProfile.lastname LIKE :match1 OR userProfile.title LIKE :match1))) LIMIT 10. Bound with :match1=''%pon%''.\nin /opt/lampp/htdocs/protected/modules_core/user/controllers/SearchController.php (92)\nin /opt/lampp/htdocs/index.php (22)');
INSERT INTO `logging` (`id`, `level`, `category`, `logtime`, `message`) VALUES
(5719, 'error', 'exception.CDbException', 1478905964, 'exception ''CDbException'' with message ''CDbCommand failed to execute the SQL statement: SQLSTATE[42S22]: Column not found: 1054 Unknown column ''userprofile.name'' in ''where clause''. The SQL statement executed was: SELECT `t`.`id` AS `t0_c0`, `t`.`guid` AS `t0_c1`, `t`.`wall_id` AS `t0_c2`, `t`.`group_id` AS `t0_c3`, `t`.`status` AS `t0_c4`, `t`.`super_admin` AS `t0_c5`, `t`.`username` AS `t0_c6`, `t`.`email` AS `t0_c7`, `t`.`auth_mode` AS `t0_c8`, `t`.`tags` AS `t0_c9`, `t`.`language` AS `t0_c10`, `t`.`last_activity_email` AS `t0_c11`, `t`.`created_at` AS `t0_c12`, `t`.`created_by` AS `t0_c13`, `t`.`updated_at` AS `t0_c14`, `t`.`updated_by` AS `t0_c15`, `t`.`last_login` AS `t0_c16`, `t`.`verified` AS `t0_c17`, `userProfile`.`user_id` AS `t1_c0`, `userProfile`.`name` AS `t1_c1`, `userProfile`.`title` AS `t1_c2`, `userProfile`.`gender` AS `t1_c3`, `userProfile`.`street` AS `t1_c4`, `userProfile`.`zip` AS `t1_c5`, `userProfile`.`city` AS `t1_c6`, `userProfile`.`country` AS `t1_c7`, `userProfile`.`state` AS `t1_c8`, `userProfile`.`birthday_hide_year` AS `t1_c9`, `userProfile`.`birthday` AS `t1_c10`, `userProfile`.`about` AS `t1_c11`, `userProfile`.`phone_private` AS `t1_c12`, `userProfile`.`phone_work` AS `t1_c13`, `userProfile`.`mobile` AS `t1_c14`, `userProfile`.`fax` AS `t1_c15`, `userProfile`.`im_skype` AS `t1_c16`, `userProfile`.`im_msn` AS `t1_c17`, `userProfile`.`im_icq` AS `t1_c18`, `userProfile`.`im_xmpp` AS `t1_c19`, `userProfile`.`url` AS `t1_c20`, `userProfile`.`url_facebook` AS `t1_c21`, `userProfile`.`url_linkedin` AS `t1_c22`, `userProfile`.`url_xing` AS `t1_c23`, `userProfile`.`url_youtube` AS `t1_c24`, `userProfile`.`url_vimeo` AS `t1_c25`, `userProfile`.`url_flickr` AS `t1_c26`, `userProfile`.`url_myspace` AS `t1_c27`, `userProfile`.`url_googleplus` AS `t1_c28`, `userProfile`.`url_twitter` AS `t1_c29`, `userProfile`.`soundcloudlink` AS `t1_c30`, `userProfile`.`twitterlink` AS `t1_c31`, `userProfile`.`verified` AS `t1_c32`, `userProfile`.`isnsfw` AS `t1_c33`, `userProfile`.`developer` AS `t1_c34`, `userProfile`.`inception` AS `t1_c35`, `userProfile`.`fireworks` AS `t1_c36`, `userProfile`.`flashyname` AS `t1_c37`, `userProfile`.`rickroll` AS `t1_c38`, `userProfile`.`kombat` AS `t1_c39` FROM `user` `t`  LEFT OUTER JOIN `profile` `userProfile` ON (`userProfile`.`user_id`=`t`.`id`)  WHERE ((status=''1'' OR status=''0'') AND (1 AND (t.email LIKE :match1 OR t.username LIKE :match1 OR userprofile.name LIKE :match1 OR userProfile.lastname LIKE :match1 OR userProfile.title LIKE :match1))) LIMIT 10. Bound with :match1=''%pon%'''' in /opt/lampp/htdocs/protected/vendors/yii/db/CDbCommand.php:543\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/db/CDbCommand.php(396): CDbCommand->queryInternal(''fetchAll'', Array, Array)\n#1 /opt/lampp/htdocs/protected/vendors/yii/db/ar/CActiveFinder.php(803): CDbCommand->queryAll()\n#2 /opt/lampp/htdocs/protected/vendors/yii/db/ar/CActiveFinder.php(437): CJoinElement->runQuery(Object(CJoinQuery))\n#3 /opt/lampp/htdocs/protected/vendors/yii/db/ar/CActiveFinder.php(68): CJoinElement->find(Object(CDbCriteria))\n#4 /opt/lampp/htdocs/protected/vendors/yii/db/ar/CActiveRecord.php(1356): CActiveFinder->query(Object(CDbCriteria), true)\n#5 /opt/lampp/htdocs/protected/vendors/yii/db/ar/CActiveRecord.php(1470): CActiveRecord->query(Object(CDbCriteria), true)\n#6 /opt/lampp/htdocs/protected/modules_core/user/controllers/SearchController.php(92): CActiveRecord->findAll(Object(CDbCriteria))\n#7 /opt/lampp/htdocs/protected/vendors/yii/web/actions/CInlineAction.php(49): SearchController->actionJson()\n#8 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(308): CInlineAction->runWithParams(Array)\n#9 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(133): CController->runAction(Object(CInlineAction))\n#10 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilter.php(40): CFilterChain->run()\n#11 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(1145): CFilter->filter(Object(CFilterChain))\n#12 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CInlineFilter.php(58): CController->filterAccessControl(Object(CFilterChain))\n#13 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(130): CInlineFilter->filter(Object(CFilterChain))\n#14 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(291): CFilterChain->run()\n#15 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(265): CController->runActionWithFilters(Object(CInlineAction), Array)\n#16 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''json'')\n#17 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/search/jso...'')\n#18 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#19 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#20 {main}\nREQUEST_URI=/user/search/json/keyword/pon?CSRF_TOKEN=663d15381c8c986c9ad15d33c9f7decf9695400e&_=1478905964706\nHTTP_REFERER=http://bb11e3e1.ngrok.io/dashboard\n---'),
(5720, 'error', 'system.db.CDbCommand', 1478905965, 'CDbCommand::fetchAll() failed: SQLSTATE[42S22]: Column not found: 1054 Unknown column ''userprofile.name'' in ''where clause''. The SQL statement executed was: SELECT `t`.`id` AS `t0_c0`, `t`.`guid` AS `t0_c1`, `t`.`wall_id` AS `t0_c2`, `t`.`group_id` AS `t0_c3`, `t`.`status` AS `t0_c4`, `t`.`super_admin` AS `t0_c5`, `t`.`username` AS `t0_c6`, `t`.`email` AS `t0_c7`, `t`.`auth_mode` AS `t0_c8`, `t`.`tags` AS `t0_c9`, `t`.`language` AS `t0_c10`, `t`.`last_activity_email` AS `t0_c11`, `t`.`created_at` AS `t0_c12`, `t`.`created_by` AS `t0_c13`, `t`.`updated_at` AS `t0_c14`, `t`.`updated_by` AS `t0_c15`, `t`.`last_login` AS `t0_c16`, `t`.`verified` AS `t0_c17`, `userProfile`.`user_id` AS `t1_c0`, `userProfile`.`name` AS `t1_c1`, `userProfile`.`title` AS `t1_c2`, `userProfile`.`gender` AS `t1_c3`, `userProfile`.`street` AS `t1_c4`, `userProfile`.`zip` AS `t1_c5`, `userProfile`.`city` AS `t1_c6`, `userProfile`.`country` AS `t1_c7`, `userProfile`.`state` AS `t1_c8`, `userProfile`.`birthday_hide_year` AS `t1_c9`, `userProfile`.`birthday` AS `t1_c10`, `userProfile`.`about` AS `t1_c11`, `userProfile`.`phone_private` AS `t1_c12`, `userProfile`.`phone_work` AS `t1_c13`, `userProfile`.`mobile` AS `t1_c14`, `userProfile`.`fax` AS `t1_c15`, `userProfile`.`im_skype` AS `t1_c16`, `userProfile`.`im_msn` AS `t1_c17`, `userProfile`.`im_icq` AS `t1_c18`, `userProfile`.`im_xmpp` AS `t1_c19`, `userProfile`.`url` AS `t1_c20`, `userProfile`.`url_facebook` AS `t1_c21`, `userProfile`.`url_linkedin` AS `t1_c22`, `userProfile`.`url_xing` AS `t1_c23`, `userProfile`.`url_youtube` AS `t1_c24`, `userProfile`.`url_vimeo` AS `t1_c25`, `userProfile`.`url_flickr` AS `t1_c26`, `userProfile`.`url_myspace` AS `t1_c27`, `userProfile`.`url_googleplus` AS `t1_c28`, `userProfile`.`url_twitter` AS `t1_c29`, `userProfile`.`soundcloudlink` AS `t1_c30`, `userProfile`.`twitterlink` AS `t1_c31`, `userProfile`.`verified` AS `t1_c32`, `userProfile`.`isnsfw` AS `t1_c33`, `userProfile`.`developer` AS `t1_c34`, `userProfile`.`inception` AS `t1_c35`, `userProfile`.`fireworks` AS `t1_c36`, `userProfile`.`flashyname` AS `t1_c37`, `userProfile`.`rickroll` AS `t1_c38`, `userProfile`.`kombat` AS `t1_c39` FROM `user` `t`  LEFT OUTER JOIN `profile` `userProfile` ON (`userProfile`.`user_id`=`t`.`id`)  WHERE ((status=''1'' OR status=''0'') AND (1 AND (t.email LIKE :match1 OR t.username LIKE :match1 OR userprofile.name LIKE :match1 OR userProfile.lastname LIKE :match1 OR userProfile.title LIKE :match1))) LIMIT 10. Bound with :match1=''%poni%''.\nin /opt/lampp/htdocs/protected/modules_core/user/controllers/SearchController.php (92)\nin /opt/lampp/htdocs/index.php (22)'),
(5721, 'error', 'exception.CDbException', 1478905965, 'exception ''CDbException'' with message ''CDbCommand failed to execute the SQL statement: SQLSTATE[42S22]: Column not found: 1054 Unknown column ''userprofile.name'' in ''where clause''. The SQL statement executed was: SELECT `t`.`id` AS `t0_c0`, `t`.`guid` AS `t0_c1`, `t`.`wall_id` AS `t0_c2`, `t`.`group_id` AS `t0_c3`, `t`.`status` AS `t0_c4`, `t`.`super_admin` AS `t0_c5`, `t`.`username` AS `t0_c6`, `t`.`email` AS `t0_c7`, `t`.`auth_mode` AS `t0_c8`, `t`.`tags` AS `t0_c9`, `t`.`language` AS `t0_c10`, `t`.`last_activity_email` AS `t0_c11`, `t`.`created_at` AS `t0_c12`, `t`.`created_by` AS `t0_c13`, `t`.`updated_at` AS `t0_c14`, `t`.`updated_by` AS `t0_c15`, `t`.`last_login` AS `t0_c16`, `t`.`verified` AS `t0_c17`, `userProfile`.`user_id` AS `t1_c0`, `userProfile`.`name` AS `t1_c1`, `userProfile`.`title` AS `t1_c2`, `userProfile`.`gender` AS `t1_c3`, `userProfile`.`street` AS `t1_c4`, `userProfile`.`zip` AS `t1_c5`, `userProfile`.`city` AS `t1_c6`, `userProfile`.`country` AS `t1_c7`, `userProfile`.`state` AS `t1_c8`, `userProfile`.`birthday_hide_year` AS `t1_c9`, `userProfile`.`birthday` AS `t1_c10`, `userProfile`.`about` AS `t1_c11`, `userProfile`.`phone_private` AS `t1_c12`, `userProfile`.`phone_work` AS `t1_c13`, `userProfile`.`mobile` AS `t1_c14`, `userProfile`.`fax` AS `t1_c15`, `userProfile`.`im_skype` AS `t1_c16`, `userProfile`.`im_msn` AS `t1_c17`, `userProfile`.`im_icq` AS `t1_c18`, `userProfile`.`im_xmpp` AS `t1_c19`, `userProfile`.`url` AS `t1_c20`, `userProfile`.`url_facebook` AS `t1_c21`, `userProfile`.`url_linkedin` AS `t1_c22`, `userProfile`.`url_xing` AS `t1_c23`, `userProfile`.`url_youtube` AS `t1_c24`, `userProfile`.`url_vimeo` AS `t1_c25`, `userProfile`.`url_flickr` AS `t1_c26`, `userProfile`.`url_myspace` AS `t1_c27`, `userProfile`.`url_googleplus` AS `t1_c28`, `userProfile`.`url_twitter` AS `t1_c29`, `userProfile`.`soundcloudlink` AS `t1_c30`, `userProfile`.`twitterlink` AS `t1_c31`, `userProfile`.`verified` AS `t1_c32`, `userProfile`.`isnsfw` AS `t1_c33`, `userProfile`.`developer` AS `t1_c34`, `userProfile`.`inception` AS `t1_c35`, `userProfile`.`fireworks` AS `t1_c36`, `userProfile`.`flashyname` AS `t1_c37`, `userProfile`.`rickroll` AS `t1_c38`, `userProfile`.`kombat` AS `t1_c39` FROM `user` `t`  LEFT OUTER JOIN `profile` `userProfile` ON (`userProfile`.`user_id`=`t`.`id`)  WHERE ((status=''1'' OR status=''0'') AND (1 AND (t.email LIKE :match1 OR t.username LIKE :match1 OR userprofile.name LIKE :match1 OR userProfile.lastname LIKE :match1 OR userProfile.title LIKE :match1))) LIMIT 10. Bound with :match1=''%poni%'''' in /opt/lampp/htdocs/protected/vendors/yii/db/CDbCommand.php:543\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/db/CDbCommand.php(396): CDbCommand->queryInternal(''fetchAll'', Array, Array)\n#1 /opt/lampp/htdocs/protected/vendors/yii/db/ar/CActiveFinder.php(803): CDbCommand->queryAll()\n#2 /opt/lampp/htdocs/protected/vendors/yii/db/ar/CActiveFinder.php(437): CJoinElement->runQuery(Object(CJoinQuery))\n#3 /opt/lampp/htdocs/protected/vendors/yii/db/ar/CActiveFinder.php(68): CJoinElement->find(Object(CDbCriteria))\n#4 /opt/lampp/htdocs/protected/vendors/yii/db/ar/CActiveRecord.php(1356): CActiveFinder->query(Object(CDbCriteria), true)\n#5 /opt/lampp/htdocs/protected/vendors/yii/db/ar/CActiveRecord.php(1470): CActiveRecord->query(Object(CDbCriteria), true)\n#6 /opt/lampp/htdocs/protected/modules_core/user/controllers/SearchController.php(92): CActiveRecord->findAll(Object(CDbCriteria))\n#7 /opt/lampp/htdocs/protected/vendors/yii/web/actions/CInlineAction.php(49): SearchController->actionJson()\n#8 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(308): CInlineAction->runWithParams(Array)\n#9 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(133): CController->runAction(Object(CInlineAction))\n#10 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilter.php(40): CFilterChain->run()\n#11 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(1145): CFilter->filter(Object(CFilterChain))\n#12 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CInlineFilter.php(58): CController->filterAccessControl(Object(CFilterChain))\n#13 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(130): CInlineFilter->filter(Object(CFilterChain))\n#14 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(291): CFilterChain->run()\n#15 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(265): CController->runActionWithFilters(Object(CInlineAction), Array)\n#16 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''json'')\n#17 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/search/jso...'')\n#18 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#19 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#20 {main}\nREQUEST_URI=/user/search/json/keyword/poni?CSRF_TOKEN=663d15381c8c986c9ad15d33c9f7decf9695400e&_=1478905964913\nHTTP_REFERER=http://bb11e3e1.ngrok.io/dashboard\n---'),
(5722, 'error', 'system.db.CDbCommand', 1478905967, 'CDbCommand::fetchAll() failed: SQLSTATE[42S22]: Column not found: 1054 Unknown column ''userprofile.name'' in ''where clause''. The SQL statement executed was: SELECT `t`.`id` AS `t0_c0`, `t`.`guid` AS `t0_c1`, `t`.`wall_id` AS `t0_c2`, `t`.`group_id` AS `t0_c3`, `t`.`status` AS `t0_c4`, `t`.`super_admin` AS `t0_c5`, `t`.`username` AS `t0_c6`, `t`.`email` AS `t0_c7`, `t`.`auth_mode` AS `t0_c8`, `t`.`tags` AS `t0_c9`, `t`.`language` AS `t0_c10`, `t`.`last_activity_email` AS `t0_c11`, `t`.`created_at` AS `t0_c12`, `t`.`created_by` AS `t0_c13`, `t`.`updated_at` AS `t0_c14`, `t`.`updated_by` AS `t0_c15`, `t`.`last_login` AS `t0_c16`, `t`.`verified` AS `t0_c17`, `userProfile`.`user_id` AS `t1_c0`, `userProfile`.`name` AS `t1_c1`, `userProfile`.`title` AS `t1_c2`, `userProfile`.`gender` AS `t1_c3`, `userProfile`.`street` AS `t1_c4`, `userProfile`.`zip` AS `t1_c5`, `userProfile`.`city` AS `t1_c6`, `userProfile`.`country` AS `t1_c7`, `userProfile`.`state` AS `t1_c8`, `userProfile`.`birthday_hide_year` AS `t1_c9`, `userProfile`.`birthday` AS `t1_c10`, `userProfile`.`about` AS `t1_c11`, `userProfile`.`phone_private` AS `t1_c12`, `userProfile`.`phone_work` AS `t1_c13`, `userProfile`.`mobile` AS `t1_c14`, `userProfile`.`fax` AS `t1_c15`, `userProfile`.`im_skype` AS `t1_c16`, `userProfile`.`im_msn` AS `t1_c17`, `userProfile`.`im_icq` AS `t1_c18`, `userProfile`.`im_xmpp` AS `t1_c19`, `userProfile`.`url` AS `t1_c20`, `userProfile`.`url_facebook` AS `t1_c21`, `userProfile`.`url_linkedin` AS `t1_c22`, `userProfile`.`url_xing` AS `t1_c23`, `userProfile`.`url_youtube` AS `t1_c24`, `userProfile`.`url_vimeo` AS `t1_c25`, `userProfile`.`url_flickr` AS `t1_c26`, `userProfile`.`url_myspace` AS `t1_c27`, `userProfile`.`url_googleplus` AS `t1_c28`, `userProfile`.`url_twitter` AS `t1_c29`, `userProfile`.`soundcloudlink` AS `t1_c30`, `userProfile`.`twitterlink` AS `t1_c31`, `userProfile`.`verified` AS `t1_c32`, `userProfile`.`isnsfw` AS `t1_c33`, `userProfile`.`developer` AS `t1_c34`, `userProfile`.`inception` AS `t1_c35`, `userProfile`.`fireworks` AS `t1_c36`, `userProfile`.`flashyname` AS `t1_c37`, `userProfile`.`rickroll` AS `t1_c38`, `userProfile`.`kombat` AS `t1_c39` FROM `user` `t`  LEFT OUTER JOIN `profile` `userProfile` ON (`userProfile`.`user_id`=`t`.`id`)  WHERE ((status=''1'' OR status=''0'') AND (1 AND (t.email LIKE :match1 OR t.username LIKE :match1 OR userprofile.name LIKE :match1 OR userProfile.lastname LIKE :match1 OR userProfile.title LIKE :match1))) LIMIT 10. Bound with :match1=''%pon%''.\nin /opt/lampp/htdocs/protected/modules_core/user/controllers/SearchController.php (92)\nin /opt/lampp/htdocs/index.php (22)'),
(5723, 'error', 'exception.CDbException', 1478905967, 'exception ''CDbException'' with message ''CDbCommand failed to execute the SQL statement: SQLSTATE[42S22]: Column not found: 1054 Unknown column ''userprofile.name'' in ''where clause''. The SQL statement executed was: SELECT `t`.`id` AS `t0_c0`, `t`.`guid` AS `t0_c1`, `t`.`wall_id` AS `t0_c2`, `t`.`group_id` AS `t0_c3`, `t`.`status` AS `t0_c4`, `t`.`super_admin` AS `t0_c5`, `t`.`username` AS `t0_c6`, `t`.`email` AS `t0_c7`, `t`.`auth_mode` AS `t0_c8`, `t`.`tags` AS `t0_c9`, `t`.`language` AS `t0_c10`, `t`.`last_activity_email` AS `t0_c11`, `t`.`created_at` AS `t0_c12`, `t`.`created_by` AS `t0_c13`, `t`.`updated_at` AS `t0_c14`, `t`.`updated_by` AS `t0_c15`, `t`.`last_login` AS `t0_c16`, `t`.`verified` AS `t0_c17`, `userProfile`.`user_id` AS `t1_c0`, `userProfile`.`name` AS `t1_c1`, `userProfile`.`title` AS `t1_c2`, `userProfile`.`gender` AS `t1_c3`, `userProfile`.`street` AS `t1_c4`, `userProfile`.`zip` AS `t1_c5`, `userProfile`.`city` AS `t1_c6`, `userProfile`.`country` AS `t1_c7`, `userProfile`.`state` AS `t1_c8`, `userProfile`.`birthday_hide_year` AS `t1_c9`, `userProfile`.`birthday` AS `t1_c10`, `userProfile`.`about` AS `t1_c11`, `userProfile`.`phone_private` AS `t1_c12`, `userProfile`.`phone_work` AS `t1_c13`, `userProfile`.`mobile` AS `t1_c14`, `userProfile`.`fax` AS `t1_c15`, `userProfile`.`im_skype` AS `t1_c16`, `userProfile`.`im_msn` AS `t1_c17`, `userProfile`.`im_icq` AS `t1_c18`, `userProfile`.`im_xmpp` AS `t1_c19`, `userProfile`.`url` AS `t1_c20`, `userProfile`.`url_facebook` AS `t1_c21`, `userProfile`.`url_linkedin` AS `t1_c22`, `userProfile`.`url_xing` AS `t1_c23`, `userProfile`.`url_youtube` AS `t1_c24`, `userProfile`.`url_vimeo` AS `t1_c25`, `userProfile`.`url_flickr` AS `t1_c26`, `userProfile`.`url_myspace` AS `t1_c27`, `userProfile`.`url_googleplus` AS `t1_c28`, `userProfile`.`url_twitter` AS `t1_c29`, `userProfile`.`soundcloudlink` AS `t1_c30`, `userProfile`.`twitterlink` AS `t1_c31`, `userProfile`.`verified` AS `t1_c32`, `userProfile`.`isnsfw` AS `t1_c33`, `userProfile`.`developer` AS `t1_c34`, `userProfile`.`inception` AS `t1_c35`, `userProfile`.`fireworks` AS `t1_c36`, `userProfile`.`flashyname` AS `t1_c37`, `userProfile`.`rickroll` AS `t1_c38`, `userProfile`.`kombat` AS `t1_c39` FROM `user` `t`  LEFT OUTER JOIN `profile` `userProfile` ON (`userProfile`.`user_id`=`t`.`id`)  WHERE ((status=''1'' OR status=''0'') AND (1 AND (t.email LIKE :match1 OR t.username LIKE :match1 OR userprofile.name LIKE :match1 OR userProfile.lastname LIKE :match1 OR userProfile.title LIKE :match1))) LIMIT 10. Bound with :match1=''%pon%'''' in /opt/lampp/htdocs/protected/vendors/yii/db/CDbCommand.php:543\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/db/CDbCommand.php(396): CDbCommand->queryInternal(''fetchAll'', Array, Array)\n#1 /opt/lampp/htdocs/protected/vendors/yii/db/ar/CActiveFinder.php(803): CDbCommand->queryAll()\n#2 /opt/lampp/htdocs/protected/vendors/yii/db/ar/CActiveFinder.php(437): CJoinElement->runQuery(Object(CJoinQuery))\n#3 /opt/lampp/htdocs/protected/vendors/yii/db/ar/CActiveFinder.php(68): CJoinElement->find(Object(CDbCriteria))\n#4 /opt/lampp/htdocs/protected/vendors/yii/db/ar/CActiveRecord.php(1356): CActiveFinder->query(Object(CDbCriteria), true)\n#5 /opt/lampp/htdocs/protected/vendors/yii/db/ar/CActiveRecord.php(1470): CActiveRecord->query(Object(CDbCriteria), true)\n#6 /opt/lampp/htdocs/protected/modules_core/user/controllers/SearchController.php(92): CActiveRecord->findAll(Object(CDbCriteria))\n#7 /opt/lampp/htdocs/protected/vendors/yii/web/actions/CInlineAction.php(49): SearchController->actionJson()\n#8 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(308): CInlineAction->runWithParams(Array)\n#9 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(133): CController->runAction(Object(CInlineAction))\n#10 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilter.php(40): CFilterChain->run()\n#11 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(1145): CFilter->filter(Object(CFilterChain))\n#12 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CInlineFilter.php(58): CController->filterAccessControl(Object(CFilterChain))\n#13 /opt/lampp/htdocs/protected/vendors/yii/web/filters/CFilterChain.php(130): CInlineFilter->filter(Object(CFilterChain))\n#14 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(291): CFilterChain->run()\n#15 /opt/lampp/htdocs/protected/vendors/yii/web/CController.php(265): CController->runActionWithFilters(Object(CInlineAction), Array)\n#16 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(282): CController->run(''json'')\n#17 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''user/search/jso...'')\n#18 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#19 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#20 {main}\nREQUEST_URI=/user/search/json/keyword/pon?CSRF_TOKEN=663d15381c8c986c9ad15d33c9f7decf9695400e&_=1478905967212\nHTTP_REFERER=http://bb11e3e1.ngrok.io/dashboard\n---'),
(5724, 'error', 'exception.CHttpException.404', 1478905984, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5725, 'error', 'exception.CHttpException.404', 1478906257, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5726, 'error', 'exception.CHttpException.404', 1478906287, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5727, 'error', 'exception.CHttpException.404', 1478906300, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5728, 'error', 'exception.CHttpException.404', 1478906396, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5729, 'error', 'exception.CHttpException.404', 1478906507, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5730, 'error', 'exception.CHttpException.404', 1478906544, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5731, 'error', 'exception.CHttpException.404', 1478906560, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5732, 'error', 'exception.CHttpException.404', 1478906586, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5733, 'error', 'exception.CHttpException.404', 1478906621, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5734, 'error', 'exception.CHttpException.404', 1478906629, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5735, 'error', 'exception.CHttpException.404', 1478906646, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5736, 'error', 'exception.CHttpException.404', 1478906670, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5737, 'error', 'exception.CHttpException.404', 1478906801, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5738, 'error', 'exception.CHttpException.404', 1478907053, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---'),
(5739, 'error', 'exception.CHttpException.404', 1478907090, 'exception ''CHttpException'' with message ''Unable to resolve the request "themes/Metro/img/loader_body.gif".'' in /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php:286\nStack trace:\n#0 /opt/lampp/htdocs/protected/vendors/yii/web/CWebApplication.php(141): CWebApplication->runController(''themes/Metro/im...'')\n#1 /opt/lampp/htdocs/protected/vendors/yii/base/CApplication.php(180): CWebApplication->processRequest()\n#2 /opt/lampp/htdocs/index.php(22): CApplication->run()\n#3 {main}\nREQUEST_URI=/themes/Metro/img/loader_body.gif\nHTTP_REFERER=http://bb11e3e1.ngrok.io/themes/Metro/css/theme.css?ver=0.10.1\n---');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `message_entry`
--

CREATE TABLE `message_entry` (
  `id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  `module` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`, `module`) VALUES
('m000000_000000_base_activity', 1425338933, 'activity'),
('m000000_000000_base_admin', 1425338954, 'admin'),
('m000000_000000_base_comment', 1425338933, 'comment'),
('m000000_000000_base_core', 1425338927, 'core'),
('m000000_000000_base_custom_pages', 1425424505, 'custom_pages'),
('m000000_000000_base_file', 1425338932, 'file'),
('m000000_000000_base_like', 1425338932, 'like'),
('m000000_000000_base_mail', 1425423673, 'mail'),
('m000000_000000_base_notification', 1425338931, 'notification'),
('m000000_000000_base_post', 1425338930, 'post'),
('m000000_000000_base_reportcontent', 1425412709, 'reportcontent'),
('m000000_000000_base_space', 1425338917, 'space'),
('m000000_000000_base_tasks', 1425423645, 'tasks'),
('m000000_000000_base_user', 1425338908, 'user'),
('m000000_000000_base_wall', 1425338921, 'wall'),
('m000000_000000_base_wiki', 1430659714, 'wiki'),
('m131023_164513_initial', 1425338917, 'user'),
('m131023_165214_initial', 1425423646, 'tasks'),
('m131023_165411_initial', 1425338920, 'space'),
('m131023_165507_initial', 1425423677, 'mail'),
('m131023_165625_initial', 1425338927, 'wall'),
('m131023_165755_initial', 1425338930, 'core'),
('m131023_165835_initial', 1425338931, 'post'),
('m131023_170033_initial', 1425338932, 'notification'),
('m131023_170135_initial', 1425338932, 'like'),
('m131023_170159_initial', 1425338933, 'file'),
('m131023_170253_initial', 1425338933, 'comment'),
('m131023_170339_initial', 1425338934, 'activity'),
('m131203_110444_oembed', 1425338934, 'core'),
('m131213_165552_user_optimize', 1425338941, 'user'),
('m140226_111945_ldap', 1425338943, 'core'),
('m140303_125031_password', 1425338946, 'user'),
('m140304_142711_memberautoadd', 1425338947, 'space'),
('m140321_000917_content', 1425338949, 'core'),
('m140324_170617_membership', 1425338949, 'space'),
('m140507_150421_create_settings_table', 1425338951, 'user'),
('m140507_171527_create_settings_table', 1425338951, 'space'),
('m140512_141414_i18n_profilefields', 1425338953, 'user'),
('m140513_180317_createlogging', 1425338955, 'admin'),
('m140701_000611_profile_genderfield', 1425338955, 'user'),
('m140701_074404_protect_default_profilefields', 1425338956, 'user'),
('m140702_143912_notify_notification_unify', 1425338956, 'wall'),
('m140703_104527_profile_birthdayfield', 1425338956, 'user'),
('m140704_080659_installationid', 1425338956, 'admin'),
('m140705_065525_emailing_settings', 1425338959, 'user'),
('m140706_135210_lastlogin', 1425338960, 'user'),
('m140812_093445_rename_deadline_column', 1425423646, 'tasks'),
('m140829_122906_delete', 1425338963, 'user'),
('m140830_145504_following', 1425338965, 'core'),
('m140901_080147_indizies', 1425338966, 'like'),
('m140901_080432_indices', 1425338966, 'file'),
('m140901_112246_addState', 1425338971, 'space'),
('m140901_153403_addState', 1425338975, 'user'),
('m140901_170329_group_create_space', 1425338977, 'user'),
('m140902_091234_session_key_length', 1425338979, 'user'),
('m140907_140822_zip_field_to_text', 1425338979, 'user'),
('m140930_045035_initial', 1425424506, 'custom_pages'),
('m140930_205511_fix_default', 1425338982, 'activity'),
('m140930_205859_fix_default', 1425338983, 'like'),
('m140930_210142_fix_default', 1425338985, 'file'),
('m140930_210635_fix_default', 1425338990, 'user'),
('m140930_212528_fix_default', 1425338993, 'notification'),
('m141002_084750_fix_default', 1425423646, 'tasks'),
('m141002_092800_fix_deadline', 1425423646, 'tasks'),
('m141004_022835_initial', 1430659716, 'wiki'),
('m141015_173305_follow_notifications', 1425338994, 'core'),
('m141019_093319_mentioning', 1425338997, 'user'),
('m141020_162639_fix_default', 1425339004, 'core'),
('m141020_193920_rm_alsocreated', 1425339005, 'comment'),
('m141020_193931_rm_alsoliked', 1425339005, 'like'),
('m141021_162639_oembed_setting', 1425339006, 'core'),
('m141022_094635_addDefaults', 1425339006, 'space'),
('m141026_135537_adminOnly', 1425424507, 'custom_pages'),
('m141031_140056_cleanup_profiles', 1425339007, 'user'),
('m141220_192625_initial', 1425412709, 'reportcontent');

-- --------------------------------------------------------

--
-- Table structure for table `module_enabled`
--

CREATE TABLE `module_enabled` (
  `module_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module_enabled`
--

INSERT INTO `module_enabled` (`module_id`) VALUES
('breakingnews'),
('mail'),
('tasks');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `class` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `source_object_model` varchar(100) DEFAULT NULL,
  `source_object_id` int(11) DEFAULT NULL,
  `target_object_model` varchar(100) DEFAULT NULL,
  `target_object_id` int(11) DEFAULT NULL,
  `space_id` int(11) DEFAULT NULL,
  `emailed` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `class`, `user_id`, `seen`, `source_object_model`, `source_object_id`, `target_object_model`, `target_object_id`, `space_id`, `emailed`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(125, 'FollowNotification', 18, 1, 'UserFollow', 187, 'User', 16, NULL, 0, '2015-04-26 20:55:16', 16, '2015-04-26 21:05:58', 18),
(126, 'FollowNotification', 16, 1, 'UserFollow', 188, 'User', 18, NULL, 0, '2015-04-26 21:08:41', 18, '2015-04-26 21:09:38', 16),
(129, 'SpaceInviteNotification', 16, 1, 'User', 18, 'Space', 3, 3, 0, '2015-04-26 21:11:56', 18, '2015-04-26 21:15:50', 16),
(131, 'FollowNotification', 16, 1, 'UserFollow', 192, 'User', 1, NULL, 0, '2015-04-26 21:36:54', 1, '2015-04-27 08:48:10', 16),
(132, 'FollowNotification', 18, 1, 'UserFollow', 193, 'User', 1, NULL, 0, '2015-04-26 21:36:56', 1, '2015-04-27 20:27:33', 18),
(133, 'FollowNotification', 1, 1, 'UserFollow', 194, 'User', 19, NULL, 0, '2015-04-27 11:10:12', 19, '2015-04-27 21:18:23', 1),
(135, 'NewLikeNotification', 18, 1, 'Like', 29, 'Post', 109, NULL, 0, '2015-04-27 20:47:22', 16, '2015-04-28 18:00:37', 18),
(136, 'NewLikeNotification', 18, 1, 'Like', 35, 'Post', 109, NULL, 0, '2015-04-27 21:11:01', 1, '2015-04-28 18:00:37', 18),
(137, 'NewLikeNotification', 16, 1, 'Like', 35, 'Post', 109, NULL, 0, '2015-04-27 21:11:01', 1, '2015-04-28 10:53:51', 16),
(138, 'NewLikeNotification', 16, 1, 'Like', 36, 'Post', 111, NULL, 0, '2015-04-27 21:11:03', 1, '2015-04-28 10:48:34', 16),
(140, 'FollowNotification', 19, 1, 'UserFollow', 200, 'User', 1, NULL, 0, '2015-04-27 21:20:02', 1, '2015-04-29 12:47:14', 19),
(141, 'NewLikeNotification', 16, 1, 'Like', 39, 'Post', 108, NULL, 0, '2015-04-27 21:23:15', 1, '2015-04-28 10:53:44', 16),
(142, 'NewCommentNotification', 1, 1, 'Comment', 27, 'Post', 111, NULL, 0, '2015-04-28 10:48:22', 16, '2015-04-28 11:14:28', 1),
(143, 'NewLikeNotification', 1, 1, 'Like', 40, 'Comment', 27, NULL, 0, '2015-04-28 12:52:40', 16, '2015-04-28 16:26:49', 1),
(144, 'NewLikeNotification', 16, 1, 'Like', 41, 'Post', 113, NULL, 0, '2015-04-28 16:27:51', 1, '2015-04-29 17:46:49', 16),
(145, 'NewLikeNotification', 1, 1, 'Like', 42, 'Post', 109, NULL, 0, '2015-04-28 18:00:24', 18, '2015-04-28 18:01:50', 1),
(146, 'NewLikeNotification', 16, 1, 'Like', 42, 'Post', 109, NULL, 0, '2015-04-28 18:00:24', 18, '2015-04-29 17:46:49', 16),
(147, 'FollowNotification', 1, 1, 'UserFollow', 204, 'User', 18, NULL, 0, '2015-04-28 20:04:37', 18, '2015-04-28 20:06:45', 1),
(148, 'FollowNotification', 21, 1, 'UserFollow', 205, 'User', 1, NULL, 0, '2015-04-29 16:40:51', 1, '2015-04-30 12:43:01', 21),
(149, 'NewCommentNotification', 18, 1, 'Comment', 28, 'Post', 109, NULL, 0, '2015-04-29 17:49:18', 16, '2015-04-29 21:00:55', 18),
(150, 'NewCommentNotification', 1, 1, 'Comment', 28, 'Post', 109, NULL, 0, '2015-04-29 17:49:18', 16, '2015-04-29 17:50:30', 1),
(151, 'NewLikeNotification', 1, 1, 'Like', 43, 'Post', 113, NULL, 0, '2015-04-29 17:50:07', 16, '2015-04-29 17:50:10', 1),
(152, 'NewLikeNotification', 18, 1, 'Like', 44, 'Comment', 28, NULL, 0, '2015-04-29 17:50:41', 1, '2015-04-29 21:01:14', 18),
(153, 'NewLikeNotification', 16, 1, 'Like', 44, 'Comment', 28, NULL, 0, '2015-04-29 17:50:41', 1, '2015-04-30 07:39:04', 16),
(154, 'NewLikeNotification', 16, 1, 'Like', 45, 'Comment', 28, NULL, 0, '2015-04-29 21:01:04', 18, '2015-04-30 07:38:00', 16),
(155, 'NewLikeNotification', 1, 1, 'Like', 45, 'Comment', 28, NULL, 0, '2015-04-29 21:01:04', 18, '2015-04-29 21:02:05', 1),
(156, 'NewLikeNotification', 1, 1, 'Like', 46, 'Post', 117, NULL, 0, '2015-04-30 07:40:54', 16, '2015-04-30 07:43:59', 1),
(157, 'NewCommentNotification', 1, 1, 'Comment', 29, 'Post', 117, NULL, 0, '2015-04-30 07:41:05', 16, '2015-04-30 07:43:58', 1),
(159, 'MentionedNotification', 16, 1, 'Comment', 31, 'Comment', 31, NULL, 0, '2015-04-30 07:45:35', 1, '2015-04-30 08:20:22', 16),
(160, 'MentionedNotification', 1, 1, 'Comment', 32, 'Comment', 32, NULL, 0, '2015-04-30 08:20:48', 16, '2015-04-30 12:49:27', 1),
(161, 'NewLikeNotification', 1, 1, 'Like', 47, 'Post', 117, NULL, 0, '2015-04-30 08:42:09', 19, '2015-04-30 12:49:28', 1),
(162, 'NewLikeNotification', 16, 1, 'Like', 47, 'Post', 117, NULL, 0, '2015-04-30 08:42:09', 19, '2015-04-30 08:43:51', 16),
(163, 'FollowNotification', 20, 1, 'UserFollow', 212, 'User', 19, NULL, 0, '2015-04-30 08:43:35', 19, '2015-04-30 11:16:06', 20),
(164, 'FollowNotification', 19, 1, 'UserFollow', 213, 'User', 20, NULL, 0, '2015-04-30 11:16:09', 20, '2015-04-30 12:48:43', 19),
(165, 'FollowNotification', 1, 1, 'UserFollow', 214, 'User', 20, NULL, 0, '2015-04-30 11:20:36', 20, '2015-04-30 12:48:22', 1),
(166, 'MentionedNotification', 1, 1, 'Post', 118, 'Post', 118, NULL, 0, '2015-04-30 12:02:36', 16, '2015-04-30 12:49:28', 1),
(167, 'MentionedNotification', 18, 1, 'Post', 118, 'Post', 118, NULL, 0, '2015-04-30 12:02:37', 16, '2015-04-30 16:06:54', 18),
(168, 'MentionedNotification', 19, 1, 'Post', 118, 'Post', 118, NULL, 0, '2015-04-30 12:02:37', 16, '2015-04-30 12:48:07', 19),
(169, 'NewLikeNotification', 1, 1, 'Like', 48, 'Post', 118, NULL, 0, '2015-04-30 12:03:09', 16, '2015-04-30 12:49:29', 1),
(170, 'NewLikeNotification', 18, 1, 'Like', 48, 'Post', 118, NULL, 0, '2015-04-30 12:03:09', 16, '2015-04-30 16:06:55', 18),
(171, 'NewLikeNotification', 19, 1, 'Like', 48, 'Post', 118, NULL, 0, '2015-04-30 12:03:09', 16, '2015-04-30 12:48:07', 19),
(172, 'NewCommentNotification', 16, 1, 'Comment', 34, 'Post', 118, NULL, 0, '2015-04-30 12:48:11', 1, '2015-04-30 12:53:56', 16),
(173, 'NewCommentNotification', 18, 1, 'Comment', 34, 'Post', 118, NULL, 0, '2015-04-30 12:48:11', 1, '2015-04-30 16:06:55', 18),
(174, 'NewCommentNotification', 19, 1, 'Comment', 34, 'Post', 118, NULL, 0, '2015-04-30 12:48:11', 1, '2015-04-30 12:48:30', 19),
(175, 'NewLikeNotification', 16, 1, 'Like', 49, 'Comment', 33, NULL, 0, '2015-04-30 12:48:15', 1, '2015-04-30 12:59:12', 16),
(176, 'NewLikeNotification', 16, 1, 'Like', 50, 'Post', 118, NULL, 0, '2015-04-30 12:48:23', 19, '2015-04-30 12:53:56', 16),
(177, 'NewLikeNotification', 1, 1, 'Like', 50, 'Post', 118, NULL, 0, '2015-04-30 12:48:24', 19, '2015-04-30 12:49:31', 1),
(178, 'NewLikeNotification', 18, 1, 'Like', 50, 'Post', 118, NULL, 0, '2015-04-30 12:48:24', 19, '2015-04-30 16:06:55', 18),
(179, 'NewLikeNotification', 16, 1, 'Like', 51, 'Post', 118, NULL, 0, '2015-04-30 12:49:46', 1, '2015-04-30 12:53:56', 16),
(180, 'NewLikeNotification', 18, 1, 'Like', 51, 'Post', 118, NULL, 0, '2015-04-30 12:49:46', 1, '2015-04-30 16:06:55', 18),
(181, 'NewLikeNotification', 19, 1, 'Like', 51, 'Post', 118, NULL, 0, '2015-04-30 12:49:46', 1, '2015-04-30 12:52:15', 19),
(182, 'NewCommentNotification', 1, 1, 'Comment', 35, 'Post', 118, NULL, 0, '2015-04-30 12:56:33', 16, '2015-04-30 16:42:47', 1),
(183, 'NewCommentNotification', 18, 1, 'Comment', 35, 'Post', 118, NULL, 0, '2015-04-30 12:56:33', 16, '2015-04-30 16:06:55', 18),
(184, 'NewCommentNotification', 19, 1, 'Comment', 35, 'Post', 118, NULL, 0, '2015-04-30 12:56:33', 16, '2015-05-13 12:40:15', 19),
(186, 'FollowNotification', 19, 1, 'UserFollow', 223, 'User', 21, NULL, 0, '2015-04-30 13:10:08', 21, '2015-05-13 12:40:15', 19),
(187, 'FollowNotification', 20, 1, 'UserFollow', 224, 'User', 21, NULL, 0, '2015-04-30 13:10:09', 21, '2015-04-30 13:11:04', 20),
(188, 'FollowNotification', 16, 1, 'UserFollow', 225, 'User', 21, NULL, 0, '2015-04-30 13:10:11', 21, '2015-04-30 13:27:08', 16),
(189, 'FollowNotification', 18, 1, 'UserFollow', 226, 'User', 21, NULL, 0, '2015-04-30 13:10:11', 21, '2015-04-30 16:07:32', 18),
(190, 'FollowNotification', 22, 0, 'UserFollow', 227, 'User', 21, NULL, 0, '2015-04-30 13:10:12', 21, '2015-04-30 13:10:12', 21),
(191, 'FollowNotification', 21, 1, 'UserFollow', 228, 'User', 20, NULL, 0, '2015-04-30 13:12:31', 20, '2015-04-30 13:20:23', 21),
(192, 'FollowNotification', 1, 1, 'UserFollow', 229, 'User', 21, NULL, 0, '2015-04-30 13:17:22', 21, '2015-04-30 16:42:47', 1),
(193, 'NewCommentNotification', 20, 1, 'Comment', 36, 'Post', 121, NULL, 0, '2015-04-30 13:27:45', 16, '2015-05-01 11:09:15', 20),
(194, 'MentionedNotification', 21, 1, 'Post', 122, 'Post', 122, NULL, 0, '2015-04-30 13:41:39', 16, '2015-05-05 12:55:08', 21),
(195, 'MentionedNotification', 1, 1, 'Post', 122, 'Post', 122, NULL, 0, '2015-04-30 13:41:40', 16, '2015-04-30 16:42:47', 1),
(196, 'NewLikeNotification', 19, 1, 'Like', 52, 'Post', 120, NULL, 0, '2015-04-30 17:38:48', 1, '2015-05-13 12:40:10', 19),
(197, 'NewCommentNotification', 19, 1, 'Comment', 37, 'Post', 120, NULL, 0, '2015-04-30 17:39:02', 1, '2015-05-13 12:40:10', 19),
(198, 'FollowNotification', 1, 1, 'UserFollow', 237, 'User', 24, NULL, 0, '2015-05-01 07:38:40', 24, '2015-05-16 11:24:03', 1),
(199, 'FollowNotification', 24, 1, 'UserFollow', 239, 'User', 1, NULL, 0, '2015-05-01 07:43:43', 1, '2015-05-05 20:33:40', 24),
(200, 'FollowNotification', 23, 0, 'UserFollow', 240, 'User', 1, NULL, 0, '2015-05-01 07:43:44', 1, '2015-05-01 07:43:44', 1),
(207, 'FollowNotification', 1, 1, 'UserFollow', 246, 'User', 25, NULL, 0, '2015-05-01 08:08:39', 25, '2015-05-01 08:39:43', 1),
(208, 'FollowNotification', 25, 1, 'UserFollow', 248, 'User', 1, NULL, 0, '2015-05-01 08:39:48', 1, '2015-05-01 08:40:06', 25),
(212, 'FollowNotification', 27, 0, 'UserFollow', 251, 'User', 1, NULL, 0, '2015-05-01 08:41:01', 1, '2015-05-01 08:41:01', 1),
(215, 'NewLikeNotification', 25, 1, 'Like', 56, 'Post', 127, NULL, 0, '2015-05-01 08:41:49', 1, '2015-05-01 08:43:17', 25),
(216, 'NewLikeNotification', 27, 0, 'Like', 57, 'Post', 126, 3, 0, '2015-05-01 08:41:56', 1, '2015-05-01 08:41:56', 1),
(217, 'NewCommentNotification', 27, 0, 'Comment', 40, 'Post', 126, 3, 0, '2015-05-01 08:42:06', 1, '2015-05-01 08:42:06', 1),
(218, 'FollowNotification', 18, 1, 'UserFollow', 256, 'User', 25, NULL, 0, '2015-05-01 08:51:35', 25, '2015-05-01 17:39:17', 18),
(219, 'FollowNotification', 16, 1, 'UserFollow', 257, 'User', 25, NULL, 0, '2015-05-01 08:51:56', 25, '2015-05-01 22:30:02', 16),
(220, 'MentionedNotification', 1, 1, 'Post', 128, 'Post', 128, NULL, 0, '2015-05-01 08:53:59', 25, '2015-05-01 11:08:51', 1),
(222, 'NewCommentNotification', 25, 1, 'Comment', 41, 'Post', 128, NULL, 0, '2015-05-01 11:08:40', 1, '2015-05-18 08:56:25', 25),
(224, 'FollowNotification', 27, 0, 'UserFollow', 260, 'User', 20, NULL, 0, '2015-05-01 11:11:51', 20, '2015-05-01 11:11:51', 20),
(225, 'MentionedNotification', 16, 1, 'Comment', 42, 'Comment', 42, NULL, 0, '2015-05-01 11:13:45', 20, '2015-05-01 22:29:25', 16),
(229, 'FollowNotification', 1, 1, 'UserFollow', 266, 'User', 28, NULL, 0, '2015-05-01 17:08:46', 28, '2015-05-01 17:38:13', 1),
(232, 'FollowNotification', 28, 1, 'UserFollow', 268, 'User', 1, NULL, 0, '2015-05-01 19:35:33', 1, '2015-05-03 21:17:39', 28),
(234, 'MentionedNotification', 20, 1, 'Comment', 44, 'Comment', 44, NULL, 0, '2015-05-01 22:29:54', 16, '2015-05-05 12:42:48', 20),
(235, 'FollowNotification', 25, 1, 'UserFollow', 270, 'User', 16, NULL, 0, '2015-05-01 22:30:51', 16, '2015-05-18 08:58:05', 25),
(236, 'MentionedNotification', 1, 1, 'Post', 133, 'Post', 133, NULL, 0, '2015-05-01 22:31:43', 16, '2015-05-01 22:33:08', 1),
(237, 'NewCommentNotification', 16, 1, 'Comment', 45, 'Post', 133, NULL, 0, '2015-05-01 22:33:24', 18, '2015-05-01 22:33:36', 16),
(238, 'NewCommentNotification', 1, 1, 'Comment', 45, 'Post', 133, NULL, 0, '2015-05-01 22:33:24', 18, '2015-05-01 22:35:22', 1),
(239, 'NewLikeNotification', 16, 1, 'Like', 61, 'Comment', 45, NULL, 0, '2015-05-01 22:33:28', 18, '2015-05-03 18:04:24', 16),
(240, 'NewLikeNotification', 1, 1, 'Like', 61, 'Comment', 45, NULL, 0, '2015-05-01 22:33:28', 18, '2015-05-01 22:35:22', 1),
(241, 'NewLikeNotification', 16, 1, 'Like', 62, 'Post', 133, NULL, 0, '2015-05-01 22:33:30', 18, '2015-05-01 22:33:36', 16),
(242, 'NewLikeNotification', 1, 1, 'Like', 62, 'Post', 133, NULL, 0, '2015-05-01 22:33:30', 18, '2015-05-01 22:35:22', 1),
(243, 'NewLikeNotification', 1, 1, 'Like', 63, 'Comment', 45, NULL, 0, '2015-05-01 22:33:42', 16, '2015-05-01 22:35:22', 1),
(244, 'NewLikeNotification', 18, 1, 'Like', 63, 'Comment', 45, NULL, 0, '2015-05-01 22:33:42', 16, '2015-05-01 22:34:54', 18),
(245, 'NewCommentNotification', 16, 1, 'Comment', 46, 'Post', 133, NULL, 0, '2015-05-01 23:01:56', 18, '2015-05-01 23:02:19', 16),
(246, 'NewCommentNotification', 1, 1, 'Comment', 46, 'Post', 133, NULL, 0, '2015-05-01 23:01:57', 18, '2015-05-01 23:05:08', 1),
(247, 'FollowNotification', 23, 0, 'UserFollow', 274, 'User', 16, NULL, 0, '2015-05-01 23:01:58', 16, '2015-05-01 23:01:58', 16),
(258, 'MentionedNotification', 25, 1, 'Comment', 47, 'Comment', 47, NULL, 0, '2015-05-02 08:40:36', 16, '2015-05-18 08:56:55', 25),
(259, 'MentionedNotification', 18, 1, 'Comment', 47, 'Comment', 47, NULL, 0, '2015-05-02 08:40:36', 16, '2015-05-02 13:26:54', 18),
(260, 'MentionedNotification', 1, 1, 'Comment', 47, 'Comment', 47, NULL, 0, '2015-05-02 08:40:36', 16, '2015-05-02 13:07:24', 1),
(261, 'MentionedNotification', 19, 1, 'Comment', 47, 'Comment', 47, NULL, 0, '2015-05-02 08:40:36', 16, '2015-05-13 12:40:05', 19),
(262, 'NewLikeNotification', 1, 1, 'Like', 68, 'Comment', 47, NULL, 0, '2015-05-02 08:40:44', 16, '2015-05-02 13:07:24', 1),
(263, 'NewLikeNotification', 18, 1, 'Like', 68, 'Comment', 47, NULL, 0, '2015-05-02 08:40:44', 16, '2015-05-02 13:26:54', 18),
(264, 'NewLikeNotification', 25, 1, 'Like', 68, 'Comment', 47, NULL, 0, '2015-05-02 08:40:44', 16, '2015-05-18 08:56:55', 25),
(265, 'NewLikeNotification', 19, 1, 'Like', 68, 'Comment', 47, NULL, 0, '2015-05-02 08:40:44', 16, '2015-05-13 12:40:05', 19),
(266, 'NewLikeNotification', 16, 1, 'Like', 75, 'Post', 117, NULL, 0, '2015-05-02 22:15:09', 1, '2015-05-03 13:14:17', 16),
(267, 'NewLikeNotification', 19, 1, 'Like', 75, 'Post', 117, NULL, 0, '2015-05-02 22:15:09', 1, '2015-05-13 12:39:59', 19),
(268, 'NewLikeNotification', 16, 1, 'Like', 76, 'Post', 141, NULL, 0, '2015-05-03 13:19:45', 1, '2015-05-03 18:04:15', 16),
(269, 'NewLikeNotification', 18, 1, 'Like', 78, 'Post', 142, NULL, 0, '2015-05-03 13:51:19', 1, '2015-05-03 15:34:35', 18),
(270, 'NewCommentNotification', 18, 1, 'Comment', 48, 'Post', 142, NULL, 0, '2015-05-03 13:51:33', 1, '2015-05-03 15:34:35', 18),
(271, 'MentionedNotification', 1, 1, 'Comment', 49, 'Comment', 49, NULL, 0, '2015-05-03 15:35:41', 18, '2015-05-03 15:37:02', 1),
(272, 'MentionedNotification', 1, 1, 'Post', 144, 'Post', 144, NULL, 0, '2015-05-03 15:47:02', 18, '2015-05-03 15:53:41', 1),
(273, 'NewCommentNotification', 18, 1, 'Comment', 50, 'Post', 144, NULL, 0, '2015-05-03 15:54:20', 1, '2015-05-04 22:43:44', 18),
(274, 'NewCommentNotification', 18, 1, 'Comment', 51, 'Post', 144, NULL, 0, '2015-05-03 15:54:43', 1, '2015-05-04 22:43:44', 18),
(275, 'NewCommentNotification', 1, 1, 'Comment', 52, 'Post', 140, NULL, 0, '2015-05-03 21:21:08', 28, '2015-05-03 23:57:44', 1),
(276, 'NewLikeNotification', 16, 1, 'Like', 79, 'Comment', 29, NULL, 0, '2015-05-04 11:45:58', 1, '2015-05-13 09:37:55', 16),
(277, 'NewLikeNotification', 19, 1, 'Like', 79, 'Comment', 29, NULL, 0, '2015-05-04 11:45:58', 1, '2015-05-13 12:39:54', 19),
(278, 'NewLikeNotification', 18, 1, 'Like', 79, 'Comment', 29, NULL, 0, '2015-05-04 11:45:58', 1, '2015-05-04 22:43:44', 18),
(279, 'MentionedNotification', 28, 1, 'Comment', 53, 'Comment', 53, NULL, 0, '2015-05-05 07:21:42', 16, '2015-05-16 08:11:32', 28),
(280, 'MentionedNotification', 1, 1, 'Post', 151, 'Post', 151, NULL, 0, '2015-05-05 07:23:00', 16, '2015-05-05 07:23:49', 1),
(281, 'NewCommentNotification', 16, 1, 'Comment', 54, 'Post', 151, NULL, 0, '2015-05-05 07:23:58', 1, '2015-05-05 13:02:28', 16),
(282, 'NewLikeNotification', 16, 1, 'Like', 81, 'Post', 151, NULL, 0, '2015-05-05 07:37:20', 1, '2015-05-05 13:02:28', 16),
(285, 'NewCommentNotification', 16, 1, 'Comment', 56, 'Post', 122, NULL, 0, '2015-05-05 13:01:45', 1, '2015-05-13 07:12:45', 16),
(286, 'NewCommentNotification', 21, 1, 'Comment', 56, 'Post', 122, NULL, 0, '2015-05-05 13:01:45', 1, '2015-05-05 13:20:23', 21),
(287, 'NewCommentNotification', 16, 1, 'Comment', 57, 'Post', 122, NULL, 0, '2015-05-05 13:21:28', 21, '2015-05-13 07:12:45', 16),
(288, 'NewCommentNotification', 1, 1, 'Comment', 57, 'Post', 122, NULL, 0, '2015-05-05 13:21:28', 21, '2015-05-05 16:25:34', 1),
(289, 'NewLikeNotification', 28, 1, 'Like', 83, 'Comment', 53, NULL, 0, '2015-05-05 23:17:03', 1, '2015-05-15 19:15:17', 28),
(290, 'NewLikeNotification', 16, 1, 'Like', 83, 'Comment', 53, NULL, 0, '2015-05-05 23:17:03', 1, '2015-05-13 07:13:32', 16),
(291, 'NewLikeNotification', 1, 1, 'Like', 85, 'Post', 152, NULL, 0, '2015-05-13 12:41:42', 19, '2015-05-13 17:45:07', 1),
(292, 'NewLikeNotification', 1, 1, 'Like', 86, 'Post', 143, NULL, 0, '2015-05-13 12:41:55', 19, '2015-05-13 17:45:07', 1),
(293, 'NewLikeNotification', 20, 1, 'Like', 87, 'Post', 131, NULL, 0, '2015-05-13 12:42:27', 19, '2015-05-14 11:14:09', 20),
(294, 'NewLikeNotification', 1, 1, 'Like', 88, 'Post', 135, NULL, 0, '2015-05-13 12:42:31', 19, '2015-05-13 17:45:07', 1),
(295, 'NewLikeNotification', 1, 1, 'Like', 89, 'Post', 138, NULL, 0, '2015-05-13 12:42:33', 19, '2015-05-13 17:45:07', 1),
(296, 'NewLikeNotification', 1, 1, 'Like', 90, 'Post', 139, NULL, 0, '2015-05-13 12:42:36', 19, '2015-05-13 17:45:07', 1),
(297, 'NewLikeNotification', 27, 0, 'Like', 91, 'Comment', 40, 3, 0, '2015-05-13 12:42:44', 19, '2015-05-13 12:42:44', 19),
(298, 'NewLikeNotification', 1, 1, 'Like', 91, 'Comment', 40, 3, 0, '2015-05-13 12:42:44', 19, '2015-05-13 17:45:07', 1),
(299, 'NewLikeNotification', 28, 1, 'Like', 91, 'Comment', 40, 3, 0, '2015-05-13 12:42:44', 19, '2015-05-15 19:15:06', 28),
(300, 'NewLikeNotification', 20, 1, 'Like', 92, 'Post', 121, NULL, 0, '2015-05-13 12:42:56', 19, '2015-05-14 11:14:10', 20),
(301, 'NewLikeNotification', 16, 1, 'Like', 92, 'Post', 121, NULL, 0, '2015-05-13 12:42:56', 19, '2015-05-13 17:44:41', 16),
(302, 'NewLikeNotification', 1, 1, 'Like', 93, 'Post', 124, NULL, 0, '2015-05-13 12:42:57', 19, '2015-05-13 17:45:08', 1),
(303, 'NewCommentNotification', 1, 1, 'Comment', 61, 'Post', 152, NULL, 0, '2015-05-13 16:35:47', 18, '2015-05-13 17:45:09', 1),
(304, 'NewCommentNotification', 19, 0, 'Comment', 61, 'Post', 152, NULL, 0, '2015-05-13 16:35:48', 18, '2015-05-13 16:35:48', 18),
(305, 'NewCommentNotification', 27, 0, 'Comment', 62, 'Post', 126, 3, 0, '2015-05-13 17:45:37', 18, '2015-05-13 17:45:37', 18),
(306, 'NewCommentNotification', 1, 1, 'Comment', 62, 'Post', 126, 3, 0, '2015-05-13 17:45:37', 18, '2015-05-13 17:50:59', 1),
(307, 'NewCommentNotification', 28, 1, 'Comment', 62, 'Post', 126, 3, 0, '2015-05-13 17:45:38', 18, '2015-05-15 19:15:04', 28),
(308, 'NewCommentNotification', 19, 0, 'Comment', 62, 'Post', 126, 3, 0, '2015-05-13 17:45:38', 18, '2015-05-13 17:45:38', 18),
(313, 'NewLikeNotification', 18, 1, 'Like', 94, 'Post', 153, NULL, 0, '2015-05-14 14:40:12', 1, '2015-05-14 18:40:22', 18),
(314, 'NewLikeNotification', 1, 1, 'Like', 95, 'Comment', 53, NULL, 0, '2015-05-15 19:16:00', 28, '2015-05-15 21:06:21', 1),
(315, 'NewLikeNotification', 16, 1, 'Like', 95, 'Comment', 53, NULL, 0, '2015-05-15 19:16:01', 28, '2015-05-16 16:10:23', 16),
(316, 'NewCommentNotification', 1, 1, 'Comment', 64, 'Post', 140, NULL, 0, '2015-05-15 19:16:04', 28, '2015-05-15 21:06:01', 1),
(317, 'NewCommentNotification', 16, 1, 'Comment', 64, 'Post', 140, NULL, 0, '2015-05-15 19:16:04', 28, '2015-05-16 18:03:53', 16),
(318, 'FollowNotification', 32, 0, 'UserFollow', 318, 'User', 33, NULL, 0, '2015-05-17 13:49:04', 33, '2015-05-17 13:49:04', 33),
(319, 'NewLikeNotification', 27, 0, 'Like', 96, 'Post', 126, 3, 0, '2015-05-17 13:49:33', 33, '2015-05-17 13:49:33', 33),
(320, 'NewLikeNotification', 1, 1, 'Like', 96, 'Post', 126, 3, 0, '2015-05-17 13:49:33', 33, '2015-05-17 13:50:13', 1),
(321, 'NewLikeNotification', 28, 0, 'Like', 96, 'Post', 126, 3, 0, '2015-05-17 13:49:33', 33, '2015-05-17 13:49:33', 33),
(322, 'NewLikeNotification', 19, 0, 'Like', 96, 'Post', 126, 3, 0, '2015-05-17 13:49:33', 33, '2015-05-17 13:49:33', 33),
(323, 'NewLikeNotification', 18, 1, 'Like', 96, 'Post', 126, 3, 0, '2015-05-17 13:49:33', 33, '2015-05-17 21:44:06', 18),
(324, 'NewLikeNotification', 33, 0, 'Like', 97, 'Post', 155, 12, 0, '2015-05-17 14:21:02', 1, '2015-05-17 14:21:02', 1),
(325, 'FollowNotification', 20, 1, 'UserFollow', 326, 'User', 1, NULL, 0, '2015-05-17 16:30:30', 1, '2015-05-18 12:50:36', 20),
(326, 'NewCommentNotification', 1, 1, 'Comment', 65, 'Post', 151, NULL, 0, '2015-05-17 16:49:15', 16, '2015-05-17 16:50:21', 1),
(327, 'NewLikeNotification', 16, 1, 'Like', 98, 'Comment', 65, NULL, 0, '2015-05-17 16:51:53', 1, '2015-05-17 17:32:07', 16),
(328, 'NewCommentNotification', 1, 1, 'Comment', 66, 'Post', 151, NULL, 0, '2015-05-18 15:35:46', 16, '2015-05-18 22:49:39', 1),
(329, 'NewCommentNotification', 1, 1, 'Comment', 67, 'Post', 151, NULL, 0, '2015-05-23 13:01:03', 16, '2015-05-23 13:03:12', 1),
(331, 'NewLikeNotification', 16, 0, 'Like', 100, 'Post', 160, NULL, 0, '2015-05-23 13:08:46', 1, '2015-05-23 13:08:46', 1),
(332, 'NewCommentNotification', 16, 0, 'Comment', 68, 'Post', 160, NULL, 0, '2015-05-23 13:08:58', 1, '2015-05-23 13:08:58', 1),
(333, 'NewLikeNotification', 1, 1, 'Like', 101, 'Comment', 68, NULL, 0, '2015-05-23 13:09:20', 16, '2015-05-23 17:27:02', 1),
(334, 'NewCommentNotification', 1, 1, 'Comment', 69, 'Post', 160, NULL, 0, '2015-05-23 13:09:53', 16, '2015-05-23 17:27:02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `message_2trash` text,
  `message` text,
  `url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `birthday_hide_year` int(1) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `about` text,
  `phone_private` varchar(255) DEFAULT NULL,
  `phone_work` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `im_skype` varchar(255) DEFAULT NULL,
  `im_msn` varchar(255) DEFAULT NULL,
  `im_icq` int(11) DEFAULT NULL,
  `im_xmpp` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `url_facebook` varchar(255) DEFAULT NULL,
  `url_linkedin` varchar(255) DEFAULT NULL,
  `url_xing` varchar(255) DEFAULT NULL,
  `url_youtube` varchar(255) DEFAULT NULL,
  `url_vimeo` varchar(255) DEFAULT NULL,
  `url_flickr` varchar(255) DEFAULT NULL,
  `url_myspace` varchar(255) DEFAULT NULL,
  `url_googleplus` varchar(255) DEFAULT NULL,
  `url_twitter` varchar(255) DEFAULT NULL,
  `soundcloudlink` varchar(255) DEFAULT NULL,
  `twitterlink` varchar(255) DEFAULT NULL,
  `verified` int(11) DEFAULT NULL,
  `isnsfw` varchar(255) DEFAULT NULL,
  `developer` int(11) DEFAULT NULL,
  `inception` int(11) DEFAULT NULL,
  `fireworks` int(11) DEFAULT NULL,
  `flashyname` int(11) DEFAULT NULL,
  `rickroll` int(11) DEFAULT NULL,
  `kombat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `title`, `gender`, `street`, `zip`, `city`, `country`, `state`, `birthday_hide_year`, `birthday`, `about`, `phone_private`, `phone_work`, `mobile`, `fax`, `im_skype`, `im_msn`, `im_icq`, `im_xmpp`, `url`, `url_facebook`, `url_linkedin`, `url_xing`, `url_youtube`, `url_vimeo`, `url_flickr`, `url_myspace`, `url_googleplus`, `url_twitter`, `soundcloudlink`, `twitterlink`, `verified`, `isnsfw`, `developer`, `inception`, `fireworks`, `flashyname`, `rickroll`, `kombat`) VALUES
(35, 'Test Account', 'None', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'no', 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `profile_field`
--

CREATE TABLE `profile_field` (
  `id` int(11) NOT NULL,
  `profile_field_category_id` int(11) NOT NULL,
  `module_id` varchar(255) DEFAULT NULL,
  `field_type_class` varchar(255) NOT NULL,
  `field_type_config` text,
  `internal_name` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `sort_order` int(11) NOT NULL DEFAULT '100',
  `required` tinyint(4) DEFAULT NULL,
  `show_at_registration` tinyint(4) DEFAULT NULL,
  `editable` tinyint(4) NOT NULL DEFAULT '1',
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_attribute` varchar(255) DEFAULT NULL,
  `translation_category` varchar(255) DEFAULT NULL,
  `is_system` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile_field`
--

INSERT INTO `profile_field` (`id`, `profile_field_category_id`, `module_id`, `field_type_class`, `field_type_config`, `internal_name`, `title`, `description`, `sort_order`, `required`, `show_at_registration`, `editable`, `visible`, `created_at`, `created_by`, `updated_at`, `updated_by`, `ldap_attribute`, `translation_category`, `is_system`) VALUES
(1, 1, NULL, 'ProfileFieldTypeText', '{"minLength":"","maxLength":"20","validator":"","default":"","regexp":"","regexpErrorMessage":""}', 'name', 'Name', '', 0, 1, 1, 1, 1, '2015-03-02 23:30:19', NULL, '2016-11-06 07:24:33', 34, 'givenName', 'UserModule.models_Profile', 1),
(3, 1, NULL, 'ProfileFieldTypeText', '{"minLength":"","maxLength":"50","validator":"","default":"","regexp":"","regexpErrorMessage":""}', 'title', 'Title', '', 4, 1, 1, 1, 1, '2015-03-02 23:30:21', NULL, '2015-04-30 18:07:22', 1, 'title', 'UserModule.models_Profile', 1),
(4, 1, NULL, 'ProfileFieldTypeSelect', '{"options":"male=>Male\\r\\nfemale=>Female\\r\\nother=>Other"}', 'gender', 'Gender', '', 5, 0, 0, 1, 1, '2015-03-02 23:30:21', NULL, '2015-05-04 14:59:33', 1, '', 'UserModule.models_Profile', 1),
(5, 1, NULL, 'ProfileFieldTypeText', '{"minLength":null,"maxLength":150,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null}', 'street', 'Street', NULL, 6, NULL, 0, 1, 1, '2015-03-02 23:30:22', NULL, '2015-04-30 18:07:22', 1, NULL, NULL, 1),
(6, 1, NULL, 'ProfileFieldTypeText', '{"minLength":null,"maxLength":10,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null}', 'zip', 'Zip', NULL, 7, NULL, 0, 1, 1, '2015-03-02 23:30:23', NULL, '2015-04-30 18:07:23', 1, NULL, NULL, 1),
(7, 1, NULL, 'ProfileFieldTypeText', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null}', 'city', 'City', NULL, 8, NULL, 0, 1, 1, '2015-03-02 23:30:24', NULL, '2015-04-30 18:07:23', 1, NULL, NULL, 1),
(8, 1, NULL, 'ProfileFieldTypeText', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null}', 'country', 'Country', NULL, 9, NULL, 0, 1, 1, '2015-03-02 23:30:24', NULL, '2015-04-30 18:07:23', 1, NULL, NULL, 1),
(9, 1, NULL, 'ProfileFieldTypeText', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null}', 'state', 'State', NULL, 10, NULL, 0, 1, 1, '2015-03-02 23:30:25', NULL, '2015-04-30 18:07:23', 1, NULL, NULL, 1),
(10, 1, NULL, 'ProfileFieldTypeBirthday', '{"showTimePicker":false}', 'birthday', 'Birthday', NULL, 11, NULL, 0, 1, 1, '2015-03-02 23:30:27', NULL, '2015-04-30 18:07:23', 1, NULL, NULL, 1),
(11, 1, NULL, 'ProfileFieldTypeTextArea', '[]', 'about', 'About', NULL, 12, NULL, 0, 1, 1, '2015-03-02 23:30:29', NULL, '2015-04-30 18:07:23', 1, NULL, NULL, 1),
(12, 2, NULL, 'ProfileFieldTypeText', '{"minLength":"","maxLength":"100","validator":"","default":"","regexp":"","regexpErrorMessage":""}', 'phone_private', 'Phone Private', '', 100, 0, 0, 1, 0, '2015-03-02 23:30:29', NULL, '2015-03-05 18:22:10', 1, '', 'UserModule.models_Profile', 1),
(13, 2, NULL, 'ProfileFieldTypeText', '{"minLength":"","maxLength":"100","validator":"","default":"","regexp":"","regexpErrorMessage":""}', 'phone_work', 'Phone Work', '', 200, 0, 0, 1, 0, '2015-03-02 23:30:31', NULL, '2015-03-05 18:22:17', 1, '', 'UserModule.models_Profile', 1),
(14, 2, NULL, 'ProfileFieldTypeText', '{"minLength":"","maxLength":"100","validator":"","default":"","regexp":"","regexpErrorMessage":""}', 'mobile', 'Mobile', '', 300, 0, 0, 1, 0, '2015-03-02 23:30:32', NULL, '2015-03-05 18:22:04', 1, '', 'UserModule.models_Profile', 1),
(15, 2, NULL, 'ProfileFieldTypeText', '{"minLength":"","maxLength":"100","validator":"","default":"","regexp":"","regexpErrorMessage":""}', 'fax', 'Fax', '', 400, 0, 0, 1, 0, '2015-03-02 23:30:33', NULL, '2015-03-05 18:20:25', 1, '', 'UserModule.models_Profile', 1),
(16, 2, NULL, 'ProfileFieldTypeText', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null}', 'im_skype', 'Skype Nickname', NULL, 500, NULL, 0, 1, 1, '2015-03-02 23:30:34', NULL, '2015-03-02 23:30:34', NULL, NULL, NULL, 1),
(17, 2, NULL, 'ProfileFieldTypeText', '{"minLength":"","maxLength":"100","validator":"","default":"","regexp":"","regexpErrorMessage":""}', 'im_msn', 'MSN', '', 600, 0, 0, 1, 0, '2015-03-02 23:30:34', NULL, '2015-03-05 18:17:54', 1, '', 'UserModule.models_Profile', 1),
(18, 2, NULL, 'ProfileFieldTypeNumber', '{"maxValue":"","minValue":""}', 'im_icq', 'ICQ Number', '', 700, 0, 0, 1, 0, '2015-03-02 23:30:35', NULL, '2015-03-05 18:17:47', 1, '', 'UserModule.models_Profile', 1),
(19, 2, NULL, 'ProfileFieldTypeText', '{"minLength":"","maxLength":"255","validator":"email","default":"","regexp":"","regexpErrorMessage":""}', 'im_xmpp', 'XMPP Jabber Address', '', 800, 0, 0, 1, 0, '2015-03-02 23:30:36', NULL, '2015-03-05 18:17:41', 1, '', 'UserModule.models_Profile', 1),
(20, 3, NULL, 'ProfileFieldTypeText', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null}', 'url', 'Url', NULL, 0, NULL, 0, 1, 1, '2015-03-02 23:30:37', NULL, '2015-04-28 23:36:56', 1, NULL, NULL, 1),
(21, 3, NULL, 'ProfileFieldTypeText', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null}', 'url_facebook', 'Facebook URL', NULL, 2, NULL, 0, 1, 1, '2015-03-02 23:30:38', NULL, '2015-04-28 23:36:57', 1, NULL, NULL, 1),
(22, 3, NULL, 'ProfileFieldTypeText', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null}', 'url_linkedin', 'LinkedIn URL', NULL, 3, NULL, 0, 1, 1, '2015-03-02 23:30:39', NULL, '2015-04-28 23:36:57', 1, NULL, NULL, 1),
(23, 3, NULL, 'ProfileFieldTypeText', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null}', 'url_xing', 'Xing URL', NULL, 4, NULL, 0, 1, 1, '2015-03-02 23:30:40', NULL, '2015-04-28 23:36:57', 1, NULL, NULL, 1),
(24, 3, NULL, 'ProfileFieldTypeText', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null}', 'url_youtube', 'Youtube URL', NULL, 6, NULL, 0, 1, 1, '2015-03-02 23:30:41', NULL, '2015-04-28 23:36:57', 1, NULL, NULL, 1),
(25, 3, NULL, 'ProfileFieldTypeText', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null}', 'url_vimeo', 'Vimeo URL', NULL, 7, NULL, 0, 1, 1, '2015-03-02 23:30:42', NULL, '2015-04-28 23:36:57', 1, NULL, NULL, 1),
(26, 3, NULL, 'ProfileFieldTypeText', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null}', 'url_flickr', 'Flickr URL', NULL, 8, NULL, 0, 1, 1, '2015-03-02 23:30:42', NULL, '2015-04-28 23:36:57', 1, NULL, NULL, 1),
(27, 3, NULL, 'ProfileFieldTypeText', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null}', 'url_myspace', 'MySpace URL', NULL, 9, NULL, 0, 1, 1, '2015-03-02 23:30:43', NULL, '2015-04-28 23:36:57', 1, NULL, NULL, 1),
(28, 3, NULL, 'ProfileFieldTypeText', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null}', 'url_googleplus', 'Google+ URL', NULL, 10, NULL, 0, 1, 1, '2015-03-02 23:30:44', NULL, '2015-04-28 23:36:57', 1, NULL, NULL, 1),
(29, 3, NULL, 'ProfileFieldTypeText', '{"minLength":"","maxLength":"255","validator":"url","default":"","regexp":"","regexpErrorMessage":""}', 'url_twitter', 'Twitter URL', '', 11, 0, 0, 1, 0, '2015-03-02 23:30:45', NULL, '2015-04-28 23:36:57', 1, '', 'UserModule.models_Profile', 1),
(31, 3, NULL, 'ProfileFieldTypeText', '{"minLength":"","maxLength":"255","validator":"","default":"","regexp":"","regexpErrorMessage":""}', 'soundcloudlink', 'Soundcloud URL', '', 1, 0, 0, 1, 1, '2015-03-05 18:21:14', 1, '2015-04-28 23:36:57', 1, '', 'UserModule.models_Profile', NULL),
(32, 3, NULL, 'ProfileFieldTypeText', '{"minLength":"","maxLength":"255","validator":"","default":"","regexp":"","regexpErrorMessage":""}', 'twitterlink', 'Twitter URL', '', 5, 0, 0, 1, 1, '2015-03-05 18:22:58', 1, '2015-04-28 23:36:57', 1, '', 'UserModule.models_Profile', NULL),
(33, 1, NULL, 'ProfileFieldTypeNumber', '{"maxValue":"1","minValue":"0"}', 'verified', 'Verified?', '', 1, 0, 0, 0, 1, '2015-03-05 19:33:01', 1, '2015-04-30 18:07:22', 1, '', 'UserModule.models_Profile', NULL),
(34, 1, NULL, 'ProfileFieldTypeSelect', '{"options":"yes=>Yes\\r\\nno=>No"}', 'isnsfw', 'Contains Mature Content', 'If your account contains any mature content (pornography, gore, etc.) check ''Yes''. If you are found with mature content on your account and this is set to ''No'', your account will be terminated.', 2, 1, 1, 1, 1, '2015-04-26 21:42:47', 16, '2015-05-04 14:59:47', 1, '', 'UserModule.models_Profile', NULL),
(35, 1, NULL, 'ProfileFieldTypeNumber', '{"maxValue":"1","minValue":"0"}', 'developer', 'Developer?', '', 13, 0, 0, 1, 0, '2015-04-28 08:38:45', 1, '2015-04-30 18:07:23', 1, '', 'UserModule.models_Profile', NULL),
(36, 1, NULL, 'ProfileFieldTypeNumber', '{"maxValue":"1","minValue":"0"}', 'inception', 'Inception', 'Does the user have the Inception sound button on their profile?', 14, 0, 0, 1, 0, '2015-04-28 23:15:00', 1, '2015-04-30 18:07:23', 1, '', 'UserModule.models_Profile', NULL),
(37, 1, NULL, 'ProfileFieldTypeNumber', '{"maxValue":"1","minValue":"0"}', 'fireworks', 'Fireworks', 'Does the user have a fireworks button on their profile?', 15, 0, 0, 1, 0, '2015-04-28 23:34:42', 1, '2015-04-30 18:07:23', 1, '', 'UserModule.models_Profile', NULL),
(38, 1, NULL, 'ProfileFieldTypeNumber', '{"maxValue":"1","minValue":"0"}', 'flashyname', 'Flashy name', 'Does the user have a flashy name?', 16, 0, 0, 1, 0, '2015-04-28 23:42:39', 1, '2015-04-30 18:07:23', 1, '', 'UserModule.models_Profile', NULL),
(39, 1, NULL, 'ProfileFieldTypeNumber', '{"maxValue":"1","minValue":"0"}', 'rickroll', 'Rickroll', 'Does the user have the Konami code rickroll element on their profile?', 17, 0, 0, 1, 0, '2015-04-29 20:53:32', 1, '2015-04-30 18:07:23', 1, '', 'UserModule.models_Profile', NULL),
(40, 1, NULL, 'ProfileFieldTypeNumber', '{"maxValue":"1","minValue":"0"}', 'kombat', 'Kombat', 'Does the user have the Mortal Kombat blood code listener on their page?', 18, 0, 0, 1, 0, '2015-04-29 21:06:19', 1, '2015-04-30 18:07:23', 1, '', 'UserModule.models_Profile', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profile_field_category`
--

CREATE TABLE `profile_field_category` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '100',
  `module_id` int(11) DEFAULT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `translation_category` varchar(255) DEFAULT NULL,
  `is_system` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile_field_category`
--

INSERT INTO `profile_field_category` (`id`, `title`, `description`, `sort_order`, `module_id`, `visibility`, `created_at`, `created_by`, `updated_at`, `updated_by`, `translation_category`, `is_system`) VALUES
(1, 'General', '', 100, NULL, 1, '2015-03-02 23:30:18', NULL, '2015-03-02 23:30:18', NULL, NULL, 1),
(2, 'Communication', '', 200, NULL, 1, '2015-03-02 23:30:18', NULL, '2015-03-05 18:18:01', 1, 'UserModule.models_ProfileFieldCategory', 1),
(3, 'Social bookmarks', '', 300, NULL, 1, '2015-03-02 23:30:18', NULL, '2015-03-02 23:30:18', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `report_content`
--

CREATE TABLE `report_content` (
  `id` int(11) NOT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `reason` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `value_text` text,
  `module_id` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `name`, `value`, `value_text`, `module_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'oembedProviders', NULL, '{"vimeo.com":"http:\\/\\/vimeo.com\\/api\\/oembed.json?scheme=https&url=%url%&format=json&maxwidth=450","youtube.com":"http:\\/\\/www.youtube.com\\/oembed?scheme=https&url=%url%&format=json&maxwidth=450","youtu.be":"http:\\/\\/www.youtube.com\\/oembed?scheme=https&url=%url%&format=json&maxwidth=450","soundcloud.com":"http:\\/\\/soundcloud.com\\/oembed?url=%url%&format=json","slideshare.net":"https:\\/\\/www.slideshare.net\\/api\\/oembed\\/2?url=%url%&format=json&maxwidth=450","instagram.com":"http:\\/\\/api.instagram.com\\/oembed?url=%url%&format=json","kickstarter.com\\/projects\\/*":"https:\\/\\/www.kickstarter.com\\/services\\/oembed?url=%url%","ted.com\\/talks\\/*":"http:\\/\\/ted.com\\/talks\\/oembed.xml?url=%url%","*.flickr.com\\/photos\\/*":"http:\\/\\/www.flickr.com\\/services\\/oembed?url=%url%","kickstarter.com\\/projects\\/":"https:\\/\\/www.kickstarter.com\\/services\\/oembed?url=%url%","*.deviantart.com\\/art\\/*":"http:\\/\\/backend.deviantart.com\\/oembed?format=xml&url=%url%","vine.co":"https:\\/\\/vine.co\\/oembed.json?url=%url%"}', NULL, NULL, 0, '2015-04-30 17:38:37', 1),
(2, 'defaultVisibility', '1', NULL, 'space', NULL, NULL, NULL, NULL),
(3, 'defaultJoinPolicy', '1', NULL, 'space', NULL, NULL, NULL, NULL),
(4, 'name', 'Profiler', NULL, NULL, '2015-03-02 23:30:15', 0, '2015-05-05 18:21:45', 18),
(5, 'baseUrl', 'http://profiler.cf', NULL, NULL, '2015-03-02 23:30:16', 0, '2015-05-05 18:21:47', 18),
(6, 'paginationSize', '10', NULL, NULL, '2015-03-02 23:30:16', 0, '2016-11-06 06:31:15', 34),
(7, 'displayNameFormat', '{name}', NULL, NULL, '2015-03-02 23:30:16', 0, '2016-11-06 06:31:15', 34),
(8, 'authInternal', '1', NULL, 'authentication', '2015-03-02 23:30:16', 0, '2015-03-02 23:30:16', 0),
(9, 'authLdap', '0', NULL, 'authentication', '2015-03-02 23:30:17', 0, '2015-03-02 23:30:17', 0),
(10, 'refreshUsers', '1', NULL, 'authentication_ldap', '2015-03-02 23:30:17', 0, '2015-03-02 23:30:17', 0),
(11, 'needApproval', '0', NULL, 'authentication_internal', '2015-03-02 23:30:17', 0, '2015-05-04 13:12:14', 1),
(12, 'anonymousRegistration', '0', NULL, 'authentication_internal', '2015-03-02 23:30:17', 0, '2015-05-04 13:12:16', 1),
(13, 'internalUsersCanInvite', '1', NULL, 'authentication_internal', '2015-03-02 23:30:17', 0, '2015-05-04 13:12:13', 1),
(14, 'transportType', 'smtp', NULL, 'mailing', '2015-03-02 23:30:17', 0, '2015-03-12 17:22:34', 1),
(15, 'systemEmailAddress', 'noreply@profiler.cf', NULL, 'mailing', '2015-03-02 23:30:17', 0, '2015-03-12 17:22:34', 1),
(16, 'systemEmailName', 'Profiler', NULL, 'mailing', '2015-03-02 23:30:17', 0, '2015-03-12 17:22:34', 1),
(17, 'receive_email_activities', '1', NULL, 'mailing', '2015-03-02 23:30:17', 0, '2015-03-02 23:30:17', 0),
(18, 'receive_email_notifications', '2', NULL, 'mailing', '2015-03-02 23:30:17', 0, '2015-03-02 23:30:17', 0),
(19, 'maxFileSize', '1048576', NULL, 'file', '2015-03-02 23:30:17', 0, '2015-04-30 07:27:23', 1),
(20, 'maxPreviewImageWidth', '200', NULL, 'file', '2015-03-02 23:30:17', 0, '2015-04-30 07:27:27', 1),
(21, 'maxPreviewImageHeight', '200', NULL, 'file', '2015-03-02 23:30:17', 0, '2015-04-30 07:27:30', 1),
(22, 'hideImageFileInfo', '0', NULL, 'file', '2015-03-02 23:30:17', 0, '2015-04-30 07:27:31', 1),
(23, 'type', 'CDummyCache', NULL, 'cache', '2015-03-02 23:30:17', 0, '2015-05-03 14:34:43', 1),
(24, 'expireTime', '3600', NULL, 'cache', '2015-03-02 23:30:17', 0, '2015-05-03 14:34:43', 1),
(25, 'installationId', 'ba6d6919013dbf8be11f92dc3b367ddd', NULL, 'admin', '2015-03-02 23:30:17', 0, '2015-03-02 23:30:17', 0),
(26, 'theme', 'Metro', NULL, NULL, '2015-03-02 23:30:17', 0, '2016-11-06 06:31:15', 34),
(27, 'spaceOrder', '0', NULL, 'space', '2015-03-02 23:30:18', 0, '2016-11-06 06:31:15', 34),
(28, 'enable', '1', NULL, 'tour', '2015-03-02 23:30:18', 0, '2015-05-05 18:21:48', 18),
(29, 'secret', '940cf21a-1b3d-41ac-b0b4-48ee7c223745', NULL, NULL, '2015-03-02 23:32:54', 0, '2015-03-02 23:32:54', 0),
(30, 'defaultLanguage', 'en_gb', NULL, NULL, '2015-03-03 22:55:00', 1, '2015-05-05 18:21:47', 18),
(32, 'title', 'Profiler', NULL, 'breakingnews', '2015-03-03 23:05:33', 1, '2015-05-03 13:36:12', 1),
(33, 'message', NULL, '#Testing welcome news panel\r\n\r\n###TESTING WELCOME NEWS PANEL', 'breakingnews', '2015-03-03 23:05:33', 1, '2015-05-03 13:36:12', 1),
(36, 'defaultUserIdleTimeoutSec', '1000', NULL, 'authentication_internal', '2015-03-03 23:16:42', 1, '2015-05-04 13:12:17', 1),
(37, 'hostname', 'host323.qnop.net', NULL, 'mailing', '2015-03-05 19:43:43', 3, '2015-03-12 17:22:34', 1),
(38, 'username', 'accounts@profiler.cf', NULL, 'mailing', '2015-03-05 19:43:43', 3, '2015-03-12 17:22:34', 1),
(39, 'password', 'fassdfg', NULL, 'mailing', '2015-03-05 19:43:43', 3, '2015-03-12 17:22:34', 1),
(40, 'port', '465', NULL, 'mailing', '2015-03-05 19:43:43', 3, '2015-03-12 17:22:34', 1),
(42, 'allowSelfSignedCerts', '1', NULL, 'mailing', '2015-03-05 19:43:43', 3, '2015-03-12 17:22:34', 1),
(43, 'encryption', 'ssl', NULL, 'mailing', '2015-03-09 09:57:37', 1, '2015-03-12 17:22:34', 1),
(44, 'defaultUserGroup', '1', NULL, 'authentication_internal', '2015-04-28 17:57:22', 1, '2015-05-04 13:12:17', 1),
(45, 'trackingHtmlCode', NULL, '<script>\r\n  (function(i,s,o,g,r,a,m){i[''GoogleAnalyticsObject'']=r;i[r]=i[r]||function(){\r\n  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\r\n  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\r\n  })(window,document,''script'',''//www.google-analytics.com/analytics.js'',''ga'');\r\n\r\n  ga(''create'', ''UA-62299406-1'', ''auto'');\r\n  ga(''send'', ''pageview'');\r\n\r\n</script>', NULL, '2015-04-29 22:37:34', 1, '2015-04-29 22:37:34', 1),
(46, 'imageMagickPath', '', NULL, 'file', '2015-04-30 07:27:22', 1, '2015-04-30 07:27:22', 1),
(47, 'useXSendfile', '0', NULL, 'file', '2015-04-30 07:27:32', 1, '2015-04-30 07:27:32', 1),
(48, 'allowedExtensions', '', NULL, 'file', '2015-04-30 07:27:32', 1, '2015-04-30 07:27:32', 1),
(49, 'showFilesWidgetBlacklist', '', NULL, 'file', '2015-04-30 07:27:33', 1, '2015-04-30 07:27:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `space`
--

CREATE TABLE `space` (
  `id` int(11) NOT NULL,
  `guid` varchar(45) DEFAULT NULL,
  `wall_id` int(11) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `description` text,
  `website` varchar(45) DEFAULT NULL,
  `join_policy` tinyint(4) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `tags` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_dn` varchar(255) DEFAULT NULL,
  `auto_add_new_members` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `space_membership`
--

CREATE TABLE `space_membership` (
  `space_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `originator_user_id` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `request_message` text,
  `last_visit` datetime DEFAULT NULL,
  `invite_role` tinyint(4) DEFAULT NULL,
  `admin_role` tinyint(4) DEFAULT NULL,
  `share_role` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `space_module`
--

CREATE TABLE `space_module` (
  `id` int(11) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `space_id` int(11) NOT NULL,
  `state` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `space_module`
--

INSERT INTO `space_module` (`id`, `module_id`, `space_id`, `state`) VALUES
(1, 'tasks', 3, 1),
(2, 'tasks', 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `space_setting`
--

CREATE TABLE `space_setting` (
  `id` int(11) NOT NULL,
  `space_id` int(10) DEFAULT NULL,
  `module_id` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `deadline` datetime DEFAULT NULL,
  `max_users` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `percent` smallint(6) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `task_user`
--

CREATE TABLE `task_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `url_oembed`
--

CREATE TABLE `url_oembed` (
  `url` varchar(255) NOT NULL,
  `preview` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `url_oembed`
--

INSERT INTO `url_oembed` (`url`, `preview`) VALUES
('https://www.youtube.com/watch?v=rQg2qngyIZM ', '<div class=''oembed_snippet''><iframe width="450" height="253" src="https://www.youtube.com/embed/rQg2qngyIZM?feature=oembed" frameborder="0" allowfullscreen></iframe></div>');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `guid` varchar(45) DEFAULT NULL,
  `wall_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `super_admin` tinyint(4) NOT NULL DEFAULT '0',
  `username` varchar(25) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `auth_mode` varchar(10) NOT NULL,
  `tags` text,
  `language` varchar(5) DEFAULT NULL,
  `last_activity_email` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `verified` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `guid`, `wall_id`, `group_id`, `status`, `super_admin`, `username`, `email`, `auth_mode`, `tags`, `language`, `last_activity_email`, `created_at`, `created_by`, `updated_at`, `updated_by`, `last_login`, `verified`) VALUES
(35, 'abcc4770-49a0-458f-a410-8dbe857fd995', 48, 1, 1, 1, 'root', 'root@example.com', 'local', NULL, NULL, '2016-11-06 07:37:05', '2016-11-06 07:37:05', 34, '2016-11-06 13:01:20', 35, '2016-11-11 23:54:28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_follow`
--

CREATE TABLE `user_follow` (
  `id` int(11) NOT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `send_notifications` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_http_session`
--

CREATE TABLE `user_http_session` (
  `id` char(255) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_http_session`
--

INSERT INTO `user_http_session` (`id`, `expire`, `user_id`, `data`) VALUES
('aeac3s4lca7eravqvorlc5aih7', 1478908563, 35, 0x37353733316565653538323366353766643933663535363865653663333039385f5f72657475726e55726c7c733a31303a222f64617368626f617264223b37353733316565653538323366353766643933663535363865653663333039385f5f69647c733a323a223335223b37353733316565653538323366353766643933663535363865653663333039385f5f6e616d657c733a343a22726f6f74223b37353733316565653538323366353766643933663535363865653663333039387469746c657c733a343a224e6f6e65223b37353733316565653538323366353766643933663535363865653663333039385f5f7374617465737c613a313a7b733a353a227469746c65223b623a313b7d37353733316565653538323366353766643933663535363865653663333039385f5f74696d656f75747c693a313437383930383038383b),
('hb8j4s1s5n9tecp2ap4fdoee41', 1478907861, NULL, ''),
('p4jhmt9btv8e9bgk7jmr45e4r4', 1478908526, NULL, 0x37353733316565653538323366353766643933663535363865653663333039385f5f72657475726e55726c7c733a31303a222f64617368626f617264223b),
('qv6e1rmut8fn9ko68ii5mp15b1', 1478907860, NULL, 0x37353733316565653538323366353766643933663535363865653663333039385f5f72657475726e55726c7c733a31303a222f64617368626f617264223b),
('r6j3atsafc27mqdfq8i1bv43d2', 1478908200, NULL, 0x37353733316565653538323366353766643933663535363865653663333039385f5f72657475726e55726c7c733a31303a222f64617368626f617264223b);

-- --------------------------------------------------------

--
-- Table structure for table `user_invite`
--

CREATE TABLE `user_invite` (
  `id` int(11) NOT NULL,
  `user_originator_id` int(11) DEFAULT NULL,
  `space_invite_id` int(11) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `source` varchar(45) DEFAULT NULL,
  `token` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_mentioning`
--

CREATE TABLE `user_mentioning` (
  `id` int(11) NOT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_mentioning`
--

INSERT INTO `user_mentioning` (`id`, `object_model`, `object_id`, `user_id`) VALUES
(1, 'Post', 2, 36),
(2, 'Post', 3, 36),
(3, 'Post', 4, 37),
(4, 'Post', 6, 35),
(5, 'Post', 6, 37);

-- --------------------------------------------------------

--
-- Table structure for table `user_message`
--

CREATE TABLE `user_message` (
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_originator` tinyint(4) DEFAULT NULL,
  `last_viewed` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_message`
--

INSERT INTO `user_message` (`message_id`, `user_id`, `is_originator`, `last_viewed`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(34, 1, NULL, '2015-05-13 17:45:25', '2015-04-29 13:18:23', 21, '2015-05-13 17:45:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_module`
--

CREATE TABLE `user_module` (
  `id` int(11) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `state` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_password`
--

CREATE TABLE `user_password` (
  `id` int(11) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `algorithm` varchar(20) DEFAULT NULL,
  `password` text,
  `salt` text,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_password`
--

INSERT INTO `user_password` (`id`, `user_id`, `algorithm`, `password`, `salt`, `created_at`) VALUES
(40, 35, 'sha512whirlpool', '5202f3025d05c0a7b97204d93ceb94b5786bcfc4fb524f8a39464961c8572be1855fbef6115d129a2a09eed58c150160b3608ee8ed03c370e5a7b190fca85fe0', 'c324f292-0620-47db-a595-6c61c2ba60bd', '2016-11-06 07:37:05');

-- --------------------------------------------------------

--
-- Table structure for table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` int(11) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `module_id` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `module_id`, `name`, `value`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 35, 'tour', 'interface', '1', '2016-11-11 22:36:08', 35, '2016-11-11 22:36:08', 35);

-- --------------------------------------------------------

--
-- Table structure for table `wall`
--

CREATE TABLE `wall` (
  `id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `object_model` varchar(50) NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wall`
--

INSERT INTO `wall` (`id`, `type`, `object_model`, `object_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'User', 'User', 1, '2015-03-02 23:32:55', NULL, '2015-03-02 23:32:55', NULL),
(3, 'Space', 'Space', 2, '2015-03-02 23:52:50', 1, '2015-03-02 23:52:50', 1),
(4, 'Space', 'Space', 3, '2015-03-03 20:04:30', 1, '2015-03-03 20:04:30', 1),
(5, 'User', 'User', 2, '2015-03-03 20:14:49', 1, '2015-03-03 20:14:49', 1),
(6, 'User', 'User', 3, '2015-03-04 18:34:21', 1, '2015-03-04 18:34:21', 1),
(7, 'User', 'User', 4, '2015-03-04 20:54:25', 1, '2015-03-04 20:54:25', 1),
(8, 'User', 'User', 5, '2015-03-04 21:24:41', 1, '2015-03-04 21:24:41', 1),
(10, 'User', 'User', 6, '2015-03-04 22:26:00', 1, '2015-03-04 22:26:00', 1),
(12, 'User', 'User', 7, '2015-03-05 18:02:44', 1, '2015-03-05 18:02:44', 1),
(13, 'User', 'User', 8, '2015-03-05 19:20:19', 3, '2015-03-05 19:20:19', 3),
(14, 'User', 'User', 9, '2015-03-05 19:22:29', 3, '2015-03-05 19:22:29', 3),
(15, 'User', 'User', 10, '2015-03-08 21:26:24', 4, '2015-03-08 21:26:24', 4),
(16, 'User', 'User', 11, '2015-03-10 11:17:52', 3, '2015-03-10 11:17:52', 3),
(17, 'User', 'User', 12, '2015-03-11 19:35:49', 4, '2015-03-11 19:35:49', 4),
(18, 'User', 'User', 13, '2015-03-12 12:40:13', 1, '2015-03-12 12:40:13', 1),
(20, 'User', 'User', 14, '2015-03-13 08:40:46', 1, '2015-03-13 08:40:46', 1),
(21, 'User', 'User', 15, '2015-03-18 13:43:53', 4, '2015-03-18 13:43:53', 4),
(22, 'User', 'User', 16, '2015-04-26 19:53:17', 3, '2015-04-26 19:53:17', 3),
(23, 'User', 'User', 17, '2015-04-26 19:59:45', 16, '2015-04-26 19:59:45', 16),
(24, 'User', 'User', 18, '2015-04-26 20:48:22', 17, '2015-04-26 20:48:22', 17),
(27, 'User', 'User', 19, '2015-04-27 08:40:43', 1, '2015-04-27 08:40:43', 1),
(28, 'Space', 'Space', 8, '2015-04-27 11:12:31', 19, '2015-04-27 11:12:31', 19),
(29, 'Space', 'Group', 9, '2015-04-29 12:48:28', 19, '2015-04-29 12:48:28', 19),
(30, 'User', 'User', 20, '2015-04-29 12:51:31', 1, '2015-04-29 12:51:31', 1),
(31, 'User', 'User', 21, '2015-04-29 13:17:00', NULL, '2015-04-29 13:17:00', NULL),
(32, 'User', 'User', 22, '2015-04-29 21:24:53', 1, '2015-04-29 21:24:53', 1),
(33, 'Space', 'Group', 10, '2015-04-30 20:21:33', 16, '2015-04-30 20:21:33', 16),
(34, 'User', 'User', 23, '2015-05-01 07:32:27', NULL, '2015-05-01 07:32:27', NULL),
(35, 'User', 'User', 24, '2015-05-01 07:37:34', NULL, '2015-05-01 07:37:34', NULL),
(36, 'User', 'User', 25, '2015-05-01 07:56:54', 1, '2015-05-01 07:56:54', 1),
(37, 'User', 'User', 26, '2015-05-01 07:58:18', 1, '2015-05-01 07:58:18', 1),
(38, 'User', 'User', 27, '2015-05-01 08:10:05', NULL, '2015-05-01 08:10:05', NULL),
(39, 'User', 'User', 28, '2015-05-01 16:50:22', NULL, '2015-05-01 16:50:22', NULL),
(40, 'User', 'User', 29, '2015-05-02 00:20:25', 1, '2015-05-02 00:20:25', 1),
(41, 'User', 'User', 30, '2015-05-03 00:56:36', NULL, '2015-05-03 00:56:36', NULL),
(42, 'User', 'User', 31, '2015-05-05 05:40:03', NULL, '2015-05-05 05:40:03', NULL),
(43, 'Space', 'Group', 11, '2015-05-05 05:52:29', 31, '2015-05-05 05:52:29', 31),
(44, 'User', 'User', 32, '2015-05-17 11:40:02', 1, '2015-05-17 11:40:02', 1),
(45, 'User', 'User', 33, '2015-05-17 13:45:54', 1, '2015-05-17 13:45:54', 1),
(46, 'Space', 'Group', 12, '2015-05-17 13:53:16', 33, '2015-05-17 13:53:16', 33),
(47, 'User', 'User', 34, '2016-11-06 06:14:37', 1, '2016-11-06 06:14:37', 1),
(48, 'User', 'User', 35, '2016-11-06 07:37:05', 34, '2016-11-06 07:37:05', 34),
(49, 'User', 'User', 36, '2016-11-11 22:27:56', 35, '2016-11-11 22:27:56', 35),
(50, 'User', 'User', 37, '2016-11-11 22:53:07', 35, '2016-11-11 22:53:07', 35);

-- --------------------------------------------------------

--
-- Table structure for table `wall_entry`
--

CREATE TABLE `wall_entry` (
  `id` int(11) NOT NULL,
  `wall_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_page`
--

CREATE TABLE `wiki_page` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `is_home` tinyint(4) NOT NULL DEFAULT '0',
  `admin_only` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_page_revision`
--

CREATE TABLE `wiki_page_revision` (
  `id` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  `is_latest` tinyint(1) NOT NULL DEFAULT '0',
  `wiki_page_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_object_model` (`object_model`,`object_id`),
  ADD UNIQUE KEY `index_guid` (`guid`),
  ADD KEY `index_space_id` (`space_id`),
  ADD KEY `index_user_id` (`user_id`);

--
-- Indexes for table `custom_pages_page`
--
ALTER TABLE `custom_pages_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_object` (`object_model`,`object_id`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_admin`
--
ALTER TABLE `group_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_admin` (`user_id`,`group_id`);

--
-- Indexes for table `like`
--
ALTER TABLE `like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_object` (`object_model`,`object_id`);

--
-- Indexes for table `logging`
--
ALTER TABLE `logging`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_entry`
--
ALTER TABLE `message_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `module_enabled`
--
ALTER TABLE `module_enabled`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `profile_field`
--
ALTER TABLE `profile_field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_profile_field_category` (`profile_field_category_id`);

--
-- Indexes for table `profile_field_category`
--
ALTER TABLE `profile_field_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_content`
--
ALTER TABLE `report_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `space`
--
ALTER TABLE `space`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `space_membership`
--
ALTER TABLE `space_membership`
  ADD PRIMARY KEY (`space_id`,`user_id`),
  ADD KEY `index_status` (`status`);

--
-- Indexes for table `space_module`
--
ALTER TABLE `space_module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `space_setting`
--
ALTER TABLE `space_setting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_space_setting` (`space_id`,`module_id`,`name`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_user`
--
ALTER TABLE `task_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `url_oembed`
--
ALTER TABLE `url_oembed`
  ADD PRIMARY KEY (`url`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD UNIQUE KEY `unique_username` (`username`),
  ADD UNIQUE KEY `unique_guid` (`guid`),
  ADD UNIQUE KEY `unique_wall_id` (`wall_id`);

--
-- Indexes for table `user_follow`
--
ALTER TABLE `user_follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_user` (`user_id`),
  ADD KEY `index_object` (`object_model`,`object_id`);

--
-- Indexes for table `user_http_session`
--
ALTER TABLE `user_http_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_invite`
--
ALTER TABLE `user_invite`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD UNIQUE KEY `unique_token` (`token`);

--
-- Indexes for table `user_mentioning`
--
ALTER TABLE `user_mentioning`
  ADD PRIMARY KEY (`id`),
  ADD KEY `i_user` (`user_id`),
  ADD KEY `i_object` (`object_model`,`object_id`);

--
-- Indexes for table `user_message`
--
ALTER TABLE `user_message`
  ADD PRIMARY KEY (`message_id`,`user_id`);

--
-- Indexes for table `user_module`
--
ALTER TABLE `user_module`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_user_module` (`user_id`,`module_id`);

--
-- Indexes for table `user_password`
--
ALTER TABLE `user_password`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_user_setting` (`user_id`,`module_id`,`name`);

--
-- Indexes for table `wall`
--
ALTER TABLE `wall`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wall_entry`
--
ALTER TABLE `wall_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wiki_page`
--
ALTER TABLE `wiki_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wiki_page_revision`
--
ALTER TABLE `wiki_page_revision`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `custom_pages_page`
--
ALTER TABLE `custom_pages_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `group_admin`
--
ALTER TABLE `group_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `like`
--
ALTER TABLE `like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `logging`
--
ALTER TABLE `logging`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5740;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `message_entry`
--
ALTER TABLE `message_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `profile_field`
--
ALTER TABLE `profile_field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `profile_field_category`
--
ALTER TABLE `profile_field_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `report_content`
--
ALTER TABLE `report_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `space`
--
ALTER TABLE `space`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `space_module`
--
ALTER TABLE `space_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `space_setting`
--
ALTER TABLE `space_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `task_user`
--
ALTER TABLE `task_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `user_follow`
--
ALTER TABLE `user_follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `user_invite`
--
ALTER TABLE `user_invite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_mentioning`
--
ALTER TABLE `user_mentioning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user_module`
--
ALTER TABLE `user_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_password`
--
ALTER TABLE `user_password`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `user_setting`
--
ALTER TABLE `user_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wall`
--
ALTER TABLE `wall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `wall_entry`
--
ALTER TABLE `wall_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `wiki_page`
--
ALTER TABLE `wiki_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wiki_page_revision`
--
ALTER TABLE `wiki_page_revision`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
