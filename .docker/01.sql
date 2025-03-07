CREATE DATABASE IF NOT EXISTS `test`;
GRANT ALL ON `test`.* TO 'user'@'%';


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+03:00";

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `aauth_groups`
--

CREATE TABLE `aauth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `definition` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `aauth_groups`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `aauth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

INSERT INTO `aauth_groups` (`id`, `name`, `definition`) VALUES
(1, 'Admin', 'Super Admin Group'),
(2, 'Public', 'Public Access Group'),
(3, 'Default', 'Default Access Group');

-- --------------------------------------------------------

--
-- Table structure for table `aauth_group_to_group`
--

CREATE TABLE `aauth_group_to_group` (
  `group_id` int(11) UNSIGNED NOT NULL,
  `subgroup_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `aauth_group_to_group`
  ADD PRIMARY KEY (`group_id`,`subgroup_id`);

-- --------------------------------------------------------

--
-- Table structure for table `aauth_login_attempts`
--

CREATE TABLE `aauth_login_attempts` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(39) DEFAULT '0',
  `timestamp` datetime DEFAULT NULL,
  `login_attempts` tinyint(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `aauth_login_attempts`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `aauth_login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

-- --------------------------------------------------------

--
-- Table structure for table `aauth_perms`
--

CREATE TABLE `aauth_perms` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `definition` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `aauth_perms`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `aauth_perms`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

INSERT INTO `aauth_perms` (`id`, `name`, `definition`) VALUES
(1, 'Administrator', 'Administrator permission'),
(2, 'User Management', 'User management');

-- --------------------------------------------------------

--
-- Table structure for table `aauth_perm_to_group`
--

CREATE TABLE `aauth_perm_to_group` (
  `perm_id` int(11) UNSIGNED NOT NULL,
  `group_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aauth_perm_to_user`
--

CREATE TABLE `aauth_perm_to_user` (
  `perm_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aauth_pms`
--

CREATE TABLE `aauth_pms` (
  `id` int(11) UNSIGNED NOT NULL,
  `sender_id` int(11) UNSIGNED NOT NULL,
  `receiver_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text,
  `date_sent` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL,
  `pm_deleted_sender` int(1) DEFAULT NULL,
  `pm_deleted_receiver` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `aauth_pms`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `aauth_pms`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Table structure for table `aauth_users`
--

CREATE TABLE `aauth_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass` varchar(64) NOT NULL,
  `name` varchar(192) NOT NULL,
  `mobile` varchar(32) DEFAULT NULL,
  `mobile_verified` enum('1','0') NOT NULL DEFAULT '0',
  `address` text,
  `photo` varchar(32) DEFAULT NULL,
  `fcm_token` text,
  `username` varchar(100) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `forgot_exp` text,
  `remember_time` datetime DEFAULT NULL,
  `remember_exp` text,
  `verification_code` text,
  `totp_secret` varchar(16) DEFAULT NULL,
  `ip_address` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `aauth_users`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `aauth_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

INSERT INTO `aauth_users` (`id`, `email`, `pass`, `name`, `mobile`, `mobile_verified`, `address`, `photo`, `fcm_token`, `username`, `banned`, `last_login`, `last_activity`, `date_created`, `forgot_exp`, `remember_time`, `remember_exp`, `verification_code`, `totp_secret`, `ip_address`) VALUES
(1, 'admin@example.com', '5711aa2253ac62088bf34f79f8ccd82e41bdbcf32e7670772d2a1e1746a9be9b', 'Admin', '0720000000', '0', NULL, NULL, NULL, 'admin', 0, '2023-05-01 18:56:44', '2023-05-01 18:56:44', '2023-05-01 16:15:30', NULL, '2023-05-01 00:00:00', 'irZX3leqavgQSFBH', NULL, NULL, '::1');

INSERT INTO `aauth_users` (`id`, `email`, `pass`, `name`, `mobile`, `mobile_verified`, `address`, `photo`, `fcm_token`, `username`, `banned`, `last_login`, `last_activity`, `date_created`, `forgot_exp`, `remember_time`, `remember_exp`, `verification_code`, `totp_secret`, `ip_address`) VALUES
(2, 'admin@teste.com', '5711aa2253ac62088bf34f79f8ccd82e41bdbcf32e7670772d2a1e1746a9be9b', 'Admin', '0720000000', '0', NULL, NULL, NULL, 'admin', 0, '2023-05-01 18:56:44', '2023-05-01 18:56:44', '2023-05-01 16:15:30', NULL, '2023-05-01 00:00:00', 'irZX3leqavgQSFBH', NULL, NULL, '::1');

INSERT INTO `aauth_users` (`id`, `email`, `pass`, `name`, `mobile`, `mobile_verified`, `address`, `photo`, `fcm_token`, `username`, `banned`, `last_login`, `last_activity`, `date_created`, `forgot_exp`, `remember_time`, `remember_exp`, `verification_code`, `totp_secret`, `ip_address`) VALUES
(3, 'cpdrenato@gmail.com', '$2y$10$KrOMZzf7ecTzRpUJiid9aOKJlmubkvf0A/LxDI8jRf3SkwtWkhXZu', 'Admin', '984306136', '0', NULL, NULL, NULL, 'admin', 0, '2023-05-01 18:56:44', '2023-05-01 18:56:44', '2023-05-01 16:15:30', NULL, '2023-05-01 00:00:00', 'irZX3leqavgQSFBH', NULL, NULL, '::1');
-- --------------------------------------------------------

--
-- Table structure for table `aauth_user_to_group`
--

CREATE TABLE `aauth_user_to_group` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aauth_user_to_group`
--

INSERT INTO `aauth_user_to_group` (`user_id`, `group_id`) VALUES
(1, 1),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `aauth_user_variables`
--

CREATE TABLE `aauth_user_variables` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `data_key` varchar(100) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `aauth_user_variables`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `aauth_user_variables`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Table structure for table `sys_logs`
--

CREATE TABLE `sys_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(64) DEFAULT NULL,
  `description` text NOT NULL,
  `ipaddress` varchar(16) DEFAULT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `createdon` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `sys_logs`
  ADD PRIMARY KEY (`id`);

CREATE TABLE `sys_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `setting` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `value` text NOT NULL,
  `tag` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `sys_settings`
  ADD PRIMARY KEY (`id`);
  
ALTER TABLE `sys_settings`
   MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

INSERT INTO `sys_settings` (`id`, `setting`, `description`, `value`, `tag`) VALUES
(1, 'SMS Username', 'Username used for SMS API calls', '', 'sms'),
(2, 'SMS API Key', 'API Key used SMS API Calls', '', 'sms'),
(3, 'SMS Shortcode', 'Shortcode is the name of the sender e.g. senderID', '', 'sms');
