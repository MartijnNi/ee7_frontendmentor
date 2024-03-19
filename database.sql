-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Gegenereerd op: 18 mrt 2024 om 10:24
-- Serverversie: 8.1.0
-- PHP-versie: 8.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_actions`
--

CREATE TABLE `exp_actions` (
  `action_id` int UNSIGNED NOT NULL,
  `class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `csrf_exempt` tinyint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_actions`
--

INSERT INTO `exp_actions` (`action_id`, `class`, `method`, `csrf_exempt`) VALUES
(1, 'Channel', 'submit_entry', 0),
(2, 'Channel', 'smiley_pop', 0),
(3, 'Channel', 'combo_loader', 0),
(4, 'Channel', 'live_preview', 1),
(5, 'Comment', 'insert_new_comment', 0),
(6, 'Comment_mcp', 'delete_comment_notification', 0),
(7, 'Comment', 'comment_subscribe', 0),
(8, 'Comment', 'edit_comment', 0),
(9, 'Consent', 'grantConsent', 0),
(10, 'Consent', 'submitConsent', 0),
(11, 'Consent', 'withdrawConsent', 0),
(12, 'Member', 'registration_form', 0),
(13, 'Member', 'register_member', 0),
(14, 'Member', 'activate_member', 0),
(15, 'Member', 'member_login', 0),
(16, 'Member', 'member_logout', 0),
(17, 'Member', 'send_reset_token', 0),
(18, 'Member', 'process_reset_password', 0),
(19, 'Member', 'send_member_email', 0),
(20, 'Member', 'update_un_pw', 0),
(21, 'Member', 'do_member_search', 0),
(22, 'Member', 'member_delete', 0),
(23, 'Member', 'send_username', 0),
(24, 'Member', 'update_profile', 0),
(25, 'Member', 'upload_avatar', 0),
(26, 'Member', 'recaptcha_check', 1),
(27, 'Member', 'validate', 0),
(28, 'Rte', 'pages_autocomplete', 0),
(29, 'File', 'addonIcon', 1),
(30, 'Relationship', 'entryList', 0),
(31, 'Search', 'do_search', 1),
(32, 'Pro', 'setCookie', 0),
(33, 'Pro', 'qrCode', 0),
(34, 'Pro', 'validateMfa', 0),
(35, 'Pro', 'invokeMfa', 0),
(36, 'Pro', 'enableMfa', 0),
(37, 'Pro', 'disableMfa', 0),
(38, 'Pro', 'resetMfa', 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_captcha`
--

