<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

// ExpressionEngine Config Items
// Find more configs and overrides at
// https://docs.expressionengine.com/latest/general/system-configuration-overrides.html

$config['app_version'] = '7.4.4';
$config['encryption_key'] = 'a0aadbd776c327b8aac9bb618b6342c4de4b2542';
$config['session_crypt_key'] = 'a5d2ff1a8da4cfcd751d1df35b8a3e798ba50cd4';
$config['database'] = array(
	'expressionengine' => array(
		'hostname' => 'mysql',
		'database' => 'database',
		'username' => 'admin',
		'password' => 'admin',
		'dbprefix' => 'exp_',
		'char_set' => 'utf8mb4',
		'dbcollat' => 'utf8mb4_unicode_ci',
		'port'     => ''
	),
);
$config['show_ee_news'] = 'y';


include SYSPATH.'/../config.php';

// EOF