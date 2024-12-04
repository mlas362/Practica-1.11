<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'WordPress' );

/** Database username */
define( 'DB_USER', 'wp_user' );

/** Database password */
define( 'DB_PASSWORD', 'wp_pass' );

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
define( 'AUTH_KEY',          '+*dk@MqI:>u0yE;1=DLy>Xj4o#Sr#{]A{nC^SRWsiO_i~Uf1U?co%o+C;f.S%nC>' );
define( 'SECURE_AUTH_KEY',   '`:$M1U2BbI~Br2bc_%c6E(Fy<YN@mv;3COh*ay@W6o*nM8|)6JzX7yeuBFHG~n X' );
define( 'LOGGED_IN_KEY',     'V[faUm[l^L7RxLc;TJ[g:L@v+0[egt;LBQBX]8yN%jm4#[6}=ys,32RAY1GtJ!qZ' );
define( 'NONCE_KEY',         '`*w91;_sYu>|6eh^bb,vpUl&8q{O}@dyhL&L9j<!G~&0fU1]Tv5j%ABfiK1liPMH' );
define( 'AUTH_SALT',         '2+S;OW4[Y^)!Uw8(TP1!}Vd]q(5/{>9e-1vE],j7zrx+]cPXKPs8/WUvTBZ5<~;=' );
define( 'SECURE_AUTH_SALT',  '1A:<Vz>~_6v_wedhq_^akSZNdn1Swr|-sX|uMzb-[zFme!6lT)36N`Slc*NLw2T4' );
define( 'LOGGED_IN_SALT',    'Ar~<bk%t2VhL/b!Yjy`N*>g(VFH<Yp$jIff$z81waXt8TW`kv:1gg:WGL-J~r4r1' );
define( 'NONCE_SALT',        '0LeaR.PdraYf?7FTG?x<K0+?V.3Yb#*q>R%x28qZ(Ot<.GD`W0sQq4=A3jVo,b.I' );
define( 'WP_CACHE_KEY_SALT', '29t.Bc9[MB>U;-)I}Yx IkL_-5+9?iG600V+>E%k,3{Vb0Ma=Vv5}VNGe+6HIJg?' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



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
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