CREATE TABLE `exp_captcha` (
  `captcha_id` bigint UNSIGNED NOT NULL,
  `date` int UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `word` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_categories`
--

CREATE TABLE `exp_categories` (
  `cat_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED NOT NULL,
  `cat_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_url_title` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_description` text COLLATE utf8mb4_unicode_ci,
  `cat_image` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_order` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_category_fields`
--

CREATE TABLE `exp_category_fields` (
  `field_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int UNSIGNED NOT NULL,
  `field_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field_label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field_type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `field_list_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_maxl` smallint NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `field_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_order` int UNSIGNED NOT NULL,
  `field_settings` text COLLATE utf8mb4_unicode_ci,
  `legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_category_field_data`
--

CREATE TABLE `exp_category_field_data` (
  `cat_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_category_groups`
--

CREATE TABLE `exp_category_groups` (
  `group_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a',
  `exclude_group` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `can_edit_categories` text COLLATE utf8mb4_unicode_ci,
  `can_delete_categories` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_category_group_settings`
--

CREATE TABLE `exp_category_group_settings` (
  `category_group_settings_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int UNSIGNED NOT NULL DEFAULT '1',
  `cat_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `cat_allow_multiple` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_category_posts`
--

CREATE TABLE `exp_category_posts` (
  `entry_id` int UNSIGNED NOT NULL,
  `cat_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_channels`
--

CREATE TABLE `exp_channels` (
  `channel_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `channel_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_lang` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_entries` mediumint NOT NULL DEFAULT '0',
  `total_records` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `total_comments` mediumint NOT NULL DEFAULT '0',
  `last_entry_date` int UNSIGNED NOT NULL DEFAULT '0',
  `last_comment_date` int UNSIGNED NOT NULL DEFAULT '0',
  `cat_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deft_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `search_excerpt` int UNSIGNED DEFAULT NULL,
  `deft_category` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deft_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_max_chars` int UNSIGNED DEFAULT NULL,
  `channel_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `channel_allow_img_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `channel_notify` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sticky_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `enable_entry_cloning` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_system_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_max_chars` int UNSIGNED DEFAULT '5000',
  `comment_timelock` int UNSIGNED NOT NULL DEFAULT '0',
  `comment_require_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_notify` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_expiration` int UNSIGNED NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rss_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_versioning` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `max_revisions` smallint UNSIGNED NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_field_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Title',
  `title_field_instructions` text COLLATE utf8mb4_unicode_ci,
  `url_title_prefix` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enforce_auto_url_title` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `preview_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_preview` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `max_entries` int UNSIGNED NOT NULL DEFAULT '0',
  `conditional_sync_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_channels_channel_fields`
--

CREATE TABLE `exp_channels_channel_fields` (
  `channel_id` int UNSIGNED NOT NULL,
  `field_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_channels_channel_field_groups`
--

CREATE TABLE `exp_channels_channel_field_groups` (
  `channel_id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_channels_statuses`
--

CREATE TABLE `exp_channels_statuses` (
  `channel_id` int UNSIGNED NOT NULL,
  `status_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_channel_category_groups`
--

CREATE TABLE `exp_channel_category_groups` (
  `channel_id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_channel_data`
--

CREATE TABLE `exp_channel_data` (
  `entry_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_channel_entries_autosave`
--

CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int UNSIGNED NOT NULL,
  `original_entry_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int UNSIGNED NOT NULL,
  `author_id` int UNSIGNED NOT NULL DEFAULT '0',
  `forum_topic_id` int UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versioning_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int UNSIGNED NOT NULL DEFAULT '0',
  `view_count_two` int UNSIGNED NOT NULL DEFAULT '0',
  `view_count_three` int UNSIGNED NOT NULL DEFAULT '0',
  `view_count_four` int UNSIGNED NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `sticky` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `entry_date` int NOT NULL,
  `year` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration_date` int NOT NULL DEFAULT '0',
  `comment_expiration_date` int NOT NULL DEFAULT '0',
  `edit_date` bigint DEFAULT NULL,
  `recent_comment_date` int DEFAULT NULL,
  `comment_total` int UNSIGNED NOT NULL DEFAULT '0',
  `entry_data` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_channel_entry_hidden_fields`
--

CREATE TABLE `exp_channel_entry_hidden_fields` (
  `entry_id` int UNSIGNED NOT NULL,
  `field_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_channel_fields`
--

CREATE TABLE `exp_channel_fields` (
  `field_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED DEFAULT '1',
  `field_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_instructions` text COLLATE utf8mb4_unicode_ci,
  `field_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `field_list_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_pre_populate` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int UNSIGNED DEFAULT NULL,
  `field_pre_field_id` int UNSIGNED DEFAULT NULL,
  `field_ta_rows` tinyint DEFAULT '8',
  `field_maxl` smallint DEFAULT NULL,
  `field_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `field_search` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_is_conditional` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `field_order` int UNSIGNED NOT NULL,
  `field_content_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'any',
  `field_settings` text COLLATE utf8mb4_unicode_ci,
  `legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `enable_frontedit` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_channel_field_groups_fields`
--

CREATE TABLE `exp_channel_field_groups_fields` (
  `field_id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_channel_form_settings`
--

CREATE TABLE `exp_channel_form_settings` (
  `channel_form_settings_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '0',
  `channel_id` int UNSIGNED NOT NULL DEFAULT '0',
  `default_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `allow_guest_posts` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `default_author` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_channel_member_roles`
--

CREATE TABLE `exp_channel_member_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_channel_titles`
--

CREATE TABLE `exp_channel_titles` (
  `entry_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int UNSIGNED NOT NULL,
  `author_id` int UNSIGNED NOT NULL DEFAULT '0',
  `forum_topic_id` int UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int UNSIGNED NOT NULL,
  `versioning_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int UNSIGNED NOT NULL DEFAULT '0',
  `view_count_two` int UNSIGNED NOT NULL DEFAULT '0',
  `view_count_three` int UNSIGNED NOT NULL DEFAULT '0',
  `view_count_four` int UNSIGNED NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `sticky` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `entry_date` int NOT NULL,
  `year` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration_date` int NOT NULL DEFAULT '0',
  `comment_expiration_date` int NOT NULL DEFAULT '0',
  `edit_date` bigint DEFAULT NULL,
  `recent_comment_date` int DEFAULT NULL,
  `comment_total` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_comments`
--

CREATE TABLE `exp_comments` (
  `comment_id` int UNSIGNED NOT NULL,
  `site_id` int DEFAULT '1',
  `entry_id` int UNSIGNED DEFAULT '0',
  `channel_id` int UNSIGNED DEFAULT '1',
  `author_id` int UNSIGNED DEFAULT '0',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_date` int DEFAULT NULL,
  `edit_date` int DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_comment_subscriptions`
--

CREATE TABLE `exp_comment_subscriptions` (
  `subscription_id` int UNSIGNED NOT NULL,
  `entry_id` int UNSIGNED DEFAULT NULL,
  `member_id` int DEFAULT '0',
  `email` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_date` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_sent` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n',
  `hash` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_config`
--

CREATE TABLE `exp_config` (
  `config_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '0',
  `key` varchar(64) NOT NULL DEFAULT '',
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_config`
--

INSERT INTO `exp_config` (`config_id`, `site_id`, `key`, `value`) VALUES
(1, 1, 'is_site_on', 'y'),
(2, 1, 'base_url', 'http://localhost/'),
(3, 1, 'base_path', '/var/www/public_html/'),
(4, 1, 'site_index', 'index.php'),
(5, 1, 'site_url', '{base_url}'),
(6, 1, 'cp_url', '{base_url}cms.php'),
(7, 1, 'theme_folder_url', '{base_url}themes/'),
(8, 1, 'theme_folder_path', '{base_path}themes/'),
(9, 1, 'webmaster_email', 'systeem@dunique.nl'),
(10, 1, 'webmaster_name', ''),
(11, 1, 'channel_nomenclature', 'channel'),
(12, 1, 'max_caches', '150'),
(13, 1, 'captcha_url', '{base_url}images/captchas/'),
(14, 1, 'captcha_path', '{base_path}images/captchas/'),
(15, 1, 'captcha_font', 'y'),
(16, 1, 'captcha_rand', 'y'),
(17, 1, 'captcha_require_members', 'n'),
(18, 1, 'require_captcha', 'n'),
(19, 1, 'enable_sql_caching', 'n'),
(20, 1, 'force_query_string', 'n'),
(21, 1, 'show_profiler', 'n'),
(22, 1, 'include_seconds', 'n'),
(23, 1, 'cookie_domain', ''),
(24, 1, 'cookie_path', '/'),
(25, 1, 'cookie_httponly', 'y'),
(26, 1, 'website_session_type', 'c'),
(27, 1, 'cp_session_type', 'c'),
(28, 1, 'allow_username_change', 'y'),
(29, 1, 'allow_multi_logins', 'y'),
(30, 1, 'password_lockout', 'y'),
(31, 1, 'password_lockout_interval', '1'),
(32, 1, 'require_ip_for_login', 'y'),
(33, 1, 'require_ip_for_posting', 'y'),
(34, 1, 'password_security_policy', 'basic'),
(35, 1, 'allow_dictionary_pw', 'y'),
(36, 1, 'name_of_dictionary_file', 'dictionary.txt'),
(37, 1, 'xss_clean_uploads', 'y'),
(38, 1, 'redirect_method', 'redirect'),
(39, 1, 'deft_lang', 'english'),
(40, 1, 'xml_lang', 'en'),
(41, 1, 'send_headers', 'y'),
(42, 1, 'gzip_output', 'n'),
(43, 1, 'default_site_timezone', 'UTC'),
(44, 1, 'date_format', '%n/%j/%Y'),
(45, 1, 'time_format', '12'),
(46, 1, 'week_start', 'sunday'),
(47, 1, 'mail_protocol', 'mail'),
(48, 1, 'email_newline', '\\n'),
(49, 1, 'smtp_server', ''),
(50, 1, 'smtp_username', ''),
(51, 1, 'smtp_password', ''),
(52, 1, 'email_smtp_crypto', 'ssl'),
(53, 1, 'email_debug', 'n'),
(54, 1, 'email_charset', 'utf-8'),
(55, 1, 'email_batchmode', 'n'),
(56, 1, 'email_batch_size', ''),
(57, 1, 'mail_format', 'plain'),
(58, 1, 'word_wrap', 'y'),
(59, 1, 'email_console_timelock', '5'),
(60, 1, 'log_email_console_msgs', 'y'),
(61, 1, 'log_search_terms', 'y'),
(62, 1, 'deny_duplicate_data', 'y'),
(63, 1, 'redirect_submitted_links', 'n'),
(64, 1, 'enable_censoring', 'n'),
(65, 1, 'censored_words', ''),
(66, 1, 'censor_replacement', ''),
(67, 1, 'banned_ips', ''),
(68, 1, 'banned_emails', ''),
(69, 1, 'banned_usernames', ''),
(70, 1, 'banned_screen_names', ''),
(71, 1, 'ban_action', 'restrict'),
(72, 1, 'ban_message', 'This site is currently unavailable'),
(73, 1, 'ban_destination', 'http://www.yahoo.com/'),
(74, 1, 'enable_emoticons', 'y'),
(75, 1, 'emoticon_url', '{base_url}images/smileys/'),
(76, 1, 'recount_batch_total', '1000'),
(77, 1, 'new_version_check', 'y'),
(78, 1, 'enable_throttling', 'n'),
(79, 1, 'banish_masked_ips', 'y'),
(80, 1, 'max_page_loads', '10'),
(81, 1, 'time_interval', '8'),
(82, 1, 'lockout_time', '30'),
(83, 1, 'banishment_type', 'message'),
(84, 1, 'banishment_url', ''),
(85, 1, 'banishment_message', 'You have exceeded the allowed page load frequency.'),
(86, 1, 'enable_search_log', 'y'),
(87, 1, 'max_logged_searches', '500'),
(88, 1, 'un_min_len', '4'),
(89, 1, 'pw_min_len', '5'),
(90, 1, 'allow_member_registration', 'n'),
(91, 1, 'allow_member_localization', 'y'),
(92, 1, 'req_mbr_activation', 'email'),
(93, 1, 'new_member_notification', 'n'),
(94, 1, 'mbr_notification_emails', ''),
(95, 1, 'require_terms_of_service', 'y'),
(96, 1, 'default_primary_role', '5'),
(97, 1, 'profile_trigger', 'member1710756332'),
(98, 1, 'member_theme', 'default'),
(99, 1, 'avatar_url', '{base_url}images/avatars/'),
(100, 1, 'avatar_path', '{base_path}images/avatars/'),
(101, 1, 'avatar_max_width', '100'),
(102, 1, 'avatar_max_height', '100'),
(103, 1, 'avatar_max_kb', '50'),
(104, 1, 'enable_photos', 'n'),
(105, 1, 'photo_url', '{base_url}images/member_photos/'),
(106, 1, 'photo_path', '/'),
(107, 1, 'photo_max_width', '100'),
(108, 1, 'photo_max_height', '100'),
(109, 1, 'photo_max_kb', '50'),
(110, 1, 'allow_signatures', 'y'),
(111, 1, 'sig_maxlength', '500'),
(112, 1, 'sig_allow_img_hotlink', 'n'),
(113, 1, 'sig_allow_img_upload', 'n'),
(114, 1, 'sig_img_url', '{base_url}images/signature_attachments/'),
(115, 1, 'sig_img_path', '{base_path}images/signature_attachments/'),
(116, 1, 'sig_img_max_width', '480'),
(117, 1, 'sig_img_max_height', '80'),
(118, 1, 'sig_img_max_kb', '30'),
(119, 1, 'prv_msg_enabled', 'y'),
(120, 1, 'prv_msg_allow_attachments', 'y'),
(121, 1, 'prv_msg_upload_path', '{base_path}images/pm_attachments/'),
(122, 1, 'prv_msg_max_attachments', '3'),
(123, 1, 'prv_msg_attach_maxsize', '250'),
(124, 1, 'prv_msg_attach_total', '100'),
(125, 1, 'prv_msg_html_format', 'safe'),
(126, 1, 'prv_msg_auto_links', 'y'),
(127, 1, 'prv_msg_max_chars', '6000'),
(128, 1, 'memberlist_order_by', 'member_id'),
(129, 1, 'memberlist_sort_order', 'desc'),
(130, 1, 'memberlist_row_limit', '20'),
(131, 1, 'site_404', ''),
(132, 1, 'save_tmpl_revisions', 'n'),
(133, 1, 'max_tmpl_revisions', '5'),
(134, 1, 'strict_urls', 'y'),
(135, 1, 'enable_template_routes', 'y'),
(136, 1, 'image_resize_protocol', 'gd2'),
(137, 1, 'image_library_path', ''),
(138, 1, 'word_separator', 'dash'),
(139, 1, 'use_category_name', 'n'),
(140, 1, 'reserved_category_word', 'category'),
(141, 1, 'auto_convert_high_ascii', 'n'),
(142, 1, 'new_posts_clear_caches', 'y'),
(143, 1, 'auto_assign_cat_parents', 'y'),
(144, 0, 'cache_driver', 'file'),
(145, 0, 'cookie_prefix', ''),
(146, 0, 'debug', '1'),
(147, 0, 'file_manager_compatibility_mode', 'n'),
(148, 0, 'is_system_on', 'y'),
(149, 0, 'cli_enabled', 'y'),
(150, 0, 'legacy_member_data', 'n'),
(151, 0, 'legacy_channel_data', 'n'),
(152, 0, 'legacy_category_field_data', 'n'),
(153, 0, 'enable_dock', 'y'),
(154, 0, 'enable_frontedit', 'y'),
(155, 0, 'automatic_frontedit_links', 'y'),
(156, 0, 'enable_mfa', 'y'),
(157, 0, 'autosave_interval_seconds', '10');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_consents`
--

CREATE TABLE `exp_consents` (
  `consent_id` int UNSIGNED NOT NULL,
  `consent_request_id` int UNSIGNED NOT NULL,
  `consent_request_version_id` int UNSIGNED NOT NULL,
  `member_id` int UNSIGNED NOT NULL,
  `request_copy` mediumtext COLLATE utf8mb4_unicode_ci,
  `request_format` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `consent_given` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `consent_given_via` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiration_date` int DEFAULT NULL,
  `response_date` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_consent_audit_log`
--

CREATE TABLE `exp_consent_audit_log` (
  `consent_audit_id` int UNSIGNED NOT NULL,
  `consent_request_id` int UNSIGNED NOT NULL,
  `consent_request_version_id` int UNSIGNED DEFAULT NULL,
  `member_id` int UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_consent_requests`
--

CREATE TABLE `exp_consent_requests` (
  `consent_request_id` int UNSIGNED NOT NULL,
  `consent_request_version_id` int UNSIGNED DEFAULT NULL,
  `user_created` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consent_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `double_opt_in` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `retention_period` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_consent_requests`
--

INSERT INTO `exp_consent_requests` (`consent_request_id`, `consent_request_version_id`, `user_created`, `title`, `consent_name`, `double_opt_in`, `retention_period`) VALUES
(1, 1, 'n', 'Functionality Cookies', 'ee:cookies_functionality', 'n', NULL),
(2, 2, 'n', 'Performance Cookies', 'ee:cookies_performance', 'n', NULL),
(3, 3, 'n', 'Targeting Cookies', 'ee:cookies_targeting', 'n', NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_consent_request_versions`
--

CREATE TABLE `exp_consent_request_versions` (
  `consent_request_version_id` int UNSIGNED NOT NULL,
  `consent_request_id` int UNSIGNED NOT NULL,
  `request` mediumtext COLLATE utf8mb4_unicode_ci,
  `request_format` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `create_date` int NOT NULL DEFAULT '0',
  `author_id` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_consent_request_versions`
--

INSERT INTO `exp_consent_request_versions` (`consent_request_version_id`, `consent_request_id`, `request`, `request_format`, `create_date`, `author_id`) VALUES
(1, 1, 'These cookies help us personalize content and functionality for you, including remembering changes you have made to parts of the website that you can customize, or selections for services made on previous visits. If you do not allow these cookies, some portions of our website may be less friendly and easy to use, forcing you to enter content or set your preferences on each visit.', 'none', 1710756332, 0),
(2, 2, 'These cookies allow us measure how visitors use our website, which pages are popular, and what our traffic sources are. This helps us improve how our website works and make it easier for all visitors to find what they are looking for. The information is aggregated and anonymous, and cannot be used to identify you. If you do not allow these cookies, we will be unable to use your visits to our website to help make improvements.', 'none', 1710756332, 0),
(3, 3, 'These cookies are usually placed by third-party advertising networks, which may use information about your website visits to develop a profile of your interests. This information may be shared with other advertisers and/or websites to deliver more relevant advertising to you across multiple websites. If you do not allow these cookies, visits to this website will not be shared with advertising partners and will not contribute to targeted advertising on other websites.', 'none', 1710756332, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_consent_request_version_cookies`
--

CREATE TABLE `exp_consent_request_version_cookies` (
  `consent_request_version_cookies_id` int UNSIGNED NOT NULL,
  `consent_request_version_id` int UNSIGNED NOT NULL,
  `cookie_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_content_types`
--

CREATE TABLE `exp_content_types` (
  `content_type_id` int UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_content_types`
--

INSERT INTO `exp_content_types` (`content_type_id`, `name`) VALUES
(2, 'channel'),
(1, 'grid');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_cookie_settings`
--

CREATE TABLE `exp_cookie_settings` (
  `cookie_id` int UNSIGNED NOT NULL,
  `cookie_provider` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_lifetime` int UNSIGNED DEFAULT NULL,
  `cookie_enforced_lifetime` int UNSIGNED DEFAULT NULL,
  `cookie_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_cookie_settings`
--

INSERT INTO `exp_cookie_settings` (`cookie_id`, `cookie_provider`, `cookie_name`, `cookie_lifetime`, `cookie_enforced_lifetime`, `cookie_title`, `cookie_description`) VALUES
(1, 'ee', 'csrf_token', 7200, NULL, 'CSRF Token', 'A security cookie used to identify the user and prevent Cross Site Request Forgery attacks.'),
(2, 'ee', 'flash', 0, NULL, 'Flash data', 'User feedback messages, encrypted for security.'),
(3, 'ee', 'remember', NULL, NULL, 'Remember Me', 'Determines whether a user is automatically logged in upon visiting the site.'),
(4, 'ee', 'sessionid', 3600, NULL, 'Session ID', 'Session id, used to associate a logged in user with their data.'),
(5, 'ee', 'visitor_consents', NULL, NULL, 'Visitor Consents', 'Saves responses to Consent requests for non-logged in visitors'),
(6, 'ee', 'last_activity', NULL, NULL, 'Last Activity', 'Records the time of the last page load. Used in in calculating active sessions.'),
(7, 'ee', 'last_visit', NULL, NULL, 'Last Visit', 'Date of the user’s last visit, based on the last_activity cookie. Can be shown as a statistic for members and used by forum and comments to show unread topics for both members and guests.'),
(8, 'ee', 'anon', NULL, NULL, 'Anonymize', 'Determines whether the user’s username is displayed in the list of currently logged in members.'),
(9, 'ee', 'tracker', 0, NULL, 'Tracker', 'Contains the last 5 pages viewed, encrypted for security. Typically used for form or error message returns.'),
(10, 'cp', 'viewtype', NULL, NULL, 'Filemanager View Type', 'Determines View Type to be used in Filemanager (table or thumbs view)'),
(11, 'cp', 'cp_last_site_id', NULL, NULL, 'CP Last Site ID', 'MSM cookie indicating the last site accessed in the Control Panel.'),
(12, 'cp', 'ee_cp_viewmode', NULL, NULL, 'CP View Mode', 'Determines view mode for the Control Panel.'),
(13, 'cp', 'secondary_sidebar', NULL, NULL, 'Secondary Sidebar State', 'Determines whether secondary navigation sidebar in the Control Panel should be collapsed for each corresponding section.'),
(14, 'cp', 'collapsed_nav', NULL, NULL, 'Collapsed Navigation', 'Determines whether navigation sidebar in the Control Panel should be collapsed.'),
(15, 'pro', 'frontedit', NULL, NULL, 'Front-end editing', 'Determines whether ExpressioEngine front-end editing features should be enabled.'),
(16, 'comment', 'my_email', NULL, NULL, 'My email', 'Email address specified when posting a comment.'),
(17, 'comment', 'my_location', NULL, NULL, 'My location', 'Location specified when posting a comment.'),
(18, 'comment', 'my_name', NULL, NULL, 'My name', 'Name specified when posting a comment.'),
(19, 'comment', 'my_url', NULL, NULL, 'My URL', 'URL specified when posting a comment.'),
(20, 'comment', 'notify_me', NULL, NULL, 'Notify me', 'If set to ‘yes’, notifications will be sent to the saved email address when new comments are made.'),
(21, 'comment', 'save_info', NULL, NULL, 'Save info', 'If set to ‘yes’, allows additional cookies (my_email, my_location, my_name, my_url) to store guest user information for use when filling out comment forms. This cookie is only set if you submit a comment.');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_cp_log`
--

CREATE TABLE `exp_cp_log` (
  `id` int NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int UNSIGNED NOT NULL,
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `act_date` int NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_cp_log`
--

INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES
(1, 1, 1, 'Admin', '127.0.0.1', 1710756360, 'Logged in');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_dashboard_layouts`
--

CREATE TABLE `exp_dashboard_layouts` (
  `layout_id` int UNSIGNED NOT NULL,
  `member_id` int UNSIGNED DEFAULT NULL,
  `role_id` int UNSIGNED DEFAULT NULL,
  `order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_dashboard_layout_widgets`
--

CREATE TABLE `exp_dashboard_layout_widgets` (
  `dashboard_layout_widgets_id` int UNSIGNED NOT NULL,
  `layout_id` int UNSIGNED NOT NULL,
  `widget_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_dashboard_widgets`
--

CREATE TABLE `exp_dashboard_widgets` (
  `widget_id` int UNSIGNED NOT NULL,
  `widget_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `widget_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `widget_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_source` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_dashboard_widgets`
--

INSERT INTO `exp_dashboard_widgets` (`widget_id`, `widget_name`, `widget_data`, `widget_type`, `widget_source`, `widget_file`) VALUES
(1, NULL, NULL, 'php', 'pro', 'comments'),
(2, NULL, NULL, 'php', 'pro', 'eecms_news'),
(3, NULL, NULL, 'php', 'pro', 'members'),
(4, NULL, NULL, 'php', 'pro', 'recent_entries'),
(5, NULL, NULL, 'php', 'pro', 'recent_templates'),
(6, NULL, NULL, 'html', 'pro', 'support');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_developer_log`
--

CREATE TABLE `exp_developer_log` (
  `log_id` int UNSIGNED NOT NULL,
  `timestamp` int UNSIGNED NOT NULL,
  `viewed` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `description` text COLLATE utf8mb4_unicode_ci,
  `function` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line` int UNSIGNED DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deprecated_since` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_instead` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_id` int UNSIGNED NOT NULL DEFAULT '0',
  `template_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_group` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_module` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snippets` text COLLATE utf8mb4_unicode_ci,
  `hash` char(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_docks`
--

CREATE TABLE `exp_docks` (
  `dock_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_docks`
--

INSERT INTO `exp_docks` (`dock_id`, `site_id`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_dock_prolets`
--

CREATE TABLE `exp_dock_prolets` (
  `dock_prolets_id` int UNSIGNED NOT NULL,
  `dock_id` int UNSIGNED NOT NULL,
  `prolet_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_dock_prolets`
--

INSERT INTO `exp_dock_prolets` (`dock_prolets_id`, `dock_id`, `prolet_id`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_email_cache`
--

CREATE TABLE `exp_email_cache` (
  `cache_id` int UNSIGNED NOT NULL,
  `cache_date` int UNSIGNED NOT NULL DEFAULT '0',
  `total_sent` int UNSIGNED NOT NULL,
  `from_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bcc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_array` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `plaintext_alt` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailtype` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wordwrap` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `attachments` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_email_cache_mg`
--

CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int UNSIGNED NOT NULL,
  `role_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_email_cache_ml`
--

CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int UNSIGNED NOT NULL,
  `list_id` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_email_console_cache`
--

CREATE TABLE `exp_email_console_cache` (
  `cache_id` int UNSIGNED NOT NULL,
  `cache_date` int UNSIGNED NOT NULL DEFAULT '0',
  `member_id` int UNSIGNED NOT NULL,
  `member_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `recipient` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_entry_manager_views`
--

CREATE TABLE `exp_entry_manager_views` (
  `view_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `member_id` int UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `columns` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_entry_versioning`
--

CREATE TABLE `exp_entry_versioning` (
  `version_id` int UNSIGNED NOT NULL,
  `entry_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `author_id` int UNSIGNED NOT NULL,
  `version_date` int NOT NULL,
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_extensions`
--

CREATE TABLE `exp_extensions` (
  `extension_id` int UNSIGNED NOT NULL,
  `class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hook` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '10',
  `version` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_extensions`
--

INSERT INTO `exp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`) VALUES
(1, 'Comment_ext', 'addCommentMenu', 'cp_custom_menu', 'a:0:{}', 10, '2.3.3', 'y');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_fieldtypes`
--

CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `has_global_settings` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_fieldtypes`
--

INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES
(1, 'select', '1.0.0', 'YTowOnt9', 'n'),
(2, 'text', '1.0.0', 'YTowOnt9', 'n'),
(3, 'number', '1.0.0', 'YTowOnt9', 'n'),
(4, 'textarea', '1.0.0', 'YTowOnt9', 'n'),
(5, 'date', '1.0.0', 'YTowOnt9', 'n'),
(6, 'duration', '1.0.0', 'YTowOnt9', 'n'),
(7, 'email_address', '1.0.0', 'YTowOnt9', 'n'),
(8, 'file', '1.1.0', 'YTowOnt9', 'n'),
(9, 'fluid_field', '1.0.0', 'YTowOnt9', 'n'),
(10, 'grid', '1.0.0', 'YTowOnt9', 'n'),
(11, 'file_grid', '1.0.0', 'YTowOnt9', 'n'),
(12, 'multi_select', '1.0.0', 'YTowOnt9', 'n'),
(13, 'checkboxes', '1.0.0', 'YTowOnt9', 'n'),
(14, 'radio', '1.0.0', 'YTowOnt9', 'n'),
(15, 'relationship', '1.0.0', 'YTowOnt9', 'n'),
(16, 'rte', '2.2.0', 'YTowOnt9', 'n'),
(17, 'slider', '1.0.0', 'YTowOnt9', 'n'),
(18, 'range_slider', '1.0.0', 'YTowOnt9', 'n'),
(19, 'toggle', '1.0.0', 'YTowOnt9', 'n'),
(20, 'url', '1.0.0', 'YTowOnt9', 'n'),
(21, 'colorpicker', '1.0.0', 'YTowOnt9', 'n'),
(22, 'selectable_buttons', '1.0.0', 'YTowOnt9', 'n'),
(23, 'notes', '1.0.0', 'YTowOnt9', 'n'),
(24, 'member', '2.4.0', 'YTowOnt9', 'n');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_field_conditions`
--

CREATE TABLE `exp_field_conditions` (
  `condition_id` int UNSIGNED NOT NULL,
  `condition_set_id` int UNSIGNED NOT NULL,
  `condition_field_id` int UNSIGNED NOT NULL,
  `evaluation_rule` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_field_condition_sets`
--

CREATE TABLE `exp_field_condition_sets` (
  `condition_set_id` int UNSIGNED NOT NULL,
  `match` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `order` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_field_condition_sets_channel_fields`
--

CREATE TABLE `exp_field_condition_sets_channel_fields` (
  `condition_set_id` int UNSIGNED NOT NULL,
  `field_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_field_groups`
--

CREATE TABLE `exp_field_groups` (
  `group_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_files`
--

CREATE TABLE `exp_files` (
  `file_id` int UNSIGNED NOT NULL,
  `model_type` enum('File','Directory') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'File',
  `site_id` int UNSIGNED DEFAULT '1',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_location_id` int UNSIGNED DEFAULT '0',
  `directory_id` int UNSIGNED DEFAULT '0',
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` int DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `credit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploaded_by_member_id` int UNSIGNED DEFAULT '0',
  `upload_date` int DEFAULT NULL,
  `modified_by_member_id` int UNSIGNED DEFAULT '0',
  `modified_date` int DEFAULT NULL,
  `file_hw_original` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `total_records` int UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_file_categories`
--

CREATE TABLE `exp_file_categories` (
  `file_id` int UNSIGNED NOT NULL,
  `cat_id` int UNSIGNED NOT NULL,
  `sort` int UNSIGNED DEFAULT '0',
  `is_cover` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_file_data`
--

CREATE TABLE `exp_file_data` (
  `file_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_file_dimensions`
--

CREATE TABLE `exp_file_dimensions` (
  `id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `upload_location_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `resize_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `width` int DEFAULT '0',
  `height` int DEFAULT '0',
  `quality` tinyint UNSIGNED DEFAULT '90',
  `watermark_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_file_manager_views`
--

CREATE TABLE `exp_file_manager_views` (
  `view_id` int UNSIGNED NOT NULL,
  `viewtype` varchar(10) NOT NULL DEFAULT 'list',
  `upload_id` int UNSIGNED NOT NULL,
  `member_id` int UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `columns` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_file_usage`
--

CREATE TABLE `exp_file_usage` (
  `file_usage_id` int UNSIGNED NOT NULL,
  `file_id` int UNSIGNED NOT NULL,
  `entry_id` int UNSIGNED NOT NULL DEFAULT '0',
  `cat_id` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_file_watermarks`
--

CREATE TABLE `exp_file_watermarks` (
  `wm_id` int UNSIGNED NOT NULL,
  `wm_name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `wm_image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_test_image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_use_font` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  `wm_font` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_font_size` int UNSIGNED DEFAULT NULL,
  `wm_text` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'top',
  `wm_hor_alignment` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'left',
  `wm_padding` int UNSIGNED DEFAULT NULL,
  `wm_opacity` int UNSIGNED DEFAULT NULL,
  `wm_hor_offset` int UNSIGNED DEFAULT NULL,
  `wm_vrt_offset` int UNSIGNED DEFAULT NULL,
  `wm_x_transp` int DEFAULT NULL,
  `wm_y_transp` int DEFAULT NULL,
  `wm_font_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_use_drop_shadow` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  `wm_shadow_distance` int UNSIGNED DEFAULT NULL,
  `wm_shadow_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_fluid_field_data`
--

CREATE TABLE `exp_fluid_field_data` (
  `id` int UNSIGNED NOT NULL,
  `fluid_field_id` int UNSIGNED NOT NULL,
  `entry_id` int UNSIGNED NOT NULL,
  `field_id` int UNSIGNED NOT NULL,
  `field_data_id` int UNSIGNED NOT NULL,
  `field_group_id` int UNSIGNED DEFAULT NULL,
  `order` int UNSIGNED NOT NULL DEFAULT '0',
  `group` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_global_variables`
--

CREATE TABLE `exp_global_variables` (
  `variable_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `variable_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variable_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `edit_date` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_grid_columns`
--

CREATE TABLE `exp_grid_columns` (
  `col_id` int UNSIGNED NOT NULL,
  `field_id` int UNSIGNED DEFAULT NULL,
  `content_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_order` int UNSIGNED DEFAULT NULL,
  `col_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_instructions` text COLLATE utf8mb4_unicode_ci,
  `col_required` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_search` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_width` int UNSIGNED DEFAULT NULL,
  `col_settings` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_html_buttons`
--

CREATE TABLE `exp_html_buttons` (
  `id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int NOT NULL DEFAULT '0',
  `tag_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_open` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_close` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accesskey` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_order` int UNSIGNED NOT NULL,
  `tag_row` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `classname` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_html_buttons`
--

INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`) VALUES
(1, 1, 0, 'html_btn_bold', '<strong>', '</strong>', 'b', 1, '1', 'html-bold'),
(2, 1, 0, 'html_btn_italic', '<em>', '</em>', 'i', 2, '1', 'html-italic'),
(3, 1, 0, 'html_btn_blockquote', '<blockquote>', '</blockquote>', 'q', 3, '1', 'html-quote'),
(4, 1, 0, 'html_btn_anchor', '<a href=\"[![Link:!:http://]!]\"(!( title=\"[![Title]!]\")!)>', '</a>', 'k', 4, '1', 'html-link'),
(5, 1, 0, 'html_btn_picture', '<img src=\"[![Link:!:http://]!]\" alt=\"\" height=\"\" width=\"\">', '', '', 5, '1', 'html-upload');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_layout_publish`
--

CREATE TABLE `exp_layout_publish` (
  `layout_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int UNSIGNED NOT NULL DEFAULT '0',
  `layout_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_layout` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_layout_publish_member_roles`
--

CREATE TABLE `exp_layout_publish_member_roles` (
  `layout_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_members`
--

CREATE TABLE `exp_members` (
  `member_id` int UNSIGNED NOT NULL,
  `role_id` int NOT NULL DEFAULT '0',
  `pending_role_id` int NOT NULL DEFAULT '0',
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `screen_name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `unique_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crypt_key` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `backup_mfa_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` text COLLATE utf8mb4_unicode_ci,
  `avatar_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_width` int UNSIGNED DEFAULT NULL,
  `avatar_height` int UNSIGNED DEFAULT NULL,
  `photo_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_width` int UNSIGNED DEFAULT NULL,
  `photo_height` int UNSIGNED DEFAULT NULL,
  `sig_img_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sig_img_width` int UNSIGNED DEFAULT NULL,
  `sig_img_height` int UNSIGNED DEFAULT NULL,
  `ignore_list` text COLLATE utf8mb4_unicode_ci,
  `private_messages` int UNSIGNED NOT NULL DEFAULT '0',
  `accept_messages` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `last_view_bulletins` int NOT NULL DEFAULT '0',
  `last_bulletin_date` int NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `join_date` int UNSIGNED NOT NULL DEFAULT '0',
  `last_visit` int UNSIGNED NOT NULL DEFAULT '0',
  `last_activity` int UNSIGNED NOT NULL DEFAULT '0',
  `total_entries` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `total_comments` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint NOT NULL DEFAULT '0',
  `last_entry_date` int UNSIGNED NOT NULL DEFAULT '0',
  `last_comment_date` int UNSIGNED NOT NULL DEFAULT '0',
  `last_forum_post_date` int UNSIGNED NOT NULL DEFAULT '0',
  `last_email_date` int UNSIGNED NOT NULL DEFAULT '0',
  `in_authorlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `display_signatures` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `language` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_format` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `week_start` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `include_seconds` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_theme` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forum_theme` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker` text COLLATE utf8mb4_unicode_ci,
  `template_size` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '28',
  `notepad` text COLLATE utf8mb4_unicode_ci,
  `notepad_size` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '18',
  `bookmarklets` text COLLATE utf8mb4_unicode_ci,
  `quick_links` text COLLATE utf8mb4_unicode_ci,
  `quick_tabs` text COLLATE utf8mb4_unicode_ci,
  `show_sidebar` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `pmember_id` int NOT NULL DEFAULT '0',
  `cp_homepage` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_homepage_channel` text COLLATE utf8mb4_unicode_ci,
  `cp_homepage_custom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dismissed_banner` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `enable_mfa` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_members`
--

INSERT INTO `exp_members` (`member_id`, `role_id`, `pending_role_id`, `username`, `screen_name`, `password`, `salt`, `unique_id`, `crypt_key`, `backup_mfa_code`, `authcode`, `email`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `time_format`, `date_format`, `week_start`, `include_seconds`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `bookmarklets`, `quick_links`, `quick_tabs`, `show_sidebar`, `pmember_id`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`, `dismissed_banner`, `enable_mfa`) VALUES
(1, 1, 0, 'Admin', 'Admin', '$2y$10$o5BZ4gOYbLFSBG0VDcrioOPiDGZVJJvJfl.H5GVP/v1JkxBrEsjXe', '', 'c6649b2d8177a05bd9cf0e3e9b636d9b221dd91b', 'e9d6cda070e5d794fcbf856a0ca4be3ccac3e554', NULL, NULL, 'systeem@dunique.nl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '127.0.0.1', 1710756332, 1710756360, 1710757362, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, '', NULL, 'n', 0, NULL, NULL, NULL, 'y', 'n');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_members_roles`
--

CREATE TABLE `exp_members_roles` (
  `member_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_members_roles`
--

INSERT INTO `exp_members_roles` (`member_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_members_role_groups`
--

CREATE TABLE `exp_members_role_groups` (
  `member_id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_member_bulletin_board`
--

CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int UNSIGNED NOT NULL,
  `sender_id` int UNSIGNED NOT NULL,
  `bulletin_group` int UNSIGNED NOT NULL,
  `bulletin_date` int UNSIGNED NOT NULL,
  `hash` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bulletin_expires` int UNSIGNED NOT NULL DEFAULT '0',
  `bulletin_message` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_member_data`
--

CREATE TABLE `exp_member_data` (
  `member_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_member_data`
--

INSERT INTO `exp_member_data` (`member_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_member_fields`
--

CREATE TABLE `exp_member_fields` (
  `m_field_id` int UNSIGNED NOT NULL,
  `m_field_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `m_field_list_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_ta_rows` tinyint DEFAULT '8',
  `m_field_maxl` smallint DEFAULT NULL,
  `m_field_width` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m_field_search` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_public` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `m_field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_exclude_from_anon` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_order` int UNSIGNED DEFAULT NULL,
  `m_field_text_direction` char(3) COLLATE utf8mb4_unicode_ci DEFAULT 'ltr',
  `m_field_settings` text COLLATE utf8mb4_unicode_ci,
  `m_legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_member_manager_views`
--

CREATE TABLE `exp_member_manager_views` (
  `view_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  `member_id` int UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `columns` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_member_news_views`
--

CREATE TABLE `exp_member_news_views` (
  `news_id` int UNSIGNED NOT NULL,
  `version` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_member_news_views`
--

INSERT INTO `exp_member_news_views` (`news_id`, `version`, `member_id`) VALUES
(1, '7.4.4', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_member_relationships`
--

CREATE TABLE `exp_member_relationships` (
  `relationship_id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0',
  `child_id` int UNSIGNED NOT NULL DEFAULT '0',
  `field_id` int UNSIGNED NOT NULL DEFAULT '0',
  `fluid_field_data_id` int UNSIGNED NOT NULL DEFAULT '0',
  `grid_field_id` int UNSIGNED NOT NULL DEFAULT '0',
  `grid_col_id` int UNSIGNED NOT NULL DEFAULT '0',
  `grid_row_id` int UNSIGNED NOT NULL DEFAULT '0',
  `order` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_member_search`
--

CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `search_date` int UNSIGNED NOT NULL,
  `keywords` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fields` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total_results` int UNSIGNED NOT NULL,
  `query` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_menu_items`
--

CREATE TABLE `exp_menu_items` (
  `item_id` int UNSIGNED NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `set_id` int DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_menu_sets`
--

CREATE TABLE `exp_menu_sets` (
  `set_id` int UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_menu_sets`
--

INSERT INTO `exp_menu_sets` (`set_id`, `name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_message_attachments`
--

CREATE TABLE `exp_message_attachments` (
  `attachment_id` int UNSIGNED NOT NULL,
  `sender_id` int UNSIGNED NOT NULL DEFAULT '0',
  `message_id` int UNSIGNED NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_location` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_date` int UNSIGNED NOT NULL DEFAULT '0',
  `attachment_size` int UNSIGNED NOT NULL DEFAULT '0',
  `is_temp` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_message_copies`
--

CREATE TABLE `exp_message_copies` (
  `copy_id` int UNSIGNED NOT NULL,
  `message_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sender_id` int UNSIGNED NOT NULL DEFAULT '0',
  `recipient_id` int UNSIGNED NOT NULL DEFAULT '0',
  `message_received` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_read` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_time_read` int UNSIGNED NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_folder` int UNSIGNED NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_deleted` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_message_data`
--

CREATE TABLE `exp_message_data` (
  `message_id` int UNSIGNED NOT NULL,
  `sender_id` int UNSIGNED NOT NULL DEFAULT '0',
  `message_date` int UNSIGNED NOT NULL DEFAULT '0',
  `message_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_tracking` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `message_attachments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_cc` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_hide_cc` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `total_recipients` int UNSIGNED NOT NULL DEFAULT '0',
  `message_status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_message_folders`
--

CREATE TABLE `exp_message_folders` (
  `member_id` int UNSIGNED NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder4_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder5_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder6_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder7_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder8_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder9_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder10_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_message_listed`
--

CREATE TABLE `exp_message_listed` (
  `listed_id` int UNSIGNED NOT NULL,
  `member_id` int UNSIGNED NOT NULL DEFAULT '0',
  `listed_member` int UNSIGNED NOT NULL DEFAULT '0',
  `listed_description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `listed_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'blocked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_migrations`
--

CREATE TABLE `exp_migrations` (
  `migration_id` int UNSIGNED NOT NULL,
  `migration` text COLLATE utf8mb4_unicode_ci,
  `migration_location` text COLLATE utf8mb4_unicode_ci,
  `migration_group` int UNSIGNED DEFAULT NULL,
  `migration_run_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_modules`
--

CREATE TABLE `exp_modules` (
  `module_id` int UNSIGNED NOT NULL,
  `module_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_cp_backend` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_modules`
--

INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES
(1, 'Channel', '2.1.1', 'n', 'n'),
(2, 'Comment', '2.3.3', 'y', 'n'),
(3, 'Consent', '1.0.0', 'n', 'n'),
(4, 'Member', '2.4.0', 'n', 'n'),
(5, 'Stats', '2.2.0', 'n', 'n'),
(6, 'Rte', '2.2.0', 'y', 'n'),
(7, 'File', '1.1.0', 'n', 'n'),
(8, 'Filepicker', '1.0', 'y', 'n'),
(9, 'Relationship', '1.0.0', 'n', 'n'),
(10, 'Search', '2.3.0', 'n', 'n'),
(11, 'Pro', '2.1.0', 'n', 'n');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_module_member_roles`
--

CREATE TABLE `exp_module_member_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `module_id` mediumint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_online_users`
--

CREATE TABLE `exp_online_users` (
  `online_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int NOT NULL DEFAULT '0',
  `in_forum` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `date` int UNSIGNED NOT NULL DEFAULT '0',
  `anon` char(1) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_password_lockout`
--

CREATE TABLE `exp_password_lockout` (
  `lockout_id` int UNSIGNED NOT NULL,
  `login_date` int UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_permissions`
--

CREATE TABLE `exp_permissions` (
  `permission_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL,
  `permission` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_permissions`
--

INSERT INTO `exp_permissions` (`permission_id`, `role_id`, `site_id`, `permission`) VALUES
(1, 1, 1, 'can_view_offline_system'),
(2, 1, 1, 'can_access_cp'),
(3, 1, 1, 'can_access_dock'),
(4, 1, 1, 'can_access_footer_report_bug'),
(5, 1, 1, 'can_access_footer_new_ticket'),
(6, 1, 1, 'can_access_footer_user_guide'),
(7, 1, 1, 'can_view_homepage_news'),
(8, 1, 1, 'can_upload_new_files'),
(9, 1, 1, 'can_edit_files'),
(10, 1, 1, 'can_delete_files'),
(11, 1, 1, 'can_upload_new_toolsets'),
(12, 1, 1, 'can_edit_toolsets'),
(13, 1, 1, 'can_delete_toolsets'),
(14, 1, 1, 'can_create_upload_directories'),
(15, 1, 1, 'can_edit_upload_directories'),
(16, 1, 1, 'can_delete_upload_directories'),
(17, 1, 1, 'can_access_files'),
(18, 1, 1, 'can_access_design'),
(19, 1, 1, 'can_access_addons'),
(20, 1, 1, 'can_access_members'),
(21, 1, 1, 'can_access_sys_prefs'),
(22, 1, 1, 'can_access_comm'),
(23, 1, 1, 'can_access_utilities'),
(24, 1, 1, 'can_access_data'),
(25, 1, 1, 'can_access_logs'),
(26, 1, 1, 'can_admin_channels'),
(27, 1, 1, 'can_create_channels'),
(28, 1, 1, 'can_edit_channels'),
(29, 1, 1, 'can_delete_channels'),
(30, 1, 1, 'can_create_channel_fields'),
(31, 1, 1, 'can_edit_channel_fields'),
(32, 1, 1, 'can_delete_channel_fields'),
(33, 1, 1, 'can_create_statuses'),
(34, 1, 1, 'can_delete_statuses'),
(35, 1, 1, 'can_edit_statuses'),
(36, 1, 1, 'can_create_categories'),
(37, 1, 1, 'can_create_roles'),
(38, 1, 1, 'can_delete_roles'),
(39, 1, 1, 'can_edit_roles'),
(40, 1, 1, 'can_admin_design'),
(41, 1, 1, 'can_create_members'),
(42, 1, 1, 'can_edit_members'),
(43, 1, 1, 'can_delete_members'),
(44, 1, 1, 'can_admin_roles'),
(45, 1, 1, 'can_admin_mbr_templates'),
(46, 1, 1, 'can_ban_users'),
(47, 1, 1, 'can_admin_addons'),
(48, 1, 1, 'can_create_templates'),
(49, 1, 1, 'can_edit_templates'),
(50, 1, 1, 'can_delete_templates'),
(51, 1, 1, 'can_create_template_groups'),
(52, 1, 1, 'can_edit_template_groups'),
(53, 1, 1, 'can_delete_template_groups'),
(54, 1, 1, 'can_create_template_partials'),
(55, 1, 1, 'can_edit_template_partials'),
(56, 1, 1, 'can_delete_template_partials'),
(57, 1, 1, 'can_create_template_variables'),
(58, 1, 1, 'can_delete_template_variables'),
(59, 1, 1, 'can_edit_template_variables'),
(60, 1, 1, 'can_edit_categories'),
(61, 1, 1, 'can_delete_categories'),
(62, 1, 1, 'can_view_other_entries'),
(63, 1, 1, 'can_edit_other_entries'),
(64, 1, 1, 'can_assign_post_authors'),
(65, 1, 1, 'can_delete_self_entries'),
(66, 1, 1, 'can_delete_all_entries'),
(67, 1, 1, 'can_view_other_comments'),
(68, 1, 1, 'can_edit_own_comments'),
(69, 1, 1, 'can_delete_own_comments'),
(70, 1, 1, 'can_edit_all_comments'),
(71, 1, 1, 'can_delete_all_comments'),
(72, 1, 1, 'can_moderate_comments'),
(73, 1, 1, 'can_send_cached_email'),
(74, 1, 1, 'can_email_roles'),
(75, 1, 1, 'can_email_from_profile'),
(76, 1, 1, 'can_view_profiles'),
(77, 1, 1, 'can_edit_html_buttons'),
(78, 1, 1, 'can_post_comments'),
(79, 1, 1, 'can_delete_self'),
(80, 1, 1, 'can_send_private_messages'),
(81, 1, 1, 'can_attach_in_private_messages'),
(82, 1, 1, 'can_send_bulletins'),
(83, 1, 1, 'can_search'),
(84, 1, 1, 'can_create_entries'),
(85, 1, 1, 'can_edit_self_entries'),
(86, 1, 1, 'can_access_security_settings'),
(87, 1, 1, 'can_access_translate'),
(88, 1, 1, 'can_access_import'),
(89, 1, 1, 'can_access_sql_manager'),
(90, 1, 1, 'can_moderate_spam'),
(91, 1, 1, 'can_manage_consents'),
(92, 3, 1, 'can_view_online_system'),
(93, 4, 1, 'can_view_online_system'),
(94, 5, 1, 'can_view_online_system'),
(95, 5, 1, 'can_email_from_profile'),
(96, 5, 1, 'can_view_profiles'),
(97, 5, 1, 'can_edit_html_buttons'),
(98, 5, 1, 'can_delete_self'),
(99, 5, 1, 'can_send_private_messages'),
(100, 5, 1, 'can_attach_in_private_messages');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_plugins`
--

CREATE TABLE `exp_plugins` (
  `plugin_id` int UNSIGNED NOT NULL,
  `plugin_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_package` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_typography_related` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_plugins`
--

INSERT INTO `exp_plugins` (`plugin_id`, `plugin_name`, `plugin_package`, `plugin_version`, `is_typography_related`) VALUES
(1, 'MixEEr', 'mix', '2.0.0', 'n');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_prolets`
--

CREATE TABLE `exp_prolets` (
  `prolet_id` int UNSIGNED NOT NULL,
  `source` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_prolets`
--

INSERT INTO `exp_prolets` (`prolet_id`, `source`, `class`) VALUES
(1, 'channel', 'Channel_pro'),
(2, 'pro', 'Entries_pro');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_relationships`
--

CREATE TABLE `exp_relationships` (
  `relationship_id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0',
  `child_id` int UNSIGNED NOT NULL DEFAULT '0',
  `field_id` int UNSIGNED NOT NULL DEFAULT '0',
  `fluid_field_data_id` int UNSIGNED NOT NULL DEFAULT '0',
  `grid_field_id` int UNSIGNED NOT NULL DEFAULT '0',
  `grid_col_id` int UNSIGNED NOT NULL DEFAULT '0',
  `grid_row_id` int UNSIGNED NOT NULL DEFAULT '0',
  `order` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_remember_me`
--

CREATE TABLE `exp_remember_me` (
  `remember_me_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int DEFAULT '1',
  `expiration` int DEFAULT '0',
  `last_refresh` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_reset_password`
--

CREATE TABLE `exp_reset_password` (
  `reset_id` int UNSIGNED NOT NULL,
  `member_id` int UNSIGNED NOT NULL,
  `resetcode` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_revision_tracker`
--

CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int UNSIGNED NOT NULL,
  `item_id` int UNSIGNED NOT NULL,
  `item_table` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_field` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_date` int NOT NULL,
  `item_author_id` int UNSIGNED NOT NULL,
  `item_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_revision_tracker`
--

INSERT INTO `exp_revision_tracker` (`tracker_id`, `item_id`, `item_table`, `item_field`, `item_date`, `item_author_id`, `item_data`) VALUES
(1, 5, 'exp_templates', 'template_data', 1710757282, 1, ''),
(2, 6, 'exp_templates', 'template_data', 1710757282, 1, ''),
(3, 7, 'exp_templates', 'template_data', 1710757282, 1, '');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_roles`
--

CREATE TABLE `exp_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `site_color` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `total_members` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `is_locked` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `highlight` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_roles`
--

INSERT INTO `exp_roles` (`role_id`, `name`, `short_name`, `description`, `site_color`, `total_members`, `is_locked`, `highlight`) VALUES
(1, 'Super Admin', 'super_admin', NULL, '', 0, 'y', ''),
(2, 'Banned', 'banned', NULL, '', 0, 'n', ''),
(3, 'Guests', 'guests', NULL, '', 0, 'n', ''),
(4, 'Pending', 'pending', NULL, '', 0, 'n', ''),
(5, 'Members', 'members', NULL, '', 0, 'n', '');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_roles_role_groups`
--

CREATE TABLE `exp_roles_role_groups` (
  `role_id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_role_groups`
--

CREATE TABLE `exp_role_groups` (
  `group_id` int UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_role_settings`
--

CREATE TABLE `exp_role_settings` (
  `id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `menu_set_id` int UNSIGNED NOT NULL DEFAULT '1',
  `mbr_delete_notify_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exclude_from_moderation` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint UNSIGNED NOT NULL,
  `prv_msg_send_limit` smallint UNSIGNED NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint UNSIGNED NOT NULL DEFAULT '60',
  `include_in_authorlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `cp_homepage` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_homepage_channel` int UNSIGNED NOT NULL DEFAULT '0',
  `cp_homepage_custom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `require_mfa` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `show_field_names` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_role_settings`
--

INSERT INTO `exp_role_settings` (`id`, `role_id`, `site_id`, `menu_set_id`, `mbr_delete_notify_emails`, `exclude_from_moderation`, `search_flood_control`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `include_in_authorlist`, `include_in_memberlist`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`, `require_mfa`, `show_field_names`) VALUES
(1, 1, 1, 1, NULL, 'y', 0, 20, 60, 'y', 'y', NULL, 0, NULL, 'n', 'y'),
(2, 2, 1, 1, NULL, 'n', 60, 20, 60, 'n', 'n', NULL, 0, NULL, 'n', 'y'),
(3, 3, 1, 1, NULL, 'n', 10, 20, 60, 'n', 'y', NULL, 0, NULL, 'n', 'y'),
(4, 4, 1, 1, NULL, 'n', 10, 20, 60, 'n', 'y', NULL, 0, NULL, 'n', 'y'),
(5, 5, 1, 1, NULL, 'n', 10, 20, 60, 'n', 'y', NULL, 0, NULL, 'n', 'y');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_rte_toolsets`
--

CREATE TABLE `exp_rte_toolsets` (
  `toolset_id` int UNSIGNED NOT NULL,
  `toolset_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `toolset_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_rte_toolsets`
--

INSERT INTO `exp_rte_toolsets` (`toolset_id`, `toolset_name`, `toolset_type`, `settings`) VALUES
(1, 'CKEditor Basic', 'ckeditor', 'YTo1OntzOjQ6InR5cGUiO3M6ODoiY2tlZGl0b3IiO3M6NzoidG9vbGJhciI7YTo2OntpOjA7czo0OiJib2xkIjtpOjE7czo2OiJpdGFsaWMiO2k6MjtzOjk6InVuZGVybGluZSI7aTozO3M6MTI6Im51bWJlcmVkTGlzdCI7aTo0O3M6MTI6ImJ1bGxldGVkTGlzdCI7aTo1O3M6NDoibGluayI7fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czoxMDoidXBsb2FkX2RpciI7czozOiJhbGwiO3M6MTA6Im1lZGlhRW1iZWQiO2E6MTp7czoxNDoicHJldmlld3NJbkRhdGEiO2I6MTt9fQ=='),
(2, 'CKEditor Full', 'ckeditor', 'YTo1OntzOjQ6InR5cGUiO3M6ODoiY2tlZGl0b3IiO3M6NzoidG9vbGJhciI7YTozMzp7aTowO3M6NDoiYm9sZCI7aToxO3M6NjoiaXRhbGljIjtpOjI7czoxMzoic3RyaWtldGhyb3VnaCI7aTozO3M6OToidW5kZXJsaW5lIjtpOjQ7czo5OiJzdWJzY3JpcHQiO2k6NTtzOjExOiJzdXBlcnNjcmlwdCI7aTo2O3M6MTA6ImJsb2NrcXVvdGUiO2k6NztzOjQ6ImNvZGUiO2k6ODtzOjk6ImNvZGVCbG9jayI7aTo5O3M6NzoiaGVhZGluZyI7aToxMDtzOjEyOiJyZW1vdmVGb3JtYXQiO2k6MTE7czo0OiJ1bmRvIjtpOjEyO3M6NDoicmVkbyI7aToxMztzOjEyOiJudW1iZXJlZExpc3QiO2k6MTQ7czoxMjoiYnVsbGV0ZWRMaXN0IjtpOjE1O3M6Nzoib3V0ZGVudCI7aToxNjtzOjY6ImluZGVudCI7aToxNztzOjQ6ImxpbmsiO2k6MTg7czoxMToiZmlsZW1hbmFnZXIiO2k6MTk7czoxMToiaW5zZXJ0VGFibGUiO2k6MjA7czoxMDoibWVkaWFFbWJlZCI7aToyMTtzOjk6Imh0bWxFbWJlZCI7aToyMjtzOjE0OiJhbGlnbm1lbnQ6bGVmdCI7aToyMztzOjE1OiJhbGlnbm1lbnQ6cmlnaHQiO2k6MjQ7czoxNjoiYWxpZ25tZW50OmNlbnRlciI7aToyNTtzOjE3OiJhbGlnbm1lbnQ6anVzdGlmeSI7aToyNjtzOjE0OiJob3Jpem9udGFsTGluZSI7aToyNztzOjE3OiJzcGVjaWFsQ2hhcmFjdGVycyI7aToyODtzOjg6InJlYWRNb3JlIjtpOjI5O3M6OToiZm9udENvbG9yIjtpOjMwO3M6MTk6ImZvbnRCYWNrZ3JvdW5kQ29sb3IiO2k6MzE7czoxMDoic2hvd0Jsb2NrcyI7aTozMjtzOjEzOiJzb3VyY2VFZGl0aW5nIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjEwOiJ1cGxvYWRfZGlyIjtzOjM6ImFsbCI7czoxMDoibWVkaWFFbWJlZCI7YToxOntzOjE0OiJwcmV2aWV3c0luRGF0YSI7YjoxO319'),
(3, 'RedactorX Basic', 'redactorX', 'YTo0OntzOjQ6InR5cGUiO3M6OToicmVkYWN0b3JYIjtzOjc6InRvb2xiYXIiO2E6MTI6e3M6MTI6InRvb2xiYXJfaGlkZSI7czoxOiJ5IjtzOjE0OiJ0b29sYmFyX3RvcGJhciI7czoxOiJuIjtzOjE0OiJ0b29sYmFyX2FkZGJhciI7czoxOiJuIjtzOjE1OiJ0b29sYmFyX2NvbnRleHQiO3M6MToibiI7czoxNToidG9vbGJhcl9jb250cm9sIjtzOjE6Im4iO3M6NDoiaGlkZSI7YTowOnt9czo2OiJ0b3BiYXIiO2E6Mzp7aTowO3M6ODoic2hvcnRjdXQiO2k6MTtzOjQ6InVuZG8iO2k6MjtzOjQ6InJlZG8iO31zOjY6ImFkZGJhciI7YTo2OntpOjA7czo5OiJwYXJhZ3JhcGgiO2k6MTtzOjU6ImVtYmVkIjtpOjI7czo1OiJ0YWJsZSI7aTozO3M6NToicXVvdGUiO2k6NDtzOjM6InByZSI7aTo1O3M6NDoibGluZSI7fXM6NzoiY29udGV4dCI7YTo5OntpOjA7czo0OiJib2xkIjtpOjE7czo2OiJpdGFsaWMiO2k6MjtzOjc6ImRlbGV0ZWQiO2k6MztzOjQ6ImNvZGUiO2k6NDtzOjQ6ImxpbmsiO2k6NTtzOjQ6Im1hcmsiO2k6NjtzOjM6InN1YiI7aTo3O3M6Mzoic3VwIjtpOjg7czozOiJrYmQiO31zOjY6ImVkaXRvciI7YTo0OntpOjA7czo2OiJmb3JtYXQiO2k6MTtzOjQ6ImJvbGQiO2k6MjtzOjY6Iml0YWxpYyI7aTozO3M6NDoibGluayI7fXM6NjoiZm9ybWF0IjthOjM6e2k6MDtzOjE6InAiO2k6MTtzOjI6InVsIjtpOjI7czoyOiJvbCI7fXM6NzoicGx1Z2lucyI7YTo0OntpOjA7czo5OiJ1bmRlcmxpbmUiO2k6MTtzOjExOiJmaWxlYnJvd3NlciI7aToyO3M6MTY6InJ0ZV9kZWZpbmVkbGlua3MiO2k6MztzOjU6InBhZ2VzIjt9fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czoxMDoidXBsb2FkX2RpciI7czozOiJhbGwiO30='),
(4, 'RedactorX Full', 'redactorX', 'YTo0OntzOjQ6InR5cGUiO3M6OToicmVkYWN0b3JYIjtzOjc6InRvb2xiYXIiO2E6MTI6e3M6MTI6InRvb2xiYXJfaGlkZSI7czoxOiJ5IjtzOjE0OiJ0b29sYmFyX3RvcGJhciI7czoxOiJ5IjtzOjE0OiJ0b29sYmFyX2FkZGJhciI7czoxOiJ5IjtzOjE1OiJ0b29sYmFyX2NvbnRleHQiO3M6MToieSI7czoxNToidG9vbGJhcl9jb250cm9sIjtzOjE6InkiO3M6NDoiaGlkZSI7YTowOnt9czo2OiJ0b3BiYXIiO2E6Mzp7aTowO3M6NDoidW5kbyI7aToxO3M6NDoicmVkbyI7aToyO3M6ODoic2hvcnRjdXQiO31zOjY6ImFkZGJhciI7YTo2OntpOjA7czo5OiJwYXJhZ3JhcGgiO2k6MTtzOjU6ImVtYmVkIjtpOjI7czo1OiJ0YWJsZSI7aTozO3M6NToicXVvdGUiO2k6NDtzOjM6InByZSI7aTo1O3M6NDoibGluZSI7fXM6NzoiY29udGV4dCI7YTo5OntpOjA7czo0OiJib2xkIjtpOjE7czo2OiJpdGFsaWMiO2k6MjtzOjc6ImRlbGV0ZWQiO2k6MztzOjQ6ImNvZGUiO2k6NDtzOjQ6ImxpbmsiO2k6NTtzOjQ6Im1hcmsiO2k6NjtzOjM6InN1YiI7aTo3O3M6Mzoic3VwIjtpOjg7czozOiJrYmQiO31zOjY6ImVkaXRvciI7YTo3OntpOjA7czozOiJhZGQiO2k6MTtzOjQ6Imh0bWwiO2k6MjtzOjY6ImZvcm1hdCI7aTozO3M6NDoiYm9sZCI7aTo0O3M6NjoiaXRhbGljIjtpOjU7czo3OiJkZWxldGVkIjtpOjY7czo0OiJsaW5rIjt9czo2OiJmb3JtYXQiO2E6OTp7aTowO3M6MToicCI7aToxO3M6MjoiaDEiO2k6MjtzOjI6ImgyIjtpOjM7czoyOiJoMyI7aTo0O3M6MjoiaDQiO2k6NTtzOjI6Img1IjtpOjY7czoyOiJoNiI7aTo3O3M6MjoidWwiO2k6ODtzOjI6Im9sIjt9czo3OiJwbHVnaW5zIjthOjE1OntpOjA7czo5OiJ1bmRlcmxpbmUiO2k6MTtzOjk6ImFsaWdubWVudCI7aToyO3M6OToiYmxvY2tjb2RlIjtpOjM7czoxNjoicnRlX2RlZmluZWRsaW5rcyI7aTo0O3M6NToicGFnZXMiO2k6NTtzOjExOiJmaWxlYnJvd3NlciI7aTo2O3M6MTM6ImltYWdlcG9zaXRpb24iO2k6NztzOjExOiJpbWFnZXJlc2l6ZSI7aTo4O3M6MTI6ImlubGluZWZvcm1hdCI7aTo5O3M6MTI6InJlbW92ZWZvcm1hdCI7aToxMDtzOjc6ImNvdW50ZXIiO2k6MTE7czo4OiJzZWxlY3RvciI7aToxMjtzOjEyOiJzcGVjaWFsY2hhcnMiO2k6MTM7czoxMzoidGV4dGRpcmVjdGlvbiI7aToxNDtzOjg6InJlYWRtb3JlIjt9fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czoxMDoidXBsb2FkX2RpciI7czozOiJhbGwiO30=');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_search`
--

CREATE TABLE `exp_search` (
  `search_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int NOT NULL DEFAULT '1',
  `search_date` int NOT NULL,
  `keywords` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_results` int NOT NULL,
  `per_page` tinyint UNSIGNED NOT NULL,
  `query` mediumtext COLLATE utf8mb4_unicode_ci,
  `custom_fields` mediumtext COLLATE utf8mb4_unicode_ci,
  `result_page` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_result_page` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_search_log`
--

CREATE TABLE `exp_search_log` (
  `id` int NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int UNSIGNED NOT NULL,
  `screen_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `search_date` int NOT NULL,
  `search_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `search_terms` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_security_hashes`
--

CREATE TABLE `exp_security_hashes` (
  `hash_id` int UNSIGNED NOT NULL,
  `date` int UNSIGNED NOT NULL,
  `session_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_security_hashes`
--

INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `session_id`, `hash`) VALUES
(1, 1710756360, '0019b943c8d910769201956ee36294aa150c9e04', 'aa39dce8b96354bbcb168b4086b5da1262c243ac');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_sessions`
--

CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_state` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fingerprint` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sess_start` int UNSIGNED NOT NULL DEFAULT '0',
  `auth_timeout` int UNSIGNED NOT NULL DEFAULT '0',
  `last_activity` int UNSIGNED NOT NULL DEFAULT '0',
  `can_debug` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `mfa_flag` enum('skip','show','required') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'skip',
  `pro_banner_seen` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_sessions`
--

INSERT INTO `exp_sessions` (`session_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `login_state`, `fingerprint`, `sess_start`, `auth_timeout`, `last_activity`, `can_debug`, `mfa_flag`, `pro_banner_seen`) VALUES
('0019b943c8d910769201956ee36294aa150c9e04', 1, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0', NULL, '4ce7c9ead3331b0290a66cf9bddc2864', 1710756360, 0, 1710757439, '0', 'skip', 'n');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_sites`
--

CREATE TABLE `exp_sites` (
  `site_id` int UNSIGNED NOT NULL,
  `site_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_description` text COLLATE utf8mb4_unicode_ci,
  `site_color` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_bootstrap_checksums` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_pages` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_sites`
--

INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_color`, `site_bootstrap_checksums`, `site_pages`) VALUES
(1, 'EE7_DEFAULT', 'default_site', NULL, '', 'YToxOntzOjMwOiIvdmFyL3d3dy9wdWJsaWNfaHRtbC9pbmRleC5waHAiO3M6MzI6ImYxNGI5MGMwNGE3NjMwZTY1N2UwYmFiMmY4NGE0NDcyIjt9', '');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_snippets`
--

CREATE TABLE `exp_snippets` (
  `snippet_id` int UNSIGNED NOT NULL,
  `site_id` int NOT NULL,
  `snippet_name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `snippet_contents` text COLLATE utf8mb4_unicode_ci,
  `edit_date` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_snippets`
--

INSERT INTO `exp_snippets` (`snippet_id`, `site_id`, `snippet_name`, `snippet_contents`, `edit_date`) VALUES
(1, 1, 'meta_favicon', '<!--Favicon-->\n<link rel=\"shortcut icon\" href=\"{assets_url}images/meta/favicon.ico\">\n        <link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"{assets_url}images/meta/favicon-16x16.png\">\n        <link rel=\"icon\" type=\"image/png\" sizes=\"32x32\" href=\"{assets_url}images/meta/favicon-32x32.png\">\n        <link rel=\"icon\" type=\"image/png\" sizes=\"48x48\" href=\"{assets_url}images/meta/favicon-48x48.png\">\n        <link rel=\"manifest\" href=\"{assets_url}images/meta/manifest.json\">\n        <meta name=\"mobile-web-app-capable\" content=\"yes\">\n        <meta name=\"theme-color\" content=\"#fff\">\n        <meta name=\"application-name\" content=\"{site_name}\">\n        <link rel=\"apple-touch-icon\" sizes=\"57x57\" href=\"{assets_url}images/meta/apple-touch-icon-57x57.png\">\n        <link rel=\"apple-touch-icon\" sizes=\"60x60\" href=\"{assets_url}images/meta/apple-touch-icon-60x60.png\">\n        <link rel=\"apple-touch-icon\" sizes=\"72x72\" href=\"{assets_url}images/meta/apple-touch-icon-72x72.png\">\n        <link rel=\"apple-touch-icon\" sizes=\"76x76\" href=\"{assets_url}images/meta/apple-touch-icon-76x76.png\">\n        <link rel=\"apple-touch-icon\" sizes=\"114x114\" href=\"{assets_url}images/meta/apple-touch-icon-114x114.png\">\n        <link rel=\"apple-touch-icon\" sizes=\"120x120\" href=\"{assets_url}images/meta/apple-touch-icon-120x120.png\">\n        <link rel=\"apple-touch-icon\" sizes=\"144x144\" href=\"{assets_url}images/meta/apple-touch-icon-144x144.png\">\n        <link rel=\"apple-touch-icon\" sizes=\"152x152\" href=\"{assets_url}images/meta/apple-touch-icon-152x152.png\">\n        <link rel=\"apple-touch-icon\" sizes=\"167x167\" href=\"{assets_url}images/meta/apple-touch-icon-167x167.png\">\n        <link rel=\"apple-touch-icon\" sizes=\"180x180\" href=\"{assets_url}images/meta/apple-touch-icon-180x180.png\">\n        <link rel=\"apple-touch-icon\" sizes=\"1024x1024\" href=\"{assets_url}images/meta/apple-touch-icon-1024x1024.png\">\n        <meta name=\"apple-mobile-web-app-capable\" content=\"yes\">\n        <meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black-translucent\">\n        <meta name=\"apple-mobile-web-app-title\" content=\"{site_name}\">\n        <meta name=\"msapplication-TileColor\" content=\"#fff\">\n        <meta name=\"msapplication-TileImage\" content=\"{assets_url}images/meta/mstile-144x144.png\">\n        <meta name=\"msapplication-config\" content=\"{assets_url}images/meta/browserconfig.xml\">', 1710757316);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_specialty_templates`
--

CREATE TABLE `exp_specialty_templates` (
  `template_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `enable_template` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `template_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_title` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_subtype` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_notes` text COLLATE utf8mb4_unicode_ci,
  `edit_date` int NOT NULL DEFAULT '0',
  `last_author_id` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_specialty_templates`
--

INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_type`, `template_subtype`, `template_data`, `template_notes`, `edit_date`, `last_author_id`) VALUES
(1, 1, 'y', 'offline_template', '', 'system', NULL, '<!doctype html>\n<html dir=\"ltr\">\n    <head>\n        <title>System Offline</title>\n        <meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n\n        <style type=\"text/css\">\n:root, body {\n    --ee-panel-bg: #fff;\n    --ee-panel-border: #dfe0ef;\n    --ee-text-normal: #0d0d19;\n    --ee-main-bg: #f7f7fb;\n    --ee-link: #5D63F1;\n    --ee-link-hover: #171feb;\n}\n\n*, :after, :before {\n    box-sizing: inherit;\n}\n\nhtml {\n    box-sizing: border-box;\n    font-size: 15px;\n    height: 100%;\n    line-height: 1.15;\n}\n\nbody {\n    font-family: -apple-system, BlinkMacSystemFont, segoe ui, helvetica neue, helvetica, Cantarell, Ubuntu, roboto, noto, arial, sans-serif;\n    height: 100%;\n    font-size: 1rem;\n    line-height: 1.6;\n    color: var(--ee-text-normal);\n    background: var(--ee-main-bg);\n    -webkit-font-smoothing: antialiased;\n    margin: 0;\n}\n\n.panel {\n    margin-bottom: 20px;\n    background-color: var(--ee-panel-bg);\n    border: 1px solid var(--ee-panel-border);\n    border-radius: 6px;\n}\n.redirect {\n	max-width: 700px;\n	min-width: 350px;\n    position: absolute;\n    top: 50%;\n    left: 50%;\n    transform: translate(-50%,-50%);\n}\n\n.panel-heading {\n    padding: 20px 25px;\n    position: relative;\n}\n\n.panel-body {\n    padding: 20px 25px;\n}\n\n.panel-body:after, .panel-body:before {\n    content: \" \";\n    display: table;\n}\n\n.redirect p {\n    margin-bottom: 20px;\n}\np {\n    line-height: 1.6;\n}\na, blockquote, code, h1, h2, h3, h4, h5, h6, ol, p, pre, ul {\n    color: inherit;\n    margin: 0;\n    padding: 0;\n    font-weight: inherit;\n}\n\na {\n    color: var(--ee-link);\n    text-decoration: none;\n    -webkit-transition: color .15s ease-in-out;\n    -moz-transition: color .15s ease-in-out;\n    -o-transition: color .15s ease-in-out;\n}\n\na:hover {\n    color: var(--ee-link-hover);\n}\n\nh3 {\n    font-size: 1.35em;\n    font-weight: 500;\n}\n\nol, ul {\n    padding-left: 0;\n}\n\nol li, ul li {\n    list-style-position: inside;\n}\n\n.panel-footer {\n    padding: 20px 25px;\n    position: relative;\n}\n\n\n        </style>\n    </head>\n    <body>\n        <section class=\"flex-wrap\">\n            <section class=\"wrap\">\n                <div class=\"panel redirect\">\n                    <div class=\"panel-heading\">\n                        <h3>System Offline</h3>\n                    </div>\n					<div class=\"panel-body\">\n					This site is currently offline\n                    </div>\n                </div>\n            </section>\n        </section>\n    </body>\n</html>', NULL, 1710756332, 0),
(2, 1, 'y', 'message_template', '', 'system', NULL, '<!doctype html>\n<html dir=\"ltr\">\n    <head>\n        <title>{title}</title>\n        <meta http-equiv=\"content-type\" content=\"text/html; charset={charset}\">\n        <meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n        <meta name=\"referrer\" content=\"no-referrer\">\n        {meta_refresh}\n        <style type=\"text/css\">\n:root, body {\n    --ee-panel-bg: #fff;\n    --ee-panel-border: #dfe0ef;\n    --ee-text-normal: #0d0d19;\n    --ee-main-bg: #f7f7fb;\n    --ee-link: #5D63F1;\n    --ee-link-hover: #171feb;\n}\n\n*, :after, :before {\n    box-sizing: inherit;\n}\n\nhtml {\n    box-sizing: border-box;\n    font-size: 15px;\n    height: 100%;\n    line-height: 1.15;\n}\n\nbody {\n    font-family: -apple-system, BlinkMacSystemFont, segoe ui, helvetica neue, helvetica, Cantarell, Ubuntu, roboto, noto, arial, sans-serif;\n    height: 100%;\n    font-size: 1rem;\n    line-height: 1.6;\n    color: var(--ee-text-normal);\n    background: var(--ee-main-bg);\n    -webkit-font-smoothing: antialiased;\n    margin: 0;\n}\n\n.panel {\n    margin-bottom: 20px;\n    background-color: var(--ee-panel-bg);\n    border: 1px solid var(--ee-panel-border);\n    border-radius: 6px;\n}\n.redirect {\n	max-width: 700px;\n	min-width: 350px;\n    position: absolute;\n    top: 50%;\n    left: 50%;\n    transform: translate(-50%,-50%);\n}\n\n.panel-heading {\n    padding: 20px 25px;\n    position: relative;\n}\n\n.panel-body {\n    padding: 20px 25px;\n}\n\n.panel-body:after, .panel-body:before {\n    content: \" \";\n    display: table;\n}\n\n.redirect p {\n    margin-bottom: 20px;\n}\np {\n    line-height: 1.6;\n}\na, blockquote, code, h1, h2, h3, h4, h5, h6, ol, p, pre, ul {\n    color: inherit;\n    margin: 0;\n    padding: 0;\n    font-weight: inherit;\n}\n\na {\n    color: var(--ee-link);\n    text-decoration: none;\n    -webkit-transition: color .15s ease-in-out;\n    -moz-transition: color .15s ease-in-out;\n    -o-transition: color .15s ease-in-out;\n}\n\na:hover {\n    color: var(--ee-link-hover);\n}\n\nh3 {\n    font-size: 1.35em;\n    font-weight: 500;\n}\n\nol, ul {\n    padding-left: 0;\n}\n\nol li, ul li {\n    list-style-position: inside;\n}\n\n.panel-footer {\n    padding: 20px 25px;\n    position: relative;\n}\n\n\n        </style>\n    </head>\n    <body>\n        <section class=\"flex-wrap\">\n            <section class=\"wrap\">\n                <div class=\"panel redirect\">\n                    <div class=\"panel-heading\">\n                        <h3>{heading}</h3>\n                    </div>\n                    <div class=\"panel-body\">\n                        {content}\n\n\n                    </div>\n                    <div class=\"panel-footer\">\n                        {link}\n                    </div>\n                </div>\n            </section>\n        </section>\n    </body>\n</html>', NULL, 1710756332, 0),
(3, 1, 'y', 'post_install_message_template', '', 'system', NULL, '<!doctype html>\n<html>\n	<head>\n		<title>Welcome to ExpressionEngine!</title>\n		<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" lang=\"en-us\" dir=\"ltr\">\n		<meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n		<link href=\"{theme_folder_url}cp/css/common.min.css\" rel=\"stylesheet\">\n			</head>\n	<body class=\"installer-page\">\n		<section class=\"flex-wrap\">\n			<section class=\"wrap\">\n				<div class=\"login__logo\">\n  <svg width=\"281px\" height=\"36px\" viewBox=\"0 0 281 36\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\">\n  <title>ExpressionEngine</title>\n  <defs>\n      <polygon id=\"path-1\" points=\"0.3862 0.1747 18.6557 0.1747 18.6557 21.5 0.3862 21.5\"></polygon>\n      <polygon id=\"path-3\" points=\"0.3926 0.17455 13.9915 0.17455 13.9915 15.43755 0.3926 15.43755\"></polygon>\n      <polygon id=\"path-5\" points=\"0 0.06905 25.8202 0.06905 25.8202 31.6178513 0 31.6178513\"></polygon>\n      <polygon id=\"path-7\" points=\"0.10635 0.204 25.9268587 0.204 25.9268587 31.7517 0.10635 31.7517\"></polygon>\n  </defs>\n  <g id=\"logo\" stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\">\n      <g id=\"expressionengine\">\n          <path d=\"M92.88015,27.0665 L89.28865,20.955 L94.66665,14.6405 L94.77265,13.9 L91.11315,13.9 L87.86765,17.95 C87.76015,18.0845 87.57265,18.353 87.30415,19.2645 C87.33065,18.353 87.14315,18.0845 87.08965,17.9775 L84.80915,13.9 L80.59815,13.9 L84.62115,20.8475 L78.21065,28.3045 L82.42165,28.3045 L86.04315,23.905 C86.23065,23.664 86.52565,23.154 86.66065,22.5915 C86.66065,23.154 86.79465,23.6905 86.92865,23.905 L89.42265,28.3045 L92.70265,28.3045 L92.88015,27.0665 Z\" id=\"Fill-1\"></path>\n          <path d=\"M80.2395,11.9686 L70.9585,11.9686 L70.288,16.6091 L78.7645,16.6091 L77.4495,19.6141 L69.751,19.6141 C69.805,19.8011 69.805,20.0156 69.778,20.1231 L69.027,25.3011 L78.3345,25.3011 L77.9055,28.3046 L65.003,28.3046 L67.7925,8.9651 L80.6685,8.9651 L80.2395,11.9686 Z\" id=\"Fill-3\"></path>\n          <path d=\"M102.3328,16.20735 C101.5283,16.20735 100.5628,16.34085 99.3558,17.11935 L98.1493,25.46185 C98.8998,25.83735 99.9723,25.99835 100.8848,25.99835 C103.0573,25.99835 104.2378,24.60235 104.7478,20.98085 C104.8548,20.28385 104.9083,19.69385 104.9083,19.18485 C104.9083,17.03835 104.0508,16.20735 102.3328,16.20735 M108.3418,20.98085 C107.6718,25.70235 105.5783,28.73385 100.5093,28.73385 C99.5708,28.73385 98.4978,28.54635 97.5313,28.08985 C97.6128,28.38435 97.6933,28.73385 97.6393,29.02935 L96.8073,34.79585 L93.2133,34.79585 L96.2178,13.89985 L98.7928,13.89985 L99.0878,15.08085 C100.3213,14.00685 101.7703,13.47035 103.1113,13.47035 C106.9473,13.47035 108.5023,15.69685 108.5023,19.05035 C108.5023,19.66735 108.4483,20.31135 108.3418,20.98085\" id=\"Fill-5\"></path>\n          <path d=\"M119.33865,16.69 C118.74815,16.609 118.13215,16.555 117.48715,16.555 C116.46815,16.555 115.39515,16.716 114.45615,17.28 L112.87415,28.3045 L109.27965,28.3045 L111.34515,13.8995 L114.29515,13.8995 L114.51115,15.0535 C115.71715,13.8995 116.92465,13.4705 118.21215,13.4705 C118.72265,13.4705 119.25865,13.5515 119.79515,13.659 L119.33865,16.69 Z\" id=\"Fill-7\"></path>\n          <path d=\"M127.43385,16.31455 C125.39585,16.31455 124.40285,17.09155 123.81285,19.61405 L129.71435,19.61405 C129.76785,19.29205 129.79435,18.99655 129.79435,18.72855 C129.79435,17.14555 129.01685,16.31455 127.43385,16.31455 M133.03985,22.13505 L123.35635,22.13505 C123.30235,22.56405 123.27685,22.93955 123.27685,23.28855 C123.27685,25.05905 124.08085,25.89105 126.06585,25.89105 C127.91685,25.89105 128.96335,25.08605 129.74035,23.90505 L132.44985,25.00505 C131.18885,27.41855 128.82885,28.73355 125.66385,28.73355 C121.58635,28.73355 119.73535,26.56055 119.73535,22.93955 C119.73535,22.34955 119.78885,21.73305 119.86985,21.08855 C120.64685,15.80405 122.95485,13.47055 127.86285,13.47055 C132.31635,13.47055 133.33585,16.60905 133.33585,19.29205 C133.33585,20.09655 133.17435,21.16955 133.03985,22.13505\" id=\"Fill-9\"></path>\n          <path d=\"M144.11795,17.70905 C143.60895,16.79705 142.66995,16.28705 141.19395,16.28705 C140.04145,16.28705 138.64595,16.52905 138.64595,17.97755 C138.64595,18.48755 138.88745,18.91655 139.53145,19.02405 L142.64245,19.58655 C144.60095,19.93605 146.20995,21.03455 146.20995,23.12755 C146.20995,27.23155 142.80295,28.73355 139.23545,28.73355 C136.71445,28.73355 134.73045,27.87555 133.76445,25.62255 L136.76845,24.52255 C137.33245,25.54155 138.24395,25.99805 139.61245,25.99805 C140.95345,25.99805 142.61595,25.59505 142.61595,23.93255 C142.61595,23.34255 142.34795,22.91355 141.56945,22.77855 L138.21645,22.16255 C136.66095,21.86655 135.13145,20.68655 135.13145,18.46005 C135.13145,14.65055 138.27045,13.47055 141.59695,13.47055 C144.57445,13.47055 146.20995,14.67805 146.93445,16.39455 L144.11795,17.70905 Z\" id=\"Fill-11\"></path>\n          <path d=\"M157.28835,17.70905 C156.77935,16.79705 155.84135,16.28705 154.36435,16.28705 C153.21235,16.28705 151.81785,16.52905 151.81785,17.97755 C151.81785,18.48755 152.05935,18.91655 152.70335,19.02405 L155.81435,19.58655 C157.77285,19.93605 159.38185,21.03455 159.38185,23.12755 C159.38185,27.23155 155.97385,28.73355 152.40635,28.73355 C149.88635,28.73355 147.90085,27.87555 146.93585,25.62255 L149.93885,24.52255 C150.50285,25.54155 151.41585,25.99805 152.78285,25.99805 C154.12535,25.99805 155.78685,25.59505 155.78685,23.93255 C155.78685,23.34255 155.51985,22.91355 154.74135,22.77855 L151.38835,22.16255 C149.83185,21.86655 148.30235,20.68655 148.30235,18.46005 C148.30235,14.65055 151.44085,13.47055 154.76885,13.47055 C157.74485,13.47055 159.38185,14.67805 160.10535,16.39455 L157.28835,17.70905 Z\" id=\"Fill-13\"></path>\n          <path d=\"M168.0188,11.0294 C167.9908,11.2714 167.9908,11.2714 167.7768,11.2714 L164.2888,11.2714 C164.0743,11.2714 164.0743,11.2714 164.1018,11.0294 L164.5858,7.7039 C164.6108,7.4359 164.6108,7.4084 164.8253,7.4084 L168.3133,7.4084 C168.5278,7.4084 168.5278,7.4359 168.5003,7.7039 L168.0188,11.0294 Z M167.2953,28.5464 L165.4688,28.5464 C163.3783,28.5464 162.3583,27.6334 162.3583,25.7564 C162.3583,25.4619 162.3853,25.1659 162.4378,24.8169 L163.5128,17.3874 C163.5378,17.1729 163.6728,16.8509 163.8873,16.6089 L161.2853,16.6089 L161.6618,13.8999 L167.5898,13.8999 L166.0328,24.8169 C166.0083,24.9514 166.0083,25.0864 166.0083,25.1934 C166.0083,25.5154 166.1398,25.6229 166.5443,25.6229 L167.6968,25.6229 L167.2953,28.5464 Z\" id=\"Fill-15\"></path>\n          <path d=\"M176.8977,16.31455 C174.6972,16.31455 173.6242,17.44105 173.0882,21.08855 C172.9807,21.81305 172.9262,22.45705 172.9262,22.99305 C172.9262,25.16605 173.7837,25.89105 175.5282,25.89105 C177.7007,25.89105 178.8562,24.76305 179.3922,21.08855 C179.4997,20.39105 179.5522,19.77455 179.5522,19.23855 C179.5522,17.03805 178.6662,16.31455 176.8977,16.31455 M182.9852,21.08855 C182.2617,26.07805 180.0887,28.73355 175.1262,28.73355 C170.8872,28.73355 169.3582,26.13155 169.3582,22.85955 C169.3582,22.29555 169.4132,21.67955 169.4927,21.08855 C170.2167,16.01905 172.3647,13.47055 177.3267,13.47055 C181.5377,13.47055 183.1197,15.93905 183.1197,19.26455 C183.1197,19.85455 183.0672,20.44455 182.9852,21.08855\" id=\"Fill-17\"></path>\n          <path d=\"M197.21265,19.23835 L195.89815,28.30435 L192.33015,28.30435 L193.64515,19.23835 C193.70015,18.91635 193.72465,18.59485 193.72465,18.29935 C193.72465,17.06535 193.24365,16.26085 191.90115,16.26085 C190.80115,16.26085 189.51415,16.87685 188.46865,17.52085 L186.91165,28.30435 L183.34415,28.30435 L185.41015,13.89985 L188.36115,13.89985 L188.60315,15.21435 C190.26465,13.89985 191.60665,13.47035 193.10865,13.47035 C196.11265,13.47035 197.32015,15.37535 197.32015,17.92385 C197.32015,18.35285 197.26715,18.78185 197.21265,19.23835\" id=\"Fill-19\"></path>\n          <path d=\"M214.45925,11.9686 L205.17825,11.9686 L204.51025,16.6091 L212.98475,16.6091 L211.67025,19.6141 L203.97075,19.6141 C204.02625,19.8011 204.02625,20.0156 203.99875,20.1231 L203.24775,25.3011 L212.55525,25.3011 L212.12675,28.3046 L199.22325,28.3046 L202.01525,8.9651 L214.89075,8.9651 L214.45925,11.9686 Z\" id=\"Fill-21\"></path>\n          <path d=\"M227.8411,19.23835 L226.5266,28.30435 L222.9586,28.30435 L224.2736,19.23835 C224.3261,18.91635 224.3531,18.59485 224.3531,18.29935 C224.3531,17.06535 223.8696,16.26085 222.5301,16.26085 C221.4296,16.26085 220.1426,16.87685 219.0946,17.52085 L217.5401,28.30435 L213.9726,28.30435 L216.0386,13.89985 L218.9871,13.89985 L219.2291,15.21435 C220.8931,13.89985 222.2331,13.47035 223.7371,13.47035 C226.7411,13.47035 227.9486,15.37535 227.9486,17.92385 C227.9486,18.35285 227.8936,18.78185 227.8411,19.23835\" id=\"Fill-23\"></path>\n          <g id=\"Group-27\" transform=\"translate(227.500000, 13.296000)\">\n              <mask id=\"mask-2\" fill=\"white\">\n                  <use xlink:href=\"#path-1\"></use>\n              </mask>\n              <g id=\"Clip-26\"></g>\n              <path d=\"M9.7742,2.9912 C7.7607,2.9912 6.6082,4.1452 6.6082,6.1297 C6.6082,7.4702 7.4667,8.0342 9.0232,8.0342 C11.0342,8.0342 12.1612,6.9617 12.1612,4.9772 C12.1612,3.6622 11.3832,2.9912 9.7742,2.9912 L9.7742,2.9912 Z M10.1207,15.0622 L5.0787,14.1227 C4.2757,14.9812 3.9262,15.5447 3.9262,16.7522 C3.9262,18.1197 4.8917,18.7372 7.4667,18.7372 C9.1557,18.7372 11.4907,18.4687 11.4907,16.2957 C11.4907,15.6262 11.1412,15.2507 10.1207,15.0622 L10.1207,15.0622 Z M18.3312,3.3132 L16.5872,3.3132 C16.3457,3.3132 15.7542,3.2867 15.3002,3.0722 C15.5672,3.7157 15.6742,4.4392 15.6742,5.0307 C15.6742,9.2142 12.3482,10.8237 8.6187,10.8237 C7.7882,10.8237 6.9852,10.7437 6.2862,10.5827 C6.1792,10.5552 6.0717,10.5292 5.9372,10.5292 C5.5352,10.5292 5.2932,10.7437 5.2932,11.1452 C5.2932,11.4137 5.4282,11.6017 6.0167,11.7092 L11.1962,12.6747 C14.0652,13.2112 15.0577,14.4447 15.0577,16.0277 C15.0577,20.6682 10.7122,21.5002 7.0647,21.5002 C4.1682,21.5002 0.3862,20.7217 0.3862,17.1002 C0.3862,15.2232 1.3767,13.6142 2.9857,12.6482 C2.6637,12.2457 2.5042,11.7902 2.5042,11.3597 C2.5042,10.3947 3.2007,9.6437 4.0062,9.2142 C3.4972,8.5707 3.0682,7.5517 3.0682,6.3717 C3.0682,2.1602 6.3387,0.1747 10.1757,0.1747 C11.5177,0.1747 12.9372,0.4167 13.9852,1.0862 L16.0537,0.6212 L18.6557,0.6212 L18.3312,3.3132 Z\" id=\"Fill-25\" mask=\"url(#mask-2)\"></path>\n          </g>\n          <path d=\"M251.54175,11.0294 C251.51675,11.2714 251.51675,11.2714 251.30225,11.2714 L247.81475,11.2714 C247.59975,11.2714 247.59975,11.2714 247.62725,11.0294 L248.10925,7.7039 C248.13625,7.4359 248.13625,7.4084 248.35075,7.4084 L251.83875,7.4084 C252.05275,7.4084 252.05275,7.4359 252.02575,7.7039 L251.54175,11.0294 Z M250.81825,28.5464 L248.99425,28.5464 C246.90175,28.5464 245.88375,27.6334 245.88375,25.7564 C245.88375,25.4619 245.91075,25.1659 245.96375,24.8169 L247.03575,17.3874 C247.06375,17.1729 247.19825,16.8509 247.41275,16.6089 L244.81075,16.6089 L245.18475,13.8999 L251.11275,13.8999 L249.55825,24.8169 C249.53125,24.9514 249.53125,25.0864 249.53125,25.1934 C249.53125,25.5154 249.66575,25.6229 250.06725,25.6229 L251.21975,25.6229 L250.81825,28.5464 Z\" id=\"Fill-28\"></path>\n          <path d=\"M266.32595,19.23835 L265.01095,28.30435 L261.44345,28.30435 L262.75845,19.23835 C262.81345,18.91635 262.83795,18.59485 262.83795,18.29935 C262.83795,17.06535 262.35695,16.26085 261.01445,16.26085 C259.91445,16.26085 258.62695,16.87685 257.58195,17.52085 L256.02445,28.30435 L252.45745,28.30435 L254.52345,13.89985 L257.47445,13.89985 L257.71645,15.21435 C259.37795,13.89985 260.71995,13.47035 262.22195,13.47035 C265.22595,13.47035 266.43345,15.37535 266.43345,17.92385 C266.43345,18.35285 266.38045,18.78185 266.32595,19.23835\" id=\"Fill-30\"></path>\n          <g id=\"Group-34\" transform=\"translate(267.000000, 13.296000)\">\n              <mask id=\"mask-4\" fill=\"white\">\n                  <use xlink:href=\"#path-3\"></use>\n              </mask>\n              <g id=\"Clip-33\"></g>\n              <path d=\"M8.0916,3.01855 C6.0531,3.01855 5.0606,3.79555 4.4691,6.31805 L10.3716,6.31805 C10.4241,5.99605 10.4516,5.70055 10.4516,5.43255 C10.4516,3.84955 9.6731,3.01855 8.0916,3.01855 M13.6971,8.83905 L4.0126,8.83905 C3.9596,9.26805 3.9326,9.64355 3.9326,9.99255 C3.9326,11.76305 4.7381,12.59505 6.7216,12.59505 C8.5731,12.59505 9.6211,11.79005 10.3961,10.60905 L13.1056,11.70905 C11.8461,14.12255 9.4861,15.43755 6.3201,15.43755 C2.2436,15.43755 0.3926,13.26455 0.3926,9.64355 C0.3926,9.05355 0.4446,8.43705 0.5271,7.79255 C1.3031,2.50805 3.6106,0.17455 8.5201,0.17455 C12.9736,0.17455 13.9916,3.31305 13.9916,5.99605 C13.9916,6.80055 13.8316,7.87355 13.6971,8.83905\" id=\"Fill-32\" mask=\"url(#mask-4)\"></path>\n          </g>\n          <path d=\"M20.60205,17.64605 C21.11355,14.75605 22.01655,12.45255 23.28405,10.79305 C24.18105,9.60555 25.17405,9.00405 26.23755,9.00405 C26.80055,9.00405 27.27705,9.22055 27.65305,9.64955 C28.01805,10.06905 28.20405,10.64605 28.20405,11.36305 C28.20405,13.02405 27.45705,14.53555 25.98455,15.86155 C24.91705,16.81355 23.20305,17.51055 20.89205,17.93305 L20.53855,17.99805 L20.60205,17.64605 Z M30.67305,21.68355 C29.37505,22.92855 28.23905,23.80705 27.31805,24.24655 C26.34905,24.70655 25.34805,24.93855 24.34355,24.93855 C23.11755,24.93855 22.12155,24.54805 21.38655,23.77655 C20.65105,23.00705 20.27805,21.90355 20.27805,20.49455 L20.37305,19.08355 L20.56855,19.05005 C24.00755,18.47005 26.60155,17.80655 28.27555,17.07555 C29.93155,16.35405 31.14005,15.49505 31.86855,14.52405 C32.59155,13.56105 32.95655,12.59155 32.95655,11.65055 C32.95655,10.50805 32.52355,9.59355 31.63105,8.84705 C30.73555,8.10155 29.44355,7.72455 27.79455,7.72455 C25.50305,7.72455 23.33455,8.25905 21.34955,9.31405 C19.36805,10.36805 17.78305,11.82905 16.64005,13.65605 C15.50005,15.48105 14.92155,17.41555 14.92155,19.40105 C14.92155,21.61755 15.60505,23.39505 16.95205,24.68005 C18.30455,25.96905 20.19355,26.62005 22.56705,26.62005 C24.25255,26.62005 25.84755,26.28155 27.30805,25.61355 C28.70455,24.97455 30.14905,23.86705 31.60805,22.37255 C31.33005,22.16805 30.87005,21.82855 30.67305,21.68355 L30.67305,21.68355 Z\" id=\"Fill-35\"></path>\n          <g id=\"Group-39\" transform=\"translate(0.000000, 2.796000)\">\n              <mask id=\"mask-6\" fill=\"white\">\n                  <use xlink:href=\"#path-5\"></use>\n              </mask>\n              <g id=\"Clip-38\"></g>\n              <path d=\"M7.2737,19.35005 C5.3202,11.70605 9.9462,3.71505 17.8897,0.06905 C17.6907,0.14055 17.5042,0.22255 17.3077,0.29605 C17.5087,0.20005 17.6882,0.11955 17.8272,0.07205 L2.9432,3.91255 L6.9112,6.26005 C1.7147,10.66105 -0.9663,16.11555 0.3187,21.14505 C2.3302,29.02005 13.3457,33.12605 25.8202,31.10805 C17.1117,31.75655 9.2257,26.99355 7.2737,19.35005\" id=\"Fill-37\" mask=\"url(#mask-6)\"></path>\n          </g>\n          <g id=\"Group-42\" transform=\"translate(23.500000, 0.296000)\">\n              <mask id=\"mask-8\" fill=\"white\">\n                  <use xlink:href=\"#path-7\"></use>\n              </mask>\n              <g id=\"Clip-41\"></g>\n              <path d=\"M18.65285,12.4697 C20.60635,20.1147 15.98135,28.1052 8.03735,31.7517 C8.23585,31.6797 8.42235,31.5977 8.61885,31.5232 C8.41785,31.6212 8.23835,31.7002 8.09935,31.7482 L22.98335,27.9087 L19.01585,25.5612 C24.21185,21.1597 26.89285,15.7042 25.60835,10.6747 C23.59635,2.8027 12.58085,-1.3053 0.10635,0.7142 C8.81435,0.0637 16.70135,4.8267 18.65285,12.4697\" id=\"Fill-40\" mask=\"url(#mask-8)\"></path>\n          </g>\n      </g>\n    </g>\n  </svg>\n</div>\n				<div class=\"panel warn\">\n  <div class=\"panel-heading\" style=\"text-align: center;\">\n    <h3>ExpressionEngine has been installed!</h3>\n  </div>\n  <div class=\"panel-body\">\n    <div class=\"updater-msg\">\n  		<p style=\"margin-bottom: 20px;\">If you see this message, then everything went well.</p>\n\n  		<div class=\"alert alert--attention\">\n            <div class=\"alert__icon\">\n              <i class=\"fal fa-info-circle fa-fw\"></i>\n            </div>\n            <div class=\"alert__content\">\n    			<p>If you are site owner, please login into your Control Panel and create your first template.</p>\n    		</div>\n  		</div>\n  		<div class=\"alert alert--attention\">\n            <div class=\"alert__icon\">\n              <i class=\"fal fa-info-circle fa-fw\"></i>\n            </div>\n            <div class=\"alert__content\">\n    			<p>If this is your first time using ExpressionEngine CMS, make sure to <a href=\"https://docs.expressionengine.com/latest/getting-started/the-big-picture.html\">check out the documentation</a> to get started.</p>\n    		</div>\n  		</div>\n  	</div>\n  </div>\n  <div class=\"panel-footer\">\n\n  </div>\n</div>\n			</div>\n			<section class=\"bar\">\n				<p style=\"float: left;\"><a href=\"https://expressionengine.com/\" rel=\"external\"><b>ExpressionEngine</b></a></p>\n				<p style=\"float: right;\">&copy;2023 <a href=\"https://packettide.com/\" rel=\"external\">Packet Tide</a>, LLC</p>\n			</section>\n		</section>\n\n	</body>\n</html>', NULL, 1710756332, 0),
(4, 1, 'y', 'mfa_template', '', 'system', NULL, '<!doctype html>\n        <html dir=\"ltr\">\n            <head>\n                <title>{title}</title>\n                <meta http-equiv=\"content-type\" content=\"text/html; charset={charset}\">\n                <meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n                <meta name=\"referrer\" content=\"no-referrer\">\n                {meta_refresh}\n                <style type=\"text/css\">\n        :root, body {\n            --ee-panel-bg: #fff;\n            --ee-panel-border: #dfe0ef;\n            --ee-text-normal: #0d0d19;\n            --ee-text-secondary: #8f90b0;\n            --ee-main-bg: #f7f7fb;\n            --ee-link: #5D63F1;\n            --ee-link-hover: #171feb;\n            --ee-bg-blank: #fff;\n            --ee-code-border: #dfe0ef;\n\n            --ee-input-color: #0d0d19;\n            --ee-input-bg: #fff;\n            --ee-input-placeholder: #adaec5;\n            --ee-input-border: #cbcbda;\n            --ee-input-border-accent: #ecedf5;\n            --ee-input-focus-border: #5D63F1;\n            --ee-input-focus-shadow: 0 3px 6px -3px rgba(174,151,255,0.14),0 5px 10px -3px rgba(97,114,242,0.05);\n            --ee-button-primary-color: #fff;\n            --ee-button-primary-bg: #5D63F1;\n            --ee-button-primary-border: #5D63F1;\n\n            --ee-bg-0: #f7f7fb;\n            --ee-border: #dfe0ef;\n            --ee-error: #FA5252;\n            --ee-error-light: #fee7e7;\n            --ee-warning: #FFB40B;\n            --ee-warning-light: #fff6e1;\n        }\n\n        @font-face{font-family:Roboto;font-style:normal;font-weight:400;src:url({url_themes}webfonts/roboto-v20-latin-regular.eot);src:local(\"Roboto\"),local(\"Roboto-Regular\"),url({url_themes}webfonts/roboto-v20-latin-regular.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-regular.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-regular.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-regular.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-regular.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:400;src:url({url_themes}webfonts/roboto-v20-latin-italic.eot);src:local(\"Roboto Italic\"),local(\"Roboto-Italic\"),url({url_themes}webfonts/roboto-v20-latin-italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-italic.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:normal;font-weight:500;src:url({url_themes}webfonts/roboto-v20-latin-500.eot);src:local(\"Roboto Medium\"),local(\"Roboto-Medium\"),url({url_themes}webfonts/roboto-v20-latin-500.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-500.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-500.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-500.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-500.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:500;src:url({url_themes}webfonts/roboto-v20-latin-500italic.eot);src:local(\"Roboto Medium Italic\"),local(\"Roboto-MediumItalic\"),url({url_themes}webfonts/roboto-v20-latin-500italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-500italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-500italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-500italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-500italic.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:normal;font-weight:700;src:url({url_themes}webfonts/roboto-v20-latin-700.eot);src:local(\"Roboto Bold\"),local(\"Roboto-Bold\"),url({url_themes}webfonts/roboto-v20-latin-700.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-700.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-700.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-700.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-700.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:700;src:url({url_themes}webfonts/roboto-v20-latin-700italic.eot);src:local(\"Roboto Bold Italic\"),local(\"Roboto-BoldItalic\"),url({url_themes}webfonts/roboto-v20-latin-700italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-700italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-700italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-700italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-700italic.svg#Roboto) format(\"svg\")}\n        @font-face{font-family:\'Font Awesome 5 Free\';font-style:normal;font-weight:900;font-display:auto;src:url({url_themes}webfonts/fa-solid-900.eot);src:url({url_themes}webfonts/fa-solid-900.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/fa-solid-900.woff2) format(\"woff2\"),url({url_themes}webfonts/fa-solid-900.woff) format(\"woff\"),url({url_themes}webfonts/fa-solid-900.ttf) format(\"truetype\"),url({url_themes}webfonts/fa-solid-900.svg#fontawesome) format(\"svg\")}\n\n        *, :after, :before {\n            box-sizing: inherit;\n        }\n\n        html {\n            box-sizing: border-box;\n            font-size: 15px;\n            height: 100%;\n            line-height: 1.15;\n        }\n\n        body {\n            font-family: -apple-system, BlinkMacSystemFont, segoe ui, helvetica neue, helvetica, Cantarell, Ubuntu, roboto, noto, arial, sans-serif;\n            height: 100%;\n            font-size: 1rem;\n            line-height: 1.6;\n            color: var(--ee-text-normal);\n            background: var(--ee-main-bg);\n            -webkit-font-smoothing: antialiased;\n            margin: 0;\n        }\n\n        .panel {\n            margin-bottom: 20px;\n            background-color: var(--ee-panel-bg);\n            border: 1px solid var(--ee-panel-border);\n            border-radius: 6px;\n        }\n        .redirect {\n            max-width: 700px;\n            min-width: 350px;\n            position: absolute;\n            left: 50%;\n            top: 0;\n            transform: translate(-50%);\n            height: 100vh;\n            overflow-y: auto;\n            background: transparent;\n            border: none;\n            border-radius: 0;\n            display: flex;\n        }\n\n        .redirect-inner {\n          background-color: var(--ee-panel-bg);\n          border: 1px solid var(--ee-panel-border);\n          border-radius: 6px;\n          height: auto;\n          margin-top: auto;\n          margin-bottom: auto;\n        }\n\n        .redirect-inner .qr-code-wrap {\n            text-align: center;\n        }\n\n        .panel-heading {\n            padding: 20px 25px;\n            position: relative;\n        }\n\n        .panel-body {\n            padding: 20px 25px;\n        }\n\n        .panel-body:after, .panel-body:before {\n            content: \" \";\n            display: table;\n        }\n\n        .redirect p {\n            margin-bottom: 20px;\n        }\n        p {\n            line-height: 1.6;\n        }\n        a, blockquote, code, h1, h2, h3, h4, h5, h6, ol, p, pre, ul {\n            color: inherit;\n            margin: 0;\n            padding: 0;\n            font-weight: inherit;\n        }\n\n        code {\n            font-size: inherit;\n            margin: 0 2px;\n            padding: 3px 6px;\n            border-radius: 5px;\n            border: 1px solid var(--ee-code-border);\n            background-color: var(--ee-bg-blank);\n            font-size: .96em;\n            white-space: normal;\n        }\n\n        a {\n            color: var(--ee-link);\n            text-decoration: none;\n            -webkit-transition: color .15s ease-in-out;\n            -moz-transition: color .15s ease-in-out;\n            -o-transition: color .15s ease-in-out;\n        }\n\n        a:hover {\n            color: var(--ee-link-hover);\n        }\n\n        h3 {\n            font-size: 1.35em;\n            font-weight: 500;\n        }\n\n        ol, ul {\n            padding-left: 0;\n        }\n\n        ol li, ul li {\n            list-style-position: inside;\n        }\n\n        .panel-footer {\n            padding: 20px 25px;\n            position: relative;\n        }\n\n        fieldset {\n            margin: 0;\n            padding: 0;\n            margin-bottom: 20px;\n            border: 0;\n        }\n\n        fieldset.last {\n            margin-bottom: 0;\n        }\n\n        .field-instruct {\n            margin-bottom: 5px;\n        }\n\n        .field-instruct label {\n            display: block;\n            color: var(--ee-text-normal);\n            margin-bottom: 5px;\n            font-weight: 500;\n        }\n\n        .field-instruct :last-child {\n            margin-bottom: 0;\n        }\n\n        .field-instruct em {\n            color: var(--ee-text-secondary);\n            display: block;\n            font-size: .8rem;\n            font-style: normal;\n            margin-bottom: 10px;\n        }\n\n        .field-instruct label+em {\n            margin-top: -5px;\n        }\n\n        button, input, optgroup, select, textarea {\n            font-family: inherit;\n            font-size: 100%;\n            line-height: 1.15;\n            margin: 0;\n        }\n\n        input[type=text], input[type=password] {\n            display: block;\n            width: 100%;\n            padding: 8px 15px;\n            font-size: 1rem;\n            line-height: 1.6;\n            color: var(--ee-input-color);\n            background-color: var(--ee-input-bg);\n            background-image: none;\n            transition: border-color .2s ease,box-shadow .2s ease;\n            -webkit-appearance: none;\n            border: 1px solid var(--ee-input-border);\n            border-radius: 5px;\n        }\n\n        input[type=text]:focus, input[type=password]:focus {\n            border-color: var(--ee-input-focus-border);\n        }\n\n        input:focus {\n            outline: 0;\n        }\n\n        .button {\n            -webkit-appearance: none;\n            display: inline-block;\n            font-weight: 500;\n            text-align: center;\n            vertical-align: middle;\n            touch-action: manipulation;\n            background-image: none;\n            cursor: pointer;\n            border: 1px solid transparent;\n            white-space: nowrap;\n            -webkit-transition: background-color .15s ease-in-out;\n            -moz-transition: background-color .15s ease-in-out;\n            -o-transition: background-color .15s ease-in-out;\n            -webkit-user-select: none;\n            -moz-user-select: none;\n            -ms-user-select: none;\n            user-select: none;\n            padding: 8px 20px!important;\n            font-size: 1rem;\n            line-height: 1.6;\n            border-radius: 5px;\n        }\n\n        .button--wide {\n            display: block;\n            width: 100%;\n        }\n\n        .button--large {\n            padding: 10px 25px!important;\n            font-size: 1.2rem;\n            line-height: 1.7;\n            border-radius: 6px;\n        }\n\n        .button--primary {\n            color: var(--ee-button-primary-color);\n            background-color: var(--ee-button-primary-bg);\n            border-color: var(--ee-button-primary-border);\n        }\n\n        .button.disabled {\n            cursor: not-allowed;\n            opacity: .55;\n            box-shadow: none;\n        }\n\n        .app-notice {\n            border: 1px solid var(--ee-border);\n            overflow: hidden;\n            background-color: var(--ee-bg-0);\n            border-radius: 5px;\n            display: flex;\n            margin-bottom: 20px;\n        }\n\n        .app-notice---error {\n            border-color: var(--ee-error);\n            background-color: var(--ee-error-light);\n        }\n\n        .app-notice---error .app-notice__tag {\n            color: var(--ee-error);\n        }\n\n        .app-notice---important {\n            border-color: var(--ee-warning);\n            background-color: var(--ee-warning-light);\n        }\n\n        .app-notice---important .app-notice__tag {\n            color: var(--ee-warning);\n        }\n\n        .app-notice__tag {\n            padding: 15px 20px;\n            display: flex;\n            align-items: center;\n            justify-content: center;\n            font-size: 16px;\n        }\n\n        .app-notice__icon {\n            position: relative;\n        }\n\n        .app-notice__icon::before {\n            font-family: \'Font Awesome 5 Free\';\n            font-weight: 900;\n            content: \"\\\\f06a\";\n            position: relative;\n            z-index: 2;\n        }\n\n        .app-notice---error .app-notice__icon::after {\n            background: var(--ee-error-light);\n        }\n\n        .app-notice__tag+.app-notice__content {\n            padding-left: 0;\n        }\n\n        .app-notice__content {\n            flex: 1 1;\n            padding: 15px 20px;\n        }\n\n        .app-notice__content p {\n            margin: 0;\n            color: var(--ee-text-primary);\n            opacity: .6;\n        }\n\n                </style>\n            </head>\n            <body>\n                <section class=\"flex-wrap\">\n                    <section class=\"wrap\">\n                        <div class=\"panel redirect\">\n                            <div class=\"redirect-inner\">\n                                <div class=\"panel-heading\">\n                                    <h3>{heading}</h3>\n                                </div>\n                                <div class=\"panel-body\">\n                                    {content}\n                                </div>\n                                <div class=\"panel-footer\">\n                                    {link}\n                                </div>\n                            </div>\n                        </div>\n                    </section>\n                </section>\n            </body>\n        </html>', NULL, 1710756332, 0),
(5, 1, 'y', 'admin_notify_reg', 'Notification of new member registration', 'email', 'members', 'New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}', NULL, 1710756332, 0),
(6, 1, 'y', 'admin_notify_entry', 'A new channel entry has been posted', 'email', 'content', 'A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit:\n{entry_url}\n', NULL, 1710756332, 0),
(7, 1, 'y', 'admin_notify_comment', 'You have just received a comment', 'email', 'comments', 'You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at:\n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}', NULL, 1710756332, 0),
(8, 1, 'y', 'mbr_activation_instructions', 'Enclosed is your activation code', 'email', 'members', 'Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}', NULL, 1710756332, 0),
(9, 1, 'y', 'forgot_password_instructions', 'Login information', 'email', 'members', 'To reset your password, please go to the following page:\n\n{reset_url}\n\nThen log in with your username: {username}\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}', NULL, 1710756332, 0),
(10, 1, 'y', 'password_changed_notification', 'Password changed', 'email', 'members', 'Your password was just changed.\n\nIf you didn\'t make this change yourself, please contact an administrator right away.\n\n{site_name}\n{site_url}', NULL, 1710756332, 0),
(11, 1, 'y', 'forgot_username_instructions', 'Username information', 'email', 'members', 'Your username is: {username}\n\nIf you didn\'t request your username yourself, please contact an administrator right away.\n\n{site_name}\n{site_url}', NULL, 1710756332, 0),
(12, 1, 'y', 'email_changed_notification', 'Email address changed', 'email', 'members', 'Your email address has been changed, and this email address is no longer associated with your account.\n\nIf you didn\'t make this change yourself, please contact an administrator right away.\n\n{site_name}\n{site_url}', NULL, 1710756332, 0),
(13, 1, 'y', 'validated_member_notify', 'Your membership account has been activated', 'email', 'members', 'Your membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}', NULL, 1710756332, 0),
(14, 1, 'y', 'decline_member_validation', 'Your membership account has been declined', 'email', 'members', 'We\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}', NULL, 1710756332, 0),
(15, 1, 'y', 'comment_notification', 'Someone just responded to your comment', 'email', 'comments', '{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}', NULL, 1710756332, 0),
(16, 1, 'y', 'comments_opened_notification', 'New comments have been added', 'email', 'comments', 'Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment}\n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}', NULL, 1710756332, 0),
(17, 1, 'y', 'private_message_notification', 'Someone has sent you a Private Message', 'email', 'private_messages', '\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}', NULL, 1710756332, 0),
(18, 1, 'y', 'pm_inbox_full', 'Your private message mailbox is full', 'email', 'private_messages', '{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}', NULL, 1710756332, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_stats`
--

CREATE TABLE `exp_stats` (
  `stat_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `total_members` mediumint NOT NULL DEFAULT '0',
  `recent_member_id` int NOT NULL DEFAULT '0',
  `recent_member` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_entries` mediumint NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint NOT NULL DEFAULT '0',
  `total_comments` mediumint NOT NULL DEFAULT '0',
  `last_entry_date` int UNSIGNED NOT NULL DEFAULT '0',
  `last_forum_post_date` int UNSIGNED NOT NULL DEFAULT '0',
  `last_comment_date` int UNSIGNED NOT NULL DEFAULT '0',
  `last_visitor_date` int UNSIGNED NOT NULL DEFAULT '0',
  `most_visitors` mediumint NOT NULL DEFAULT '0',
  `most_visitor_date` int UNSIGNED NOT NULL DEFAULT '0',
  `last_cache_clear` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_stats`
--

INSERT INTO `exp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`) VALUES
(1, 1, 1, 1, 'Admin', 0, 0, 0, 0, 1710756332, 0, 0, 0, 0, 0, 1711361154);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_statuses`
--

CREATE TABLE `exp_statuses` (
  `status_id` int UNSIGNED NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_order` int UNSIGNED NOT NULL,
  `highlight` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_statuses`
--

INSERT INTO `exp_statuses` (`status_id`, `status`, `status_order`, `highlight`) VALUES
(1, 'open', 1, '009933'),
(2, 'closed', 2, '990000');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_statuses_roles`
--

CREATE TABLE `exp_statuses_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `status_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_statuses_roles`
--

INSERT INTO `exp_statuses_roles` (`role_id`, `status_id`) VALUES
(5, 1),
(5, 2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_templates`
--

CREATE TABLE `exp_templates` (
  `template_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int UNSIGNED NOT NULL,
  `template_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'webpage',
  `template_engine` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `template_notes` text COLLATE utf8mb4_unicode_ci,
  `edit_date` int NOT NULL DEFAULT '0',
  `last_author_id` int UNSIGNED NOT NULL DEFAULT '0',
  `cache` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `refresh` int UNSIGNED NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enable_http_auth` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `allow_php` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'o',
  `hits` int UNSIGNED NOT NULL DEFAULT '0',
  `protect_javascript` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `enable_frontedit` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_templates`
--

INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `template_type`, `template_engine`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`, `enable_frontedit`) VALUES
(1, 1, 1, 'sample-widget', 'webpage', NULL, '{widget title=\"Demo dashboard widget\" width=\"half\"}\n\n<p>Random entry: {exp:channel:entries dynamic=\"no\" orderby=\"random\" limit=\"1\"}<a href=\"{cp_url}?/cp/publish/edit/entry/{entry_id}&S={cp_session_id}\">{title}</a>{/exp:channel:entries}</p>\n\n<p>To see this code please visit the template <a href=\"{cp_url}?/cp/design/template/edit/1&S={cp_session_id}\">pro-dashboard-widgets/sample-widget</a>.</p>\n', NULL, 1710756339, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(2, 1, 2, 'index', 'webpage', NULL, '{layout=\"_layouts/.master\"}\n\n<div class=\"container-fluid\">\n  <div class=\"row\">\n      <div class=\"col-auto\">\n        <h1>Hello world</h1>\n      </div>\n  </div>\n</div>', NULL, 1710756888, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(3, 1, 3, '.master', 'webpage', NULL, '<!DOCTYPE html>\n<html lang=\"en\">\n\n<head>\n    <meta charset=\"utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, minimum-scale=1\">\n    {embed=\"_embeds/_seo\"\n        title=\"{layout:title}\"\n    }\n    {!-- FAVICON --}\n    {meta_favicon}\n\n    <link rel=\"stylesheet\" href=\"{exp:mix file=\'/assets/css/app.css\'}\">\n    <script src=\"{exp:mix file=\'/assets/js/app.js\'}\" defer></script>\n</head>\n\n<body>\n    {embed=\"_embeds/_navigation\"}\n    <main>\n    {layout:contents}\n    </main>\n</body>\n\n</html>', NULL, 1710756888, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(4, 1, 4, '_seo', 'webpage', NULL, '{exp:channel:entries\n    entry_id=\'{if \"{structure:page:entry_id}\" != \'\'}{structure:page:entry_id}{if:else}2{/if}\'\n    limit=\"1\"\n    dynamic=\"no\"\n}\n<title>{if \"{seo_title}\" != \"\"}{seo_title}{if:elseif \"{embed:title}\" != \"\"}{embed:title}{if:else}{title}{/if} - {site_name}</title>\n        {!-- custom_fields order: seo_description | body_intro | body --}\n        <meta name=\"description\" content=\'{if \"{seo_description}\" != \"\"}{seo_description}{if:elseif \"{body_intro}\" != \"\"}{body_intro word_limit=\"80\" strip_tags=\"yes\"}{if:elseif \"{body}\" != \"\"}{body word_limit=\"80\" strip_tags=\"yes\"}{if:else}{meta_default_seo_description}{/if}\'>\n        {if \"{seo_author}\" != \"\"}<meta name=\"author\" content=\"{seo_author}\" />{/if}\n        <link rel=\"canonical\" href=\"{current_url}\" />\n        {!-- FALLBACK TO NOINDEX,NOFOLLOW IF IT\'S NOT A PRODUCTION SITE --}\n        <meta name=\"robots\" content=\"{if global:env == \'production\'}{if seo_robots}{seo_robots:value}{if:else}index,follow{/if}{if:else}noindex,nofollow{/if}\" />\n        \n        <!-- Open Graph -->\n        <meta property=\"og:site_name\" content=\"{site_name}\" />\n        <meta property=\"og:title\" content=\'{if \"{seo_title}\" != \"\"}{seo_title}{if:elseif \"{embed:title}\" != \"\"}{embed:title}{if:elseif \"{structure:page:entry_id}\"  != \"\"}{title}{if:else}{title}{/if} - {site_name}\' />\n        <meta property=\"og:description\" content=\'{if \"{seo_description}\" != \"\"}{seo_description}{if:elseif \"{body_intro}\" != \"\"}{body_intro word_limit=\"80\" strip_tags=\"yes\"}{if:elseif \"{body}\" != \"\"}{body word_limit=\"80\" strip_tags=\"yes\"}{if:else}{meta_default_seo_description}{/if}\' />\n        <meta property=\"og:url\" content=\"{current_url}\" />\n        <meta property=\"og:image\" content=\'{if \"{seo_image:seo}\" != \"\"}{seo_image:seo}{if:elseif \"{image:seo}\" != \"\"}{image:seo}{if:elseif gallery}{gallery limit=\"1\"}{gallery:file:seo}{/gallery}{if:else}{meta_default_seo_image}{/if}\' />\n        \n        <!-- Twitter Card -->\n        <meta name=\"twitter:card\" content=\"summary_large_image\" />\n        <meta property=\"twitter:title\" content=\'{if \"{seo_title}\" != \"\"}{seo_title}{if:elseif \"{embed:title}\" != \"\"}{embed:title}{if:elseif \"{structure:page:entry_id}\"  != \"\"}{title}{if:else}{title}{/if} - {site_name}\' />\n        <meta property=\"twitter:description\" content=\'{if \"{seo_description}\" != \"\"}{seo_description}{if:elseif \"{body_intro}\" != \"\"}{body_intro word_limit=\"80\" strip_tags=\"yes\"}{if:elseif \"{body}\" != \"\"}{body word_limit=\"80\" strip_tags=\"yes\"}{if:else}{meta_default_seo_description}{/if}\' />\n        <meta property=\"twitter:image\" content=\'{if \"{seo_image:seo}\" != \"\"}{seo_image:seo}{if:elseif \"{image:seo}\" != \"\"}{image:seo}{if:elseif gallery}{gallery limit=\"1\"}{gallery:file:seo}{/gallery}{if:else}{meta_default_seo_image}{/if}\' />\n{/exp:channel:entries}', NULL, 1710757272, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(5, 1, 4, 'index', 'webpage', NULL, '', NULL, 1710757282, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(6, 1, 3, 'index', 'webpage', NULL, '', NULL, 1710757282, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y'),
(7, 1, 1, 'index', 'webpage', NULL, '', NULL, 1710757282, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n', 'y');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_templates_roles`
--

CREATE TABLE `exp_templates_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `template_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_templates_roles`
--

INSERT INTO `exp_templates_roles` (`role_id`, `template_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 5),
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(5, 6),
(1, 7),
(2, 7),
(3, 7),
(4, 7),
(5, 7);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_template_groups`
--

CREATE TABLE `exp_template_groups` (
  `group_id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_order` int UNSIGNED NOT NULL,
  `is_site_default` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_template_groups`
--

INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`) VALUES
(1, 1, 'pro-dashboard-widgets', 1, 'n'),
(2, 1, 'site', 2, 'n'),
(3, 1, '_layouts', 3, 'n'),
(4, 1, '_embeds', 4, 'n');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_template_groups_roles`
--

CREATE TABLE `exp_template_groups_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `template_group_id` mediumint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_template_routes`
--

CREATE TABLE `exp_template_routes` (
  `route_id` int UNSIGNED NOT NULL,
  `template_id` int UNSIGNED NOT NULL,
  `order` int UNSIGNED DEFAULT NULL,
  `route` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_parsed` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_throttle`
--

CREATE TABLE `exp_throttle` (
  `throttle_id` int UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `last_activity` int UNSIGNED NOT NULL DEFAULT '0',
  `hits` int UNSIGNED NOT NULL,
  `locked_out` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_update_log`
--

CREATE TABLE `exp_update_log` (
  `log_id` int UNSIGNED NOT NULL,
  `timestamp` int UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line` int UNSIGNED DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_update_log`
--

INSERT INTO `exp_update_log` (`log_id`, `timestamp`, `message`, `method`, `line`, `file`) VALUES
(1, 1710756332, 'Smartforge::add_key failed. Table \'exp_comments\' does not exist.', 'Smartforge::add_key', 106, '/var/www/system/ee/ExpressionEngine/Addons/comment/upd.comment.php'),
(2, 1710756332, 'Smartforge::add_key failed. Table \'exp_dock_prolets\' does not exist.', 'Smartforge::add_key', 210, '/var/www/system/ee/ExpressionEngine/Addons/pro/upd.pro.php');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_upload_prefs`
--

CREATE TABLE `exp_upload_prefs` (
  `id` int UNSIGNED NOT NULL,
  `site_id` int UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adapter` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `adapter_settings` text COLLATE utf8mb4_unicode_ci,
  `server_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_types` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'img',
  `allow_subfolders` enum('y','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `subfolders_on_top` enum('y','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `default_modal_view` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'list',
  `max_size` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_height` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_width` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pre_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_properties` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_pre_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_post_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `exp_upload_prefs`
--

INSERT INTO `exp_upload_prefs` (`id`, `site_id`, `name`, `adapter`, `adapter_settings`, `server_path`, `url`, `allowed_types`, `allow_subfolders`, `subfolders_on_top`, `default_modal_view`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`, `cat_group`, `batch_location`, `module_id`) VALUES
(1, 1, 'Avatars', 'local', NULL, '{base_path}images/avatars/', '{base_url}images/avatars/', 'img', 'n', 'y', 'list', '50', '100', '100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2, 1, 'Signature Attachments', 'local', NULL, '{base_path}images/signature_attachments/', '{base_url}images/signature_attachments/', 'img', 'n', 'y', 'list', '30', '80', '480', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(3, 1, 'PM Attachments', 'local', NULL, '{base_path}images/pm_attachments/', '{base_url}images/pm_attachments/', 'img', 'n', 'y', 'list', '250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_upload_prefs_category_groups`
--

CREATE TABLE `exp_upload_prefs_category_groups` (
  `upload_location_id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exp_upload_prefs_roles`
--

CREATE TABLE `exp_upload_prefs_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `upload_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `exp_actions`
--
ALTER TABLE `exp_actions`
  ADD PRIMARY KEY (`action_id`);

--
-- Indexen voor tabel `exp_captcha`
--
ALTER TABLE `exp_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexen voor tabel `exp_categories`
--
ALTER TABLE `exp_categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `cat_name` (`cat_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_category_fields`
--
ALTER TABLE `exp_category_fields`
  ADD PRIMARY KEY (`field_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexen voor tabel `exp_category_field_data`
--
ALTER TABLE `exp_category_field_data`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexen voor tabel `exp_category_groups`
--
ALTER TABLE `exp_category_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_category_group_settings`
--
ALTER TABLE `exp_category_group_settings`
  ADD PRIMARY KEY (`category_group_settings_id`),
  ADD KEY `channel_id_group_id` (`channel_id`,`group_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexen voor tabel `exp_category_posts`
--
ALTER TABLE `exp_category_posts`
  ADD PRIMARY KEY (`entry_id`,`cat_id`);

--
-- Indexen voor tabel `exp_channels`
--
ALTER TABLE `exp_channels`
  ADD PRIMARY KEY (`channel_id`),
  ADD KEY `cat_group` (`cat_group`(191)),
  ADD KEY `channel_name` (`channel_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_channels_channel_fields`
--
ALTER TABLE `exp_channels_channel_fields`
  ADD PRIMARY KEY (`channel_id`,`field_id`);

--
-- Indexen voor tabel `exp_channels_channel_field_groups`
--
ALTER TABLE `exp_channels_channel_field_groups`
  ADD PRIMARY KEY (`channel_id`,`group_id`);

--
-- Indexen voor tabel `exp_channels_statuses`
--
ALTER TABLE `exp_channels_statuses`
  ADD PRIMARY KEY (`channel_id`,`status_id`);

--
-- Indexen voor tabel `exp_channel_category_groups`
--
ALTER TABLE `exp_channel_category_groups`
  ADD PRIMARY KEY (`channel_id`,`group_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexen voor tabel `exp_channel_data`
--
ALTER TABLE `exp_channel_data`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_channel_entries_autosave`
--
ALTER TABLE `exp_channel_entries_autosave`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `url_title` (`url_title`(191)),
  ADD KEY `status` (`status`),
  ADD KEY `entry_date` (`entry_date`),
  ADD KEY `expiration_date` (`expiration_date`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_channel_entry_hidden_fields`
--
ALTER TABLE `exp_channel_entry_hidden_fields`
  ADD PRIMARY KEY (`entry_id`,`field_id`);

--
-- Indexen voor tabel `exp_channel_fields`
--
ALTER TABLE `exp_channel_fields`
  ADD PRIMARY KEY (`field_id`),
  ADD KEY `field_type` (`field_type`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_channel_field_groups_fields`
--
ALTER TABLE `exp_channel_field_groups_fields`
  ADD PRIMARY KEY (`field_id`,`group_id`);

--
-- Indexen voor tabel `exp_channel_form_settings`
--
ALTER TABLE `exp_channel_form_settings`
  ADD PRIMARY KEY (`channel_form_settings_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexen voor tabel `exp_channel_member_roles`
--
ALTER TABLE `exp_channel_member_roles`
  ADD PRIMARY KEY (`role_id`,`channel_id`);

--
-- Indexen voor tabel `exp_channel_titles`
--
ALTER TABLE `exp_channel_titles`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `url_title` (`url_title`(191)),
  ADD KEY `status` (`status`),
  ADD KEY `entry_date` (`entry_date`),
  ADD KEY `expiration_date` (`expiration_date`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `sticky_date_id_idx` (`sticky`,`entry_date`,`entry_id`);

--
-- Indexen voor tabel `exp_comments`
--
ALTER TABLE `exp_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `entry_id_channel_id_author_id_status_site_id` (`entry_id`,`channel_id`,`author_id`,`status`,`site_id`);

--
-- Indexen voor tabel `exp_comment_subscriptions`
--
ALTER TABLE `exp_comment_subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD KEY `entry_id_member_id` (`entry_id`,`member_id`);

--
-- Indexen voor tabel `exp_config`
--
ALTER TABLE `exp_config`
  ADD PRIMARY KEY (`config_id`),
  ADD KEY `site_key` (`site_id`,`key`);

--
-- Indexen voor tabel `exp_consents`
--
ALTER TABLE `exp_consents`
  ADD PRIMARY KEY (`consent_id`),
  ADD KEY `consent_request_version_id` (`consent_request_version_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexen voor tabel `exp_consent_audit_log`
--
ALTER TABLE `exp_consent_audit_log`
  ADD PRIMARY KEY (`consent_audit_id`),
  ADD KEY `consent_request_id` (`consent_request_id`),
  ADD KEY `consent_request_version_id` (`consent_request_version_id`);

--
-- Indexen voor tabel `exp_consent_requests`
--
ALTER TABLE `exp_consent_requests`
  ADD PRIMARY KEY (`consent_request_id`);

--
-- Indexen voor tabel `exp_consent_request_versions`
--
ALTER TABLE `exp_consent_request_versions`
  ADD PRIMARY KEY (`consent_request_version_id`),
  ADD KEY `consent_request_id` (`consent_request_id`);

--
-- Indexen voor tabel `exp_consent_request_version_cookies`
--
ALTER TABLE `exp_consent_request_version_cookies`
  ADD PRIMARY KEY (`consent_request_version_cookies_id`),
  ADD KEY `consent_request_version_cookies` (`consent_request_version_id`,`cookie_id`);

--
-- Indexen voor tabel `exp_content_types`
--
ALTER TABLE `exp_content_types`
  ADD PRIMARY KEY (`content_type_id`),
  ADD KEY `name` (`name`);

--
-- Indexen voor tabel `exp_cookie_settings`
--
ALTER TABLE `exp_cookie_settings`
  ADD PRIMARY KEY (`cookie_id`);

--
-- Indexen voor tabel `exp_cp_log`
--
ALTER TABLE `exp_cp_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_dashboard_layouts`
--
ALTER TABLE `exp_dashboard_layouts`
  ADD PRIMARY KEY (`layout_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexen voor tabel `exp_dashboard_layout_widgets`
--
ALTER TABLE `exp_dashboard_layout_widgets`
  ADD PRIMARY KEY (`dashboard_layout_widgets_id`),
  ADD KEY `layouts_widgets` (`layout_id`,`widget_id`);

--
-- Indexen voor tabel `exp_dashboard_widgets`
--
ALTER TABLE `exp_dashboard_widgets`
  ADD PRIMARY KEY (`widget_id`);

--
-- Indexen voor tabel `exp_developer_log`
--
ALTER TABLE `exp_developer_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexen voor tabel `exp_docks`
--
ALTER TABLE `exp_docks`
  ADD PRIMARY KEY (`dock_id`);

--
-- Indexen voor tabel `exp_dock_prolets`
--
ALTER TABLE `exp_dock_prolets`
  ADD PRIMARY KEY (`dock_prolets_id`);

--
-- Indexen voor tabel `exp_email_cache`
--
ALTER TABLE `exp_email_cache`
  ADD PRIMARY KEY (`cache_id`);

--
-- Indexen voor tabel `exp_email_cache_mg`
--
ALTER TABLE `exp_email_cache_mg`
  ADD PRIMARY KEY (`cache_id`,`role_id`);

--
-- Indexen voor tabel `exp_email_cache_ml`
--
ALTER TABLE `exp_email_cache_ml`
  ADD PRIMARY KEY (`cache_id`,`list_id`);

--
-- Indexen voor tabel `exp_email_console_cache`
--
ALTER TABLE `exp_email_console_cache`
  ADD PRIMARY KEY (`cache_id`);

--
-- Indexen voor tabel `exp_entry_manager_views`
--
ALTER TABLE `exp_entry_manager_views`
  ADD PRIMARY KEY (`view_id`),
  ADD KEY `channel_id_member_id` (`channel_id`,`member_id`);

--
-- Indexen voor tabel `exp_entry_versioning`
--
ALTER TABLE `exp_entry_versioning`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexen voor tabel `exp_extensions`
--
ALTER TABLE `exp_extensions`
  ADD PRIMARY KEY (`extension_id`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexen voor tabel `exp_fieldtypes`
--
ALTER TABLE `exp_fieldtypes`
  ADD PRIMARY KEY (`fieldtype_id`);

--
-- Indexen voor tabel `exp_field_conditions`
--
ALTER TABLE `exp_field_conditions`
  ADD PRIMARY KEY (`condition_id`),
  ADD KEY `condition_set_id` (`condition_set_id`),
  ADD KEY `condition_field_id` (`condition_field_id`);

--
-- Indexen voor tabel `exp_field_condition_sets`
--
ALTER TABLE `exp_field_condition_sets`
  ADD PRIMARY KEY (`condition_set_id`);

--
-- Indexen voor tabel `exp_field_condition_sets_channel_fields`
--
ALTER TABLE `exp_field_condition_sets_channel_fields`
  ADD PRIMARY KEY (`condition_set_id`,`field_id`);

--
-- Indexen voor tabel `exp_field_groups`
--
ALTER TABLE `exp_field_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_files`
--
ALTER TABLE `exp_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `model_type` (`model_type`),
  ADD KEY `upload_location_id` (`upload_location_id`),
  ADD KEY `directory_id` (`directory_id`),
  ADD KEY `file_type` (`file_type`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_file_categories`
--
ALTER TABLE `exp_file_categories`
  ADD PRIMARY KEY (`file_id`,`cat_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexen voor tabel `exp_file_data`
--
ALTER TABLE `exp_file_data`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexen voor tabel `exp_file_dimensions`
--
ALTER TABLE `exp_file_dimensions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_location_id` (`upload_location_id`);

--
-- Indexen voor tabel `exp_file_manager_views`
--
ALTER TABLE `exp_file_manager_views`
  ADD PRIMARY KEY (`view_id`),
  ADD KEY `viewtype_upload_id_member_id` (`viewtype`,`upload_id`,`member_id`);

--
-- Indexen voor tabel `exp_file_usage`
--
ALTER TABLE `exp_file_usage`
  ADD PRIMARY KEY (`file_usage_id`),
  ADD KEY `file_id` (`file_id`),
  ADD KEY `entry_id` (`entry_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexen voor tabel `exp_file_watermarks`
--
ALTER TABLE `exp_file_watermarks`
  ADD PRIMARY KEY (`wm_id`);

--
-- Indexen voor tabel `exp_fluid_field_data`
--
ALTER TABLE `exp_fluid_field_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fluid_field_id_entry_id` (`fluid_field_id`,`entry_id`);

--
-- Indexen voor tabel `exp_global_variables`
--
ALTER TABLE `exp_global_variables`
  ADD PRIMARY KEY (`variable_id`),
  ADD KEY `variable_name` (`variable_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_grid_columns`
--
ALTER TABLE `exp_grid_columns`
  ADD PRIMARY KEY (`col_id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexen voor tabel `exp_html_buttons`
--
ALTER TABLE `exp_html_buttons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_layout_publish`
--
ALTER TABLE `exp_layout_publish`
  ADD PRIMARY KEY (`layout_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexen voor tabel `exp_layout_publish_member_roles`
--
ALTER TABLE `exp_layout_publish_member_roles`
  ADD PRIMARY KEY (`layout_id`,`role_id`);

--
-- Indexen voor tabel `exp_members`
--
ALTER TABLE `exp_members`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `unique_id` (`unique_id`),
  ADD KEY `password` (`password`);

--
-- Indexen voor tabel `exp_members_roles`
--
ALTER TABLE `exp_members_roles`
  ADD PRIMARY KEY (`member_id`,`role_id`);

--
-- Indexen voor tabel `exp_members_role_groups`
--
ALTER TABLE `exp_members_role_groups`
  ADD PRIMARY KEY (`member_id`,`group_id`);

--
-- Indexen voor tabel `exp_member_bulletin_board`
--
ALTER TABLE `exp_member_bulletin_board`
  ADD PRIMARY KEY (`bulletin_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `hash` (`hash`);

--
-- Indexen voor tabel `exp_member_data`
--
ALTER TABLE `exp_member_data`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexen voor tabel `exp_member_fields`
--
ALTER TABLE `exp_member_fields`
  ADD PRIMARY KEY (`m_field_id`);

--
-- Indexen voor tabel `exp_member_manager_views`
--
ALTER TABLE `exp_member_manager_views`
  ADD PRIMARY KEY (`view_id`),
  ADD KEY `role_id_member_id` (`role_id`,`member_id`);

--
-- Indexen voor tabel `exp_member_news_views`
--
ALTER TABLE `exp_member_news_views`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexen voor tabel `exp_member_relationships`
--
ALTER TABLE `exp_member_relationships`
  ADD PRIMARY KEY (`relationship_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `child_id` (`child_id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `fluid_field_data_id` (`fluid_field_data_id`),
  ADD KEY `grid_row_id` (`grid_row_id`);

--
-- Indexen voor tabel `exp_member_search`
--
ALTER TABLE `exp_member_search`
  ADD PRIMARY KEY (`search_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_menu_items`
--
ALTER TABLE `exp_menu_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `set_id` (`set_id`);

--
-- Indexen voor tabel `exp_menu_sets`
--
ALTER TABLE `exp_menu_sets`
  ADD PRIMARY KEY (`set_id`);

--
-- Indexen voor tabel `exp_message_attachments`
--
ALTER TABLE `exp_message_attachments`
  ADD PRIMARY KEY (`attachment_id`);

--
-- Indexen voor tabel `exp_message_copies`
--
ALTER TABLE `exp_message_copies`
  ADD PRIMARY KEY (`copy_id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexen voor tabel `exp_message_data`
--
ALTER TABLE `exp_message_data`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexen voor tabel `exp_message_folders`
--
ALTER TABLE `exp_message_folders`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexen voor tabel `exp_message_listed`
--
ALTER TABLE `exp_message_listed`
  ADD PRIMARY KEY (`listed_id`);

--
-- Indexen voor tabel `exp_migrations`
--
ALTER TABLE `exp_migrations`
  ADD PRIMARY KEY (`migration_id`);

--
-- Indexen voor tabel `exp_modules`
--
ALTER TABLE `exp_modules`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexen voor tabel `exp_module_member_roles`
--
ALTER TABLE `exp_module_member_roles`
  ADD PRIMARY KEY (`role_id`,`module_id`);

--
-- Indexen voor tabel `exp_online_users`
--
ALTER TABLE `exp_online_users`
  ADD PRIMARY KEY (`online_id`),
  ADD KEY `date` (`date`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_password_lockout`
--
ALTER TABLE `exp_password_lockout`
  ADD PRIMARY KEY (`lockout_id`),
  ADD KEY `login_date` (`login_date`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `user_agent` (`user_agent`);

--
-- Indexen voor tabel `exp_permissions`
--
ALTER TABLE `exp_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `role_id_site_id` (`role_id`,`site_id`);

--
-- Indexen voor tabel `exp_plugins`
--
ALTER TABLE `exp_plugins`
  ADD PRIMARY KEY (`plugin_id`);

--
-- Indexen voor tabel `exp_prolets`
--
ALTER TABLE `exp_prolets`
  ADD PRIMARY KEY (`prolet_id`);

--
-- Indexen voor tabel `exp_relationships`
--
ALTER TABLE `exp_relationships`
  ADD PRIMARY KEY (`relationship_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `child_id` (`child_id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `fluid_field_data_id` (`fluid_field_data_id`),
  ADD KEY `grid_row_id` (`grid_row_id`);

--
-- Indexen voor tabel `exp_remember_me`
--
ALTER TABLE `exp_remember_me`
  ADD PRIMARY KEY (`remember_me_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexen voor tabel `exp_reset_password`
--
ALTER TABLE `exp_reset_password`
  ADD PRIMARY KEY (`reset_id`);

--
-- Indexen voor tabel `exp_revision_tracker`
--
ALTER TABLE `exp_revision_tracker`
  ADD PRIMARY KEY (`tracker_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexen voor tabel `exp_roles`
--
ALTER TABLE `exp_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexen voor tabel `exp_roles_role_groups`
--
ALTER TABLE `exp_roles_role_groups`
  ADD PRIMARY KEY (`role_id`,`group_id`),
  ADD KEY `group_id_idx` (`group_id`);

--
-- Indexen voor tabel `exp_role_groups`
--
ALTER TABLE `exp_role_groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexen voor tabel `exp_role_settings`
--
ALTER TABLE `exp_role_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id_site_id` (`role_id`,`site_id`);

--
-- Indexen voor tabel `exp_rte_toolsets`
--
ALTER TABLE `exp_rte_toolsets`
  ADD PRIMARY KEY (`toolset_id`);

--
-- Indexen voor tabel `exp_search`
--
ALTER TABLE `exp_search`
  ADD PRIMARY KEY (`search_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_search_log`
--
ALTER TABLE `exp_search_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_security_hashes`
--
ALTER TABLE `exp_security_hashes`
  ADD PRIMARY KEY (`hash_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexen voor tabel `exp_sessions`
--
ALTER TABLE `exp_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexen voor tabel `exp_sites`
--
ALTER TABLE `exp_sites`
  ADD PRIMARY KEY (`site_id`),
  ADD KEY `site_name` (`site_name`);

--
-- Indexen voor tabel `exp_snippets`
--
ALTER TABLE `exp_snippets`
  ADD PRIMARY KEY (`snippet_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_specialty_templates`
--
ALTER TABLE `exp_specialty_templates`
  ADD PRIMARY KEY (`template_id`),
  ADD KEY `template_name` (`template_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_stats`
--
ALTER TABLE `exp_stats`
  ADD PRIMARY KEY (`stat_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_statuses`
--
ALTER TABLE `exp_statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexen voor tabel `exp_statuses_roles`
--
ALTER TABLE `exp_statuses_roles`
  ADD PRIMARY KEY (`status_id`,`role_id`);

--
-- Indexen voor tabel `exp_templates`
--
ALTER TABLE `exp_templates`
  ADD PRIMARY KEY (`template_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `template_name` (`template_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_templates_roles`
--
ALTER TABLE `exp_templates_roles`
  ADD PRIMARY KEY (`template_id`,`role_id`);

--
-- Indexen voor tabel `exp_template_groups`
--
ALTER TABLE `exp_template_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `group_name_idx` (`group_name`),
  ADD KEY `group_order_idx` (`group_order`);

--
-- Indexen voor tabel `exp_template_groups_roles`
--
ALTER TABLE `exp_template_groups_roles`
  ADD PRIMARY KEY (`role_id`,`template_group_id`);

--
-- Indexen voor tabel `exp_template_routes`
--
ALTER TABLE `exp_template_routes`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `template_id` (`template_id`);

--
-- Indexen voor tabel `exp_throttle`
--
ALTER TABLE `exp_throttle`
  ADD PRIMARY KEY (`throttle_id`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `last_activity` (`last_activity`);

--
-- Indexen voor tabel `exp_update_log`
--
ALTER TABLE `exp_update_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexen voor tabel `exp_upload_prefs`
--
ALTER TABLE `exp_upload_prefs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexen voor tabel `exp_upload_prefs_category_groups`
--
ALTER TABLE `exp_upload_prefs_category_groups`
  ADD PRIMARY KEY (`upload_location_id`,`group_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexen voor tabel `exp_upload_prefs_roles`
--
ALTER TABLE `exp_upload_prefs_roles`
  ADD PRIMARY KEY (`upload_id`,`role_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `exp_actions`
--
ALTER TABLE `exp_actions`
  MODIFY `action_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT voor een tabel `exp_captcha`
--
ALTER TABLE `exp_captcha`
  MODIFY `captcha_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_categories`
--
ALTER TABLE `exp_categories`
  MODIFY `cat_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_category_fields`
--
ALTER TABLE `exp_category_fields`
  MODIFY `field_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_category_groups`
--
ALTER TABLE `exp_category_groups`
  MODIFY `group_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_category_group_settings`
--
ALTER TABLE `exp_category_group_settings`
  MODIFY `category_group_settings_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_channels`
--
ALTER TABLE `exp_channels`
  MODIFY `channel_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_channel_entries_autosave`
--
ALTER TABLE `exp_channel_entries_autosave`
  MODIFY `entry_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_channel_fields`
--
ALTER TABLE `exp_channel_fields`
  MODIFY `field_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_channel_form_settings`
--
ALTER TABLE `exp_channel_form_settings`
  MODIFY `channel_form_settings_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_channel_titles`
--
ALTER TABLE `exp_channel_titles`
  MODIFY `entry_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_comments`
--
ALTER TABLE `exp_comments`
  MODIFY `comment_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_comment_subscriptions`
--
ALTER TABLE `exp_comment_subscriptions`
  MODIFY `subscription_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_config`
--
ALTER TABLE `exp_config`
  MODIFY `config_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT voor een tabel `exp_consents`
--
ALTER TABLE `exp_consents`
  MODIFY `consent_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_consent_audit_log`
--
ALTER TABLE `exp_consent_audit_log`
  MODIFY `consent_audit_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_consent_requests`
--
ALTER TABLE `exp_consent_requests`
  MODIFY `consent_request_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `exp_consent_request_versions`
--
ALTER TABLE `exp_consent_request_versions`
  MODIFY `consent_request_version_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `exp_consent_request_version_cookies`
--
ALTER TABLE `exp_consent_request_version_cookies`
  MODIFY `consent_request_version_cookies_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_content_types`
--
ALTER TABLE `exp_content_types`
  MODIFY `content_type_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `exp_cookie_settings`
--
ALTER TABLE `exp_cookie_settings`
  MODIFY `cookie_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT voor een tabel `exp_cp_log`
--
ALTER TABLE `exp_cp_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `exp_dashboard_layouts`
--
ALTER TABLE `exp_dashboard_layouts`
  MODIFY `layout_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_dashboard_layout_widgets`
--
ALTER TABLE `exp_dashboard_layout_widgets`
  MODIFY `dashboard_layout_widgets_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_dashboard_widgets`
--
ALTER TABLE `exp_dashboard_widgets`
  MODIFY `widget_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `exp_developer_log`
--
ALTER TABLE `exp_developer_log`
  MODIFY `log_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_docks`
--
ALTER TABLE `exp_docks`
  MODIFY `dock_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `exp_dock_prolets`
--
ALTER TABLE `exp_dock_prolets`
  MODIFY `dock_prolets_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `exp_email_cache`
--
ALTER TABLE `exp_email_cache`
  MODIFY `cache_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_email_console_cache`
--
ALTER TABLE `exp_email_console_cache`
  MODIFY `cache_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_entry_manager_views`
--
ALTER TABLE `exp_entry_manager_views`
  MODIFY `view_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_entry_versioning`
--
ALTER TABLE `exp_entry_versioning`
  MODIFY `version_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_extensions`
--
ALTER TABLE `exp_extensions`
  MODIFY `extension_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `exp_fieldtypes`
--
ALTER TABLE `exp_fieldtypes`
  MODIFY `fieldtype_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT voor een tabel `exp_field_conditions`
--
ALTER TABLE `exp_field_conditions`
  MODIFY `condition_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_field_condition_sets`
--
ALTER TABLE `exp_field_condition_sets`
  MODIFY `condition_set_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_field_groups`
--
ALTER TABLE `exp_field_groups`
  MODIFY `group_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_files`
--
ALTER TABLE `exp_files`
  MODIFY `file_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_file_dimensions`
--
ALTER TABLE `exp_file_dimensions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_file_manager_views`
--
ALTER TABLE `exp_file_manager_views`
  MODIFY `view_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_file_usage`
--
ALTER TABLE `exp_file_usage`
  MODIFY `file_usage_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_file_watermarks`
--
ALTER TABLE `exp_file_watermarks`
  MODIFY `wm_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_fluid_field_data`
--
ALTER TABLE `exp_fluid_field_data`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_global_variables`
--
ALTER TABLE `exp_global_variables`
  MODIFY `variable_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_grid_columns`
--
ALTER TABLE `exp_grid_columns`
  MODIFY `col_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_html_buttons`
--
ALTER TABLE `exp_html_buttons`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `exp_layout_publish`
--
ALTER TABLE `exp_layout_publish`
  MODIFY `layout_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_members`
--
ALTER TABLE `exp_members`
  MODIFY `member_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `exp_member_bulletin_board`
--
ALTER TABLE `exp_member_bulletin_board`
  MODIFY `bulletin_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_member_fields`
--
ALTER TABLE `exp_member_fields`
  MODIFY `m_field_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_member_manager_views`
--
ALTER TABLE `exp_member_manager_views`
  MODIFY `view_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_member_news_views`
--
ALTER TABLE `exp_member_news_views`
  MODIFY `news_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `exp_member_relationships`
--
ALTER TABLE `exp_member_relationships`
  MODIFY `relationship_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_menu_items`
--
ALTER TABLE `exp_menu_items`
  MODIFY `item_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_menu_sets`
--
ALTER TABLE `exp_menu_sets`
  MODIFY `set_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `exp_message_attachments`
--
ALTER TABLE `exp_message_attachments`
  MODIFY `attachment_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_message_copies`
--
ALTER TABLE `exp_message_copies`
  MODIFY `copy_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_message_data`
--
ALTER TABLE `exp_message_data`
  MODIFY `message_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_message_listed`
--
ALTER TABLE `exp_message_listed`
  MODIFY `listed_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_migrations`
--
ALTER TABLE `exp_migrations`
  MODIFY `migration_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_modules`
--
ALTER TABLE `exp_modules`
  MODIFY `module_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT voor een tabel `exp_online_users`
--
ALTER TABLE `exp_online_users`
  MODIFY `online_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_password_lockout`
--
ALTER TABLE `exp_password_lockout`
  MODIFY `lockout_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_permissions`
--
ALTER TABLE `exp_permissions`
  MODIFY `permission_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT voor een tabel `exp_plugins`
--
ALTER TABLE `exp_plugins`
  MODIFY `plugin_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `exp_prolets`
--
ALTER TABLE `exp_prolets`
  MODIFY `prolet_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `exp_relationships`
--
ALTER TABLE `exp_relationships`
  MODIFY `relationship_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_reset_password`
--
ALTER TABLE `exp_reset_password`
  MODIFY `reset_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_revision_tracker`
--
ALTER TABLE `exp_revision_tracker`
  MODIFY `tracker_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `exp_roles`
--
ALTER TABLE `exp_roles`
  MODIFY `role_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `exp_role_groups`
--
ALTER TABLE `exp_role_groups`
  MODIFY `group_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_role_settings`
--
ALTER TABLE `exp_role_settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `exp_rte_toolsets`
--
ALTER TABLE `exp_rte_toolsets`
  MODIFY `toolset_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `exp_search_log`
--
ALTER TABLE `exp_search_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_security_hashes`
--
ALTER TABLE `exp_security_hashes`
  MODIFY `hash_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `exp_sites`
--
ALTER TABLE `exp_sites`
  MODIFY `site_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `exp_snippets`
--
ALTER TABLE `exp_snippets`
  MODIFY `snippet_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `exp_specialty_templates`
--
ALTER TABLE `exp_specialty_templates`
  MODIFY `template_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT voor een tabel `exp_stats`
--
ALTER TABLE `exp_stats`
  MODIFY `stat_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `exp_statuses`
--
ALTER TABLE `exp_statuses`
  MODIFY `status_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `exp_templates`
--
ALTER TABLE `exp_templates`
  MODIFY `template_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `exp_template_groups`
--
ALTER TABLE `exp_template_groups`
  MODIFY `group_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `exp_template_routes`
--
ALTER TABLE `exp_template_routes`
  MODIFY `route_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_throttle`
--
ALTER TABLE `exp_throttle`
  MODIFY `throttle_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `exp_update_log`
--
ALTER TABLE `exp_update_log`
  MODIFY `log_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `exp_upload_prefs`
--
ALTER TABLE `exp_upload_prefs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
