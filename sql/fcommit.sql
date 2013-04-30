CREATE DATABASE  IF NOT EXISTS `ticketqa` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ticketqa`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: ticketqa
-- ------------------------------------------------------
-- Server version	5.5.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ost_api_key`
--

DROP TABLE IF EXISTS `ost_api_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_api_key` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ipaddr` varchar(64) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `can_create_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_exec_cron` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `notes` text,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apikey` (`apikey`),
  KEY `ipaddr` (`ipaddr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_api_key`
--

LOCK TABLES `ost_api_key` WRITE;
/*!40000 ALTER TABLE `ost_api_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_api_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_canned_attachment`
--

DROP TABLE IF EXISTS `ost_canned_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_canned_attachment` (
  `canned_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`canned_id`,`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_canned_attachment`
--

LOCK TABLES `ost_canned_attachment` WRITE;
/*!40000 ALTER TABLE `ost_canned_attachment` DISABLE KEYS */;
INSERT INTO `ost_canned_attachment` VALUES (1,1);
/*!40000 ALTER TABLE `ost_canned_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_canned_response`
--

DROP TABLE IF EXISTS `ost_canned_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_canned_response` (
  `canned_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL DEFAULT '',
  `response` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`canned_id`),
  UNIQUE KEY `title` (`title`),
  KEY `dept_id` (`dept_id`),
  KEY `active` (`isenabled`),
  FULLTEXT KEY `resp` (`title`,`response`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_canned_response`
--

LOCK TABLES `ost_canned_response` WRITE;
/*!40000 ALTER TABLE `ost_canned_response` DISABLE KEYS */;
INSERT INTO `ost_canned_response` VALUES (1,0,1,'What is osTicket (sample)?','\r\nosTicket is a widely-used open source support ticket system, an attractive alternative to higher-cost and complex customer support systems - simple, lightweight, reliable, open source, web-based and easy to setup and use.',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,0,1,'Sample (with variables)','\r\n%{ticket.name},\r\n\r\nYour ticket #%{ticket.number} created on %{ticket.create_date} is in %{ticket.dept.name} department.\r\n\r\n',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ost_canned_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_config`
--

DROP TABLE IF EXISTS `ost_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_config` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `isonline` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timezone_offset` float(3,1) NOT NULL DEFAULT '0.0',
  `enable_daylight_saving` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `staff_ip_binding` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `staff_max_logins` tinyint(3) unsigned NOT NULL DEFAULT '4',
  `staff_login_timeout` int(10) unsigned NOT NULL DEFAULT '2',
  `staff_session_timeout` int(10) unsigned NOT NULL DEFAULT '30',
  `passwd_reset_period` int(10) unsigned NOT NULL DEFAULT '0',
  `client_max_logins` tinyint(3) unsigned NOT NULL DEFAULT '4',
  `client_login_timeout` int(10) unsigned NOT NULL DEFAULT '2',
  `client_session_timeout` int(10) unsigned NOT NULL DEFAULT '30',
  `max_page_size` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `max_open_tickets` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `max_file_size` int(11) unsigned NOT NULL DEFAULT '1048576',
  `max_user_file_uploads` tinyint(3) unsigned NOT NULL,
  `max_staff_file_uploads` tinyint(3) unsigned NOT NULL,
  `autolock_minutes` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `overdue_grace_period` int(10) unsigned NOT NULL DEFAULT '0',
  `alert_email_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `default_email_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `default_dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `default_sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `default_priority_id` tinyint(2) unsigned NOT NULL DEFAULT '2',
  `default_template_id` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `default_timezone_id` int(10) unsigned NOT NULL DEFAULT '0',
  `default_smtp_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `allow_email_spoofing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clickable_urls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allow_priority_change` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `use_email_priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_kb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_premade` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_captcha` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_auto_cron` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_mail_polling` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `send_sys_errors` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `send_sql_errors` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `send_mailparse_errors` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `send_login_errors` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `save_email_headers` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `strip_quoted_reply` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `log_ticket_activity` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ticket_autoresponder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_autoresponder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ticket_notice_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ticket_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ticket_alert_admin` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ticket_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ticket_alert_dept_members` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_alert_laststaff` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message_alert_assigned` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `note_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `note_alert_laststaff` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `note_alert_assigned` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `note_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `transfer_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `transfer_alert_assigned` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `transfer_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `transfer_alert_dept_members` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overdue_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overdue_alert_assigned` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `overdue_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `overdue_alert_dept_members` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `assigned_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `assigned_alert_staff` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `assigned_alert_team_lead` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `assigned_alert_team_members` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_assign_reopened_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `show_related_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `show_assigned_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `show_answered_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `show_notes_inline` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `hide_staff_name` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overlimit_notice_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `email_attachments` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allow_attachments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_email_attachments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_online_attachments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_online_attachments_onlogin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `random_ticket_ids` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `log_level` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `log_graceperiod` int(10) unsigned NOT NULL DEFAULT '12',
  `upload_dir` varchar(255) NOT NULL DEFAULT '',
  `allowed_filetypes` varchar(255) NOT NULL DEFAULT '.doc, .pdf',
  `time_format` varchar(32) NOT NULL DEFAULT ' h:i A',
  `date_format` varchar(32) NOT NULL DEFAULT 'm/d/Y',
  `datetime_format` varchar(60) NOT NULL DEFAULT 'm/d/Y g:i a',
  `daydatetime_format` varchar(60) NOT NULL DEFAULT 'D, M j Y g:ia',
  `reply_separator` varchar(60) NOT NULL DEFAULT '-- do not edit --',
  `admin_email` varchar(125) NOT NULL DEFAULT '',
  `helpdesk_title` varchar(255) NOT NULL DEFAULT 'osTicket Support Ticket System',
  `helpdesk_url` varchar(255) NOT NULL DEFAULT '',
  `schema_signature` char(32) NOT NULL DEFAULT '',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `isoffline` (`isonline`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_config`
--

LOCK TABLES `ost_config` WRITE;
/*!40000 ALTER TABLE `ost_config` DISABLE KEYS */;
INSERT INTO `ost_config` VALUES (1,1,0.0,0,1,4,2,30,0,4,2,30,25,0,1048576,0,0,3,0,2,1,1,1,2,1,8,0,0,1,0,0,0,1,0,0,1,1,1,1,1,1,1,1,0,0,0,0,1,1,0,0,1,1,0,0,1,1,0,0,0,1,0,0,1,1,0,1,1,0,0,1,1,1,0,1,0,0,1,0,0,0,0,1,2,12,'','.doc, .pdf',' h:i A','m/d/Y','m/d/Y g:i a','D, M j Y g:ia','-- do not edit --','e-pcastrog@ripley.cl','Sistema de incidencias','http://localhost/ticketqa/','d959a00e55c75e0c903b9e37324fd25d','2013-04-30 20:47:10');
/*!40000 ALTER TABLE `ost_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_department`
--

DROP TABLE IF EXISTS `ost_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_department` (
  `dept_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tpl_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `autoresp_email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `manager_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_name` varchar(128) NOT NULL DEFAULT '',
  `dept_signature` tinytext NOT NULL,
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `group_membership` tinyint(1) NOT NULL DEFAULT '0',
  `ticket_auto_response` tinyint(1) NOT NULL DEFAULT '1',
  `message_auto_response` tinyint(1) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `dept_name` (`dept_name`),
  KEY `manager_id` (`manager_id`),
  KEY `autoresp_email_id` (`autoresp_email_id`),
  KEY `tpl_id` (`tpl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_department`
--

LOCK TABLES `ost_department` WRITE;
/*!40000 ALTER TABLE `ost_department` DISABLE KEYS */;
INSERT INTO `ost_department` VALUES (1,0,0,1,1,0,'Support','Support Dept',1,0,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,0,1,1,1,0,'Billing','Billing Dept',1,0,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ost_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_email`
--

DROP TABLE IF EXISTS `ost_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_email` (
  `email_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `noautoresp` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `priority_id` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `userid` varchar(255) NOT NULL,
  `userpass` varchar(125) NOT NULL,
  `mail_active` tinyint(1) NOT NULL DEFAULT '0',
  `mail_host` varchar(255) NOT NULL,
  `mail_protocol` enum('POP','IMAP') NOT NULL DEFAULT 'POP',
  `mail_encryption` enum('NONE','SSL') NOT NULL,
  `mail_port` int(6) DEFAULT NULL,
  `mail_fetchfreq` tinyint(3) NOT NULL DEFAULT '5',
  `mail_fetchmax` tinyint(4) NOT NULL DEFAULT '30',
  `mail_archivefolder` varchar(255) DEFAULT NULL,
  `mail_delete` tinyint(1) NOT NULL DEFAULT '0',
  `mail_errors` tinyint(3) NOT NULL DEFAULT '0',
  `mail_lasterror` datetime DEFAULT NULL,
  `mail_lastfetch` datetime DEFAULT NULL,
  `smtp_active` tinyint(1) DEFAULT '0',
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` int(6) DEFAULT NULL,
  `smtp_secure` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_auth` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_spoofing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email` (`email`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_email`
--

LOCK TABLES `ost_email` WRITE;
/*!40000 ALTER TABLE `ost_email` DISABLE KEYS */;
INSERT INTO `ost_email` VALUES (1,0,2,1,'g-gestionrdc@ripley.cl','Support','ripley-main\\g-gestionrdc','3rhew4JDVpHYllzVdKJK1f/rkcSKNABOK7WnjnBeTSc=',1,'10.0.152.74','IMAP','NONE',143,5,30,NULL,0,0,NULL,NULL,1,'smtp.ripley.local',25,1,0,0,'','2013-04-30 16:43:43','2013-04-30 16:48:06'),(2,0,2,1,'alerts@ripley.cl','osTicket Alerts','','',0,'','POP','NONE',NULL,5,30,NULL,0,0,NULL,NULL,0,'',NULL,1,1,0,NULL,'2013-04-30 16:43:43','2013-04-30 16:43:43'),(3,0,2,1,'noreply@ripley.cl','','','',0,'','POP','NONE',NULL,5,30,NULL,0,0,NULL,NULL,0,'',NULL,1,1,0,NULL,'2013-04-30 16:43:43','2013-04-30 16:43:43');
/*!40000 ALTER TABLE `ost_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_email_template`
--

DROP TABLE IF EXISTS `ost_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_email_template` (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `cfg_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `ticket_autoresp_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_autoresp_body` text NOT NULL,
  `ticket_autoreply_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_autoreply_body` text NOT NULL,
  `ticket_notice_subj` varchar(255) NOT NULL,
  `ticket_notice_body` text NOT NULL,
  `ticket_alert_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_alert_body` text NOT NULL,
  `message_autoresp_subj` varchar(255) NOT NULL DEFAULT '',
  `message_autoresp_body` text NOT NULL,
  `message_alert_subj` varchar(255) NOT NULL DEFAULT '',
  `message_alert_body` text NOT NULL,
  `note_alert_subj` varchar(255) NOT NULL,
  `note_alert_body` text NOT NULL,
  `assigned_alert_subj` varchar(255) NOT NULL DEFAULT '',
  `assigned_alert_body` text NOT NULL,
  `transfer_alert_subj` varchar(255) NOT NULL DEFAULT '',
  `transfer_alert_body` text NOT NULL,
  `ticket_overdue_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_overdue_body` text NOT NULL,
  `ticket_overlimit_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_overlimit_body` text NOT NULL,
  `ticket_reply_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_reply_body` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`tpl_id`),
  KEY `cfg_id` (`cfg_id`),
  FULLTEXT KEY `message_subj` (`ticket_reply_subj`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_email_template`
--

LOCK TABLES `ost_email_template` WRITE;
/*!40000 ALTER TABLE `ost_email_template` DISABLE KEYS */;
INSERT INTO `ost_email_template` VALUES (1,1,1,'osTicket Default Template','Default osTicket templates','Support Ticket Opened [#%{ticket.number}]','%{ticket.name},\r\n\r\nA request for support has been created and assigned ticket #%{ticket.number}. A representative will follow-up with you as soon as possible.\r\n\r\nYou can view this ticket\'s progress online here: %{ticket.client_link}.\r\n\r\nIf you wish to send additional comments or information regarding this issue, please don\'t open a new ticket. Simply login using the link above and update the ticket.\r\n\r\n%{signature}','Support Ticket Opened [#%{ticket.number}]','%{ticket.name},\r\n\r\nA request for support has been created and assigned ticket #%{ticket.number} with the following auto-reply:\r\n\r\n%{response}\r\n\r\n\r\nWe hope this response has sufficiently answered your questions. If not, please do not open another ticket. If need be, representative will follow-up with you as soon as possible.\r\n\r\nYou can view this ticket\'s progress online here: %{ticket.client_link}.','[#%{ticket.number}] %{ticket.subject}','%{ticket.name},\r\n\r\nOur customer care team has created a ticket, #%{ticket.number} on your behalf, with the following message.\r\n\r\n%{message}\r\n\r\nIf you wish to provide additional comments or information regarding this issue, please don\'t open a new ticket. You can update or view this ticket\'s progress online here: %{ticket.client_link}.\r\n\r\n%{signature}','New Ticket Alert','%{recipient},\r\n\r\nNew ticket #%{ticket.number} created.\r\n\r\n-----------------------\r\nName: %{ticket.name}\r\nEmail: %{ticket.email}\r\nDept: %{ticket.dept.name}\r\n\r\n%{message}\r\n-----------------------\r\n\r\nTo view/respond to the ticket, please login to the support ticket system.\r\n\r\n%{ticket.staff_link}\r\n\r\n- Your friendly Customer Support System - powered by osTicket.','[#%{ticket.number}] Message Added','%{ticket.name},\r\n\r\nYour reply to support request #%{ticket.number} has been noted.\r\n\r\nYou can view this support request progress online here: %{ticket.client_link}.\r\n\r\n%{signature}','New Message Alert','%{recipient},\r\n\r\nNew message appended to ticket #%{ticket.number}\r\n\r\n----------------------\r\nName: %{ticket.name}\r\nEmail: %{ticket.email}\r\nDept: %{ticket.dept.name}\r\n\r\n%{message}\r\n----------------------\r\n\r\nTo view/respond to the ticket, please login to the support ticket system.\r\n\r\n%{ticket.staff_link}\r\n\r\n- Your friendly Customer Support System - powered by osTicket.','New Internal Note Alert','%{recipient},\r\n\r\nInternal note appended to ticket #%{ticket.number}\r\n\r\n----------------------\r\n* %{note.title} *\r\n\r\n%{note.message}\r\n----------------------\r\n\r\nTo view/respond to the ticket, please login to the support ticket system.\r\n\r\n%{ticket.staff_link}\r\n\r\n- Your friendly Customer Support System - powered by osTicket.','Ticket #%{ticket.number} Assigned to you','%{assignee},\r\n\r\nTicket #%{ticket.number} has been assigned to you by %{assigner}\r\n\r\n----------------------\r\n\r\n%{comments}\r\n\r\n----------------------\r\n\r\nTo view complete details, simply login to the support system.\r\n\r\n%{ticket.staff_link}\r\n\r\n- Your friendly Support Ticket System - powered by osTicket.','Ticket Transfer #%{ticket.number} - %{ticket.dept.name}','%{recipient},\r\n\r\nTicket #%{ticket.number} has been transferred to %{ticket.dept.name} department by %{staff.name}\r\n\r\n----------------------\r\n\r\n%{comments}\r\n\r\n----------------------\r\n\r\nTo view/respond to the ticket, please login to the support ticket system.\r\n\r\n%{ticket.staff_link}\r\n\r\n- Your friendly Customer Support System - powered by osTicket.','Stale Ticket Alert','%{recipient},\r\n\r\nA ticket, #%{ticket.number} assigned to you or in your department is seriously overdue.\r\n\r\n%{ticket.staff_link}\r\n\r\nWe should all work hard to guarantee that all tickets are being addressed in a timely manner.\r\n\r\n- Your friendly (although with limited patience) Support Ticket System - powered by osTicket.','Open Tickets Limit Reached','%{ticket.name}\r\n\r\nYou have reached the maximum number of open tickets allowed.\r\n\r\nTo be able to open another ticket, one of your pending tickets must be closed. To update or add comments to an open ticket simply login using the link below.\r\n\r\n%{url}/tickets.php?e=%{ticket.email}\r\n\r\nThank you.\r\n\r\nSupport Ticket System','[#%{ticket.number}] %{ticket.subject}','%{ticket.name},\r\n\r\nA customer support staff member has replied to your support request, #%{ticket.number} with the following response:\r\n\r\n%{response}\r\n\r\nWe hope this response has sufficiently answered your questions. If not, please do not send another email. Instead, reply to this email or login to your account for a complete archive of all your support requests and responses.\r\n\r\n%{ticket.client_link}\r\n\r\n%{signature}','2013-04-30 16:43:42','2013-04-30 16:43:42');
/*!40000 ALTER TABLE `ost_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_faq`
--

DROP TABLE IF EXISTS `ost_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_faq` (
  `faq_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ispublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `keywords` tinytext,
  `notes` text,
  `created` date NOT NULL,
  `updated` date NOT NULL,
  PRIMARY KEY (`faq_id`),
  UNIQUE KEY `question` (`question`),
  KEY `category_id` (`category_id`),
  KEY `ispublished` (`ispublished`),
  FULLTEXT KEY `faq` (`question`,`answer`,`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_faq`
--

LOCK TABLES `ost_faq` WRITE;
/*!40000 ALTER TABLE `ost_faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_faq_attachment`
--

DROP TABLE IF EXISTS `ost_faq_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_faq_attachment` (
  `faq_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`faq_id`,`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_faq_attachment`
--

LOCK TABLES `ost_faq_attachment` WRITE;
/*!40000 ALTER TABLE `ost_faq_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_faq_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_faq_category`
--

DROP TABLE IF EXISTS `ost_faq_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_faq_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(125) DEFAULT NULL,
  `description` text NOT NULL,
  `notes` tinytext NOT NULL,
  `created` date NOT NULL,
  `updated` date NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `ispublic` (`ispublic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_faq_category`
--

LOCK TABLES `ost_faq_category` WRITE;
/*!40000 ALTER TABLE `ost_faq_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_faq_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_faq_topic`
--

DROP TABLE IF EXISTS `ost_faq_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_faq_topic` (
  `faq_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`faq_id`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_faq_topic`
--

LOCK TABLES `ost_faq_topic` WRITE;
/*!40000 ALTER TABLE `ost_faq_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_faq_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_file`
--

DROP TABLE IF EXISTS `ost_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `size` varchar(25) NOT NULL DEFAULT '',
  `hash` varchar(125) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_file`
--

LOCK TABLES `ost_file` WRITE;
/*!40000 ALTER TABLE `ost_file` DISABLE KEYS */;
INSERT INTO `ost_file` VALUES (1,'text/plain','25','670c6cc1d1dfc97fad20e5470251b255','osTicket.txt','2013-04-30 16:43:42');
/*!40000 ALTER TABLE `ost_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_file_chunk`
--

DROP TABLE IF EXISTS `ost_file_chunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_file_chunk` (
  `file_id` int(11) NOT NULL,
  `chunk_id` int(11) NOT NULL,
  `filedata` longblob NOT NULL,
  PRIMARY KEY (`file_id`,`chunk_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_file_chunk`
--

LOCK TABLES `ost_file_chunk` WRITE;
/*!40000 ALTER TABLE `ost_file_chunk` DISABLE KEYS */;
INSERT INTO `ost_file_chunk` VALUES (1,0,'Canned attachments rock!\n');
/*!40000 ALTER TABLE `ost_file_chunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_filter`
--

DROP TABLE IF EXISTS `ost_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_filter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `execorder` int(10) unsigned NOT NULL DEFAULT '99',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `match_all_rules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `stop_onmatch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `reject_ticket` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `use_replyto_email` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disable_autoresponder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `canned_response_id` int(11) unsigned NOT NULL DEFAULT '0',
  `email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `target` enum('Any','Web','Email','API') NOT NULL DEFAULT 'Any',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `target` (`target`),
  KEY `email_id` (`email_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_filter`
--

LOCK TABLES `ost_filter` WRITE;
/*!40000 ALTER TABLE `ost_filter` DISABLE KEYS */;
INSERT INTO `ost_filter` VALUES (1,99,1,0,0,1,0,0,0,0,0,0,0,0,0,'Any','SYSTEM BAN LIST','Internal list for email banning. Do not remove','2013-04-30 16:43:41','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ost_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_filter_rule`
--

DROP TABLE IF EXISTS `ost_filter_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_filter_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` int(10) unsigned NOT NULL DEFAULT '0',
  `what` enum('name','email','subject','body','header') NOT NULL,
  `how` enum('equal','not_equal','contains','dn_contain','starts','ends') NOT NULL,
  `val` varchar(255) NOT NULL,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filter` (`filter_id`,`what`,`how`,`val`),
  KEY `filter_id` (`filter_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_filter_rule`
--

LOCK TABLES `ost_filter_rule` WRITE;
/*!40000 ALTER TABLE `ost_filter_rule` DISABLE KEYS */;
INSERT INTO `ost_filter_rule` VALUES (1,1,'email','equal','test@example.com',1,'','2013-04-30 16:43:42','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ost_filter_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_group_dept_access`
--

DROP TABLE IF EXISTS `ost_group_dept_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_group_dept_access` (
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `group_dept` (`group_id`,`dept_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_group_dept_access`
--

LOCK TABLES `ost_group_dept_access` WRITE;
/*!40000 ALTER TABLE `ost_group_dept_access` DISABLE KEYS */;
INSERT INTO `ost_group_dept_access` VALUES (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);
/*!40000 ALTER TABLE `ost_group_dept_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_groups`
--

DROP TABLE IF EXISTS `ost_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_groups` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL DEFAULT '',
  `can_create_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_edit_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_post_ticket_reply` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_delete_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_close_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_assign_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_transfer_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_ban_emails` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_manage_premade` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_manage_faq` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_view_staff_stats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `group_active` (`group_enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_groups`
--

LOCK TABLES `ost_groups` WRITE;
/*!40000 ALTER TABLE `ost_groups` DISABLE KEYS */;
INSERT INTO `ost_groups` VALUES (1,1,'Admins',1,1,1,1,1,1,1,1,1,1,0,'overlords','2013-04-30 16:43:42','2013-04-30 16:43:42'),(2,1,'Managers',1,1,1,1,1,1,1,1,1,1,0,'','2013-04-30 16:43:42','2013-04-30 16:43:42'),(3,1,'Staff',1,1,1,0,1,1,1,0,0,0,0,'','2013-04-30 16:43:42','2013-04-30 16:43:42');
/*!40000 ALTER TABLE `ost_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_help_topic`
--

DROP TABLE IF EXISTS `ost_help_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_help_topic` (
  `topic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topic_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `noautoresp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `priority_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`topic_id`),
  UNIQUE KEY `topic` (`topic`,`topic_pid`),
  KEY `topic_pid` (`topic_pid`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`),
  KEY `staff_id` (`staff_id`,`team_id`),
  KEY `sla_id` (`sla_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_help_topic`
--

LOCK TABLES `ost_help_topic` WRITE;
/*!40000 ALTER TABLE `ost_help_topic` DISABLE KEYS */;
INSERT INTO `ost_help_topic` VALUES (1,0,1,1,0,2,1,0,0,1,'Support',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,0,1,1,0,3,1,0,0,0,'Billing',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ost_help_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_session`
--

DROP TABLE IF EXISTS `ost_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_session` (
  `session_id` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `session_data` longtext COLLATE utf8_unicode_ci,
  `session_expire` datetime DEFAULT NULL,
  `session_updated` datetime DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'osTicket staff ID',
  `user_ip` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `updated` (`session_updated`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_session`
--

LOCK TABLES `ost_session` WRITE;
/*!40000 ALTER TABLE `ost_session` DISABLE KEYS */;
INSERT INTO `ost_session` VALUES ('ekfn9jijd1lbmokff8e320heq1','csrf|a:2:{s:5:\"token\";s:56:\"YzI3MzljN2NmNTI1MWI4OWMxNmI4ZjA1ZTg2ZDczMzUzY2UwZjJmYg==\";s:4:\"time\";i:1367354887;}TZ_OFFSET|s:4:\"-5.0\";TZ_DST|b:0;_staff|a:2:{s:6:\"userID\";s:8:\"pcastrog\";s:5:\"token\";s:76:\"21fe6500d3682346795538cc929c829f:1367354887:837ec5754f503cfaaee0929fd48974e7\";}search_0e25e1ebcf20987671ddef66f45d5f50|s:1832:\"SELECT DISTINCT ticket.ticket_id,lock_id,ticketID,ticket.dept_id,ticket.staff_id,ticket.team_id  ,ticket.subject,ticket.name,ticket.email,dept_name  ,ticket.status,ticket.source,isoverdue,isanswered,ticket.created,pri.*  ,count(attach.attach_id) as attachments  ,count(DISTINCT thread.id) as thread_count  ,IF(ticket.duedate IS NULL,IF(sla.id IS NULL, NULL, DATE_ADD(ticket.created, INTERVAL sla.grace_period HOUR)), ticket.duedate) as duedate  ,IF(ticket.reopened is NULL,IF(ticket.lastmessage is NULL,ticket.created,ticket.lastmessage),ticket.reopened) as effective_date  ,CONCAT_WS(\" \", staff.firstname, staff.lastname) as staff, team.name as team  ,IF(staff.staff_id IS NULL,team.name,CONCAT_WS(\" \", staff.lastname, staff.firstname)) as assigned  ,IF(ptopic.topic_pid IS NULL, topic.topic, CONCAT_WS(\" / \", ptopic.topic, topic.topic)) as helptopic   FROM ost_ticket ticket  LEFT JOIN ost_department dept ON ticket.dept_id=dept.dept_id  LEFT JOIN ost_ticket_priority pri ON (ticket.priority_id=pri.priority_id)  LEFT JOIN ost_ticket_lock tlock ON (ticket.ticket_id=tlock.ticket_id AND tlock.expire>NOW() \n               AND tlock.staff_id!=1)  LEFT JOIN ost_ticket_attachment attach ON (ticket.ticket_id=attach.ticket_id)  LEFT JOIN ost_ticket_thread thread ON ( ticket.ticket_id=thread.ticket_id)  LEFT JOIN ost_staff staff ON (ticket.staff_id=staff.staff_id)  LEFT JOIN ost_team team ON (ticket.team_id=team.team_id)  LEFT JOIN ost_sla sla ON (ticket.sla_id=sla.id AND sla.isactive=1)  LEFT JOIN ost_help_topic topic ON (ticket.topic_id=topic.topic_id)  LEFT JOIN ost_help_topic ptopic ON (ptopic.topic_id=topic.topic_pid)   WHERE (   ticket.staff_id=1 OR ticket.dept_id IN (1,2) ) AND status=\'open\' AND isanswered=0   GROUP BY ticket.ticket_id ORDER BY priority_urgency ASC, effective_date DESC, ticket.created DESC LIMIT 0,25\";lastcroncall|i:1367354831;','2013-05-01 16:48:07','2013-04-30 16:48:07',1,'::1','Mozilla/5.0 (Windows NT 6.1; rv:20.0) Gecko/20100101 Firefox/20.0');
/*!40000 ALTER TABLE `ost_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_sla`
--

DROP TABLE IF EXISTS `ost_sla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_sla` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_priority_escalation` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disable_overdue_alerts` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `grace_period` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_sla`
--

LOCK TABLES `ost_sla` WRITE;
/*!40000 ALTER TABLE `ost_sla` DISABLE KEYS */;
INSERT INTO `ost_sla` VALUES (1,1,1,0,48,'Default SLA',NULL,'2013-04-30 16:43:43','2013-04-30 16:43:43');
/*!40000 ALTER TABLE `ost_sla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_staff`
--

DROP TABLE IF EXISTS `ost_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_staff` (
  `staff_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `timezone_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `passwd` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `phone` varchar(24) NOT NULL DEFAULT '',
  `phone_ext` varchar(6) DEFAULT NULL,
  `mobile` varchar(24) NOT NULL DEFAULT '',
  `signature` tinytext NOT NULL,
  `notes` text,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `isvisible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `onvacation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `assigned_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `show_assigned_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `daylight_saving` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `change_passwd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `max_page_size` int(11) unsigned NOT NULL DEFAULT '0',
  `auto_refresh_rate` int(10) unsigned NOT NULL DEFAULT '0',
  `default_signature_type` enum('none','mine','dept') NOT NULL DEFAULT 'none',
  `default_paper_size` enum('Letter','Legal','Ledger','A4','A3') NOT NULL DEFAULT 'Letter',
  `created` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `passwdreset` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `username` (`username`),
  KEY `dept_id` (`dept_id`),
  KEY `issuperuser` (`isadmin`),
  KEY `group_id` (`group_id`,`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_staff`
--

LOCK TABLES `ost_staff` WRITE;
/*!40000 ALTER TABLE `ost_staff` DISABLE KEYS */;
INSERT INTO `ost_staff` VALUES (1,1,1,8,'pcastrog','Peter','Castro','$2a$08$O.wabCFk8zf8z6TNm/W55Of1WLAaH1UL2RYK1Xe5y38Z9hIOu1sm.','e-pcastrog@ripley.cl','',NULL,'','',NULL,1,1,1,0,0,0,0,0,25,0,'none','Letter','2013-04-30 16:43:43','2013-04-30 16:43:57',NULL,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ost_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_syslog`
--

DROP TABLE IF EXISTS `ost_syslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_syslog` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` enum('Debug','Warning','Error') NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `logger` varchar(64) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_type` (`log_type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_syslog`
--

LOCK TABLES `ost_syslog` WRITE;
/*!40000 ALTER TABLE `ost_syslog` DISABLE KEYS */;
INSERT INTO `ost_syslog` VALUES (1,'Debug','osTicket installed!','Congratulations osTicket basic installation completed!\n\nThank you for choosing osTicket!','','::1','2013-04-30 16:43:43','2013-04-30 16:43:43');
/*!40000 ALTER TABLE `ost_syslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_team`
--

DROP TABLE IF EXISTS `ost_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_team` (
  `team_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `noalerts` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(125) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `name` (`name`),
  KEY `isnabled` (`isenabled`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_team`
--

LOCK TABLES `ost_team` WRITE;
/*!40000 ALTER TABLE `ost_team` DISABLE KEYS */;
INSERT INTO `ost_team` VALUES (1,0,1,0,'Level I Support','','2013-04-30 16:43:43','2013-04-30 16:43:43');
/*!40000 ALTER TABLE `ost_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_team_member`
--

DROP TABLE IF EXISTS `ost_team_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_team_member` (
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`team_id`,`staff_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_team_member`
--

LOCK TABLES `ost_team_member` WRITE;
/*!40000 ALTER TABLE `ost_team_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_team_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_ticket`
--

DROP TABLE IF EXISTS `ost_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_ticket` (
  `ticket_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticketID` int(11) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '1',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority_id` int(10) unsigned NOT NULL DEFAULT '2',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '[no subject]',
  `phone` varchar(16) DEFAULT NULL,
  `phone_ext` varchar(8) DEFAULT NULL,
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `status` enum('open','closed') NOT NULL DEFAULT 'open',
  `source` enum('Web','Email','Phone','API','Other') NOT NULL DEFAULT 'Other',
  `isoverdue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isanswered` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `reopened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `lastmessage` datetime DEFAULT NULL,
  `lastresponse` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`ticket_id`),
  UNIQUE KEY `email_extid` (`ticketID`,`email`),
  KEY `dept_id` (`dept_id`),
  KEY `staff_id` (`staff_id`),
  KEY `team_id` (`staff_id`),
  KEY `status` (`status`),
  KEY `priority_id` (`priority_id`),
  KEY `created` (`created`),
  KEY `closed` (`closed`),
  KEY `duedate` (`duedate`),
  KEY `topic_id` (`topic_id`),
  KEY `sla_id` (`sla_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_ticket`
--

LOCK TABLES `ost_ticket` WRITE;
/*!40000 ALTER TABLE `ost_ticket` DISABLE KEYS */;
INSERT INTO `ost_ticket` VALUES (1,890003,1,0,2,1,0,0,'support@osticket.com','osTicket Support','osTicket Installed!',NULL,NULL,'','open','Web',0,0,NULL,NULL,NULL,NULL,NULL,'2013-04-30 16:43:43','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ost_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_ticket_attachment`
--

DROP TABLE IF EXISTS `ost_ticket_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_ticket_attachment` (
  `attach_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ref_type` enum('M','R','N') NOT NULL DEFAULT 'M',
  `created` datetime NOT NULL,
  PRIMARY KEY (`attach_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `ref_type` (`ref_type`),
  KEY `ref_id` (`ref_id`),
  KEY `file_id` (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_ticket_attachment`
--

LOCK TABLES `ost_ticket_attachment` WRITE;
/*!40000 ALTER TABLE `ost_ticket_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_ticket_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_ticket_email_info`
--

DROP TABLE IF EXISTS `ost_ticket_email_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_ticket_email_info` (
  `message_id` int(11) unsigned NOT NULL,
  `email_mid` varchar(255) NOT NULL,
  `headers` text,
  KEY `message_id` (`email_mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_ticket_email_info`
--

LOCK TABLES `ost_ticket_email_info` WRITE;
/*!40000 ALTER TABLE `ost_ticket_email_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_ticket_email_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_ticket_event`
--

DROP TABLE IF EXISTS `ost_ticket_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_ticket_event` (
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(11) unsigned NOT NULL,
  `team_id` int(11) unsigned NOT NULL,
  `dept_id` int(11) unsigned NOT NULL,
  `topic_id` int(11) unsigned NOT NULL,
  `state` enum('created','closed','reopened','assigned','transferred','overdue') NOT NULL,
  `staff` varchar(255) NOT NULL DEFAULT 'SYSTEM',
  `annulled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL,
  KEY `ticket_state` (`ticket_id`,`state`,`timestamp`),
  KEY `ticket_stats` (`timestamp`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_ticket_event`
--

LOCK TABLES `ost_ticket_event` WRITE;
/*!40000 ALTER TABLE `ost_ticket_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_ticket_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_ticket_lock`
--

DROP TABLE IF EXISTS `ost_ticket_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_ticket_lock` (
  `lock_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `expire` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`lock_id`),
  UNIQUE KEY `ticket_id` (`ticket_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_ticket_lock`
--

LOCK TABLES `ost_ticket_lock` WRITE;
/*!40000 ALTER TABLE `ost_ticket_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_ticket_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_ticket_priority`
--

DROP TABLE IF EXISTS `ost_ticket_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_ticket_priority` (
  `priority_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `priority` varchar(60) NOT NULL DEFAULT '',
  `priority_desc` varchar(30) NOT NULL DEFAULT '',
  `priority_color` varchar(7) NOT NULL DEFAULT '',
  `priority_urgency` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`priority_id`),
  UNIQUE KEY `priority` (`priority`),
  KEY `priority_urgency` (`priority_urgency`),
  KEY `ispublic` (`ispublic`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_ticket_priority`
--

LOCK TABLES `ost_ticket_priority` WRITE;
/*!40000 ALTER TABLE `ost_ticket_priority` DISABLE KEYS */;
INSERT INTO `ost_ticket_priority` VALUES (1,'low','Low','#DDFFDD',4,1),(2,'normal','Normal','#FFFFF0',3,1),(3,'high','High','#FEE7E7',2,1),(4,'emergency','Emergency','#FEE7E7',1,0);
/*!40000 ALTER TABLE `ost_ticket_priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_ticket_thread`
--

DROP TABLE IF EXISTS `ost_ticket_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_ticket_thread` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(11) unsigned NOT NULL DEFAULT '0',
  `thread_type` enum('M','R','N') NOT NULL,
  `poster` varchar(128) NOT NULL DEFAULT '',
  `source` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `staff_id` (`staff_id`),
  KEY `pid` (`pid`),
  FULLTEXT KEY `body` (`body`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_ticket_thread`
--

LOCK TABLES `ost_ticket_thread` WRITE;
/*!40000 ALTER TABLE `ost_ticket_thread` DISABLE KEYS */;
INSERT INTO `ost_ticket_thread` VALUES (1,0,1,0,'M','','Web','osTicket Installed','Thank you for choosing osTicket.\n\nPlease make sure you join the osTicket forums at http://osticket.com/forums to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the osTicket wiki provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community.\n\nIf you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs.\n\nCheers,\n\n-\nosTicket Team\nhttp://osticket.com/\n\nPS. Don\'t just make customers happy, make happy customers!\n','','2013-04-30 16:43:43','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ost_ticket_thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_timezone`
--

DROP TABLE IF EXISTS `ost_timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_timezone` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `offset` float(3,1) NOT NULL DEFAULT '0.0',
  `timezone` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_timezone`
--

LOCK TABLES `ost_timezone` WRITE;
/*!40000 ALTER TABLE `ost_timezone` DISABLE KEYS */;
INSERT INTO `ost_timezone` VALUES (1,-12.0,'Eniwetok, Kwajalein'),(2,-11.0,'Midway Island, Samoa'),(3,-10.0,'Hawaii'),(4,-9.0,'Alaska'),(5,-8.0,'Pacific Time (US & Canada)'),(6,-7.0,'Mountain Time (US & Canada)'),(7,-6.0,'Central Time (US & Canada), Mexico City'),(8,-5.0,'Eastern Time (US & Canada), Bogota, Lima'),(9,-4.0,'Atlantic Time (Canada), Caracas, La Paz'),(10,-3.5,'Newfoundland'),(11,-3.0,'Brazil, Buenos Aires, Georgetown'),(12,-2.0,'Mid-Atlantic'),(13,-1.0,'Azores, Cape Verde Islands'),(14,0.0,'Western Europe Time, London, Lisbon, Casablanca'),(15,1.0,'Brussels, Copenhagen, Madrid, Paris'),(16,2.0,'Kaliningrad, South Africa'),(17,3.0,'Baghdad, Riyadh, Moscow, St. Petersburg'),(18,3.5,'Tehran'),(19,4.0,'Abu Dhabi, Muscat, Baku, Tbilisi'),(20,4.5,'Kabul'),(21,5.0,'Ekaterinburg, Islamabad, Karachi, Tashkent'),(22,5.5,'Bombay, Calcutta, Madras, New Delhi'),(23,6.0,'Almaty, Dhaka, Colombo'),(24,7.0,'Bangkok, Hanoi, Jakarta'),(25,8.0,'Beijing, Perth, Singapore, Hong Kong'),(26,9.0,'Tokyo, Seoul, Osaka, Sapporo, Yakutsk'),(27,9.5,'Adelaide, Darwin'),(28,10.0,'Eastern Australia, Guam, Vladivostok'),(29,11.0,'Magadan, Solomon Islands, New Caledonia'),(30,12.0,'Auckland, Wellington, Fiji, Kamchatka');
/*!40000 ALTER TABLE `ost_timezone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-30 16:54:49
