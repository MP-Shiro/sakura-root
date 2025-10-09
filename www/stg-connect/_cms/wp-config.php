<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'stg-connect' );

/** Database username */
define( 'DB_USER', 'stg-connect' );

/** Database password */
define( 'DB_PASSWORD', 'asfkjHadsfASd78' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'ZT>>>NBb0aLy-z9pzXOUr#T0kOwDFY-|{S&ISZT%>P-}Y^kh)4c5m5XXlWa4O,d!');
define('SECURE_AUTH_KEY',  'TpXk|FId}2c1X_#1wZ >RWN3R?.64Gp,Bji,E #-}#!klVxm|j9W9F-)94l(hg20');
define('LOGGED_IN_KEY',    '@#+/&zElgzw`#eG$KReh}}M;mESz}nA!/szR0xDOt|5N%YTJ|*UkQGnmAXPAEX+&');
define('NONCE_KEY',        '2{ap)ic^TgQfBo&j>jjB:L:qkavV93|;K}>];aS:IB6yl(U-B]LKtiI-&&;{b||6');
define('AUTH_SALT',        'X[r+^_>WhvNF1,nn-Cy3haBey`;|ZabYyX0O7Rmtm?N.0uk(%,_^ls Jts7[67pq');
define('SECURE_AUTH_SALT', 'ZxE`67{y-,b-FZMw#=y}(OCYJ|S,gGJ+e-7JBI.K=D}P{FW}CxN+|pZ4+<k;!Mb$');
define('LOGGED_IN_SALT',   '?Plf(X!K_PtNKj+_<%>YFQl+;+3xpo0Z00:YY|(.$$zsM}D!e7?8(:Fl]ez3P2UU');
define('NONCE_SALT',       'zg| m*sb.&=&kSqAtCZccmr(}V;|zou+C1BP2%8#wb-3N2|tIEWYmm&JAa$Ss9=@');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_stgconnectdb_';

/**
 * ローカル言語 - このパッケージでは初期値として 'ja' (日本語 UTF-8) が設定されています。
 *
 * WordPress のローカル言語を設定します。設定した言語に対応する MO ファイルが
 * wp-content/languages にインストールされている必要があります。例えば de_DE.mo を
 * wp-content/languages にインストールし WPLANG を 'de_DE' に設定することでドイツ語がサポートされます。
 */
define('WPLANG', 'ja');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
