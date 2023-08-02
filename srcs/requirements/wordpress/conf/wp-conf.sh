#!/bin/bash

if [ -f ./wp-config-sample.php ]
then
	echo "wordpress already downloaded"
else

	wp core download    --allow-root
	wp config create	--dbname="$MYSQL_DATABASE"\
						--dbuser="$MYSQL_USER" \
						--dbpass="$MYSQL_PASSWORD" \
						--dbhost="$DB_HOST":"3306" \
						--dbprefix='wp_' \
						--allow-root
	wp core install     --url="$DOMAIN_NAME" --title="$SITE_TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_EMAIL" --allow-root
	wp user create      --allow-root --role='author' $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS
	wp theme install inspiro --activate --allow-root
	wp option update comment_moderation 0 --allow-root

fi
exec /usr/sbin/php-fpm7.3 -F