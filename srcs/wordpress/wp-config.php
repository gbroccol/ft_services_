<?php

define( 'DB_NAME', 'gbroccol' );

define( 'DB_USER', 'gbroccol' );

define( 'DB_PASSWORD', 'password' );

define( 'DB_HOST', 'mysql:3306');
define( 'WP_HOME', 'http://192.168.99.201:5050/' );
define( 'WP_SITEURL', 'http://192.168.99.201:5050/' );

define( 'DB_CHARSET', 'utf8' );

define( 'DB_COLLATE', '' );

define('FS_METHOD', 'direct');

define('AUTH_KEY',         '{3;qzk4P%~)Mr5lI+$>gm9o%C>9W%_cqR+@1TUL@:4Ex+7Xaf,wI8a8+eA|r@A !');
define('SECURE_AUTH_KEY',  '[a*Y5=R-70+G=+1xl)5u7Yeo*WCC9gn/mH$61*=^RN.1#&G/<R)4*/>_ZB<CC~:V');
define('LOGGED_IN_KEY',    '@:bm+><bDP+j,yh=kw2NP go3FhuH-uPb2R#ig6S4*Qq1&4YlM-3&kH!nFL:4;>B');
define('NONCE_KEY',        'L7x8W#,%19M UN2nejofDj1X9Tog5+v;DkY3OM(twtgi^TmsZYbbH@]T#_|_+>>@');
define('AUTH_SALT',        'j-v Fu[Ny`` L+S3bQK; ~J):B+r$:p1y0UOCV/!y*26cIuO(Uh[Hd&y<T5!@$v6');
define('SECURE_AUTH_SALT', '43w!Kw>OioYqg+900N2Sa9KI4qV2k{|jlXbw2dh:mA||v?0+,P-Jh{*dV|X%fG2X');
define('LOGGED_IN_SALT',   'nq|wmvWW0ap2L*{=gR8ytL^V:<-;V&J+[w|9*6^kBC~]z=v0+g4W5n^vM}1^K:~{');
define('NONCE_SALT',       'VFvZ|wO33X~$c;pBG1Cnys(xnge3m1syX([d1fv*chM?tv2k2^=I.atJkwfNGJE,');

$table_prefix = 'wp_';

define( 'WP_DEBUG', true );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';