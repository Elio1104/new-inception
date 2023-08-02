#!/bin/bash
wp core download --allow-root
wp core config --dbname="$MYSQL_DATABASE" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --dbhost="$DB_HOST":"3306" --dbprefix='wp_' --allow-root
wp core install --url="$DOMAIN_NAME" --title="$SITE_TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_EMAIL" --allow-root
wp user create $USER1_LOGIN $USER1_PASS --role='author' --user_pass="$USER1_PASS" --allow-root
exec /usr/sbin/php-fpm7.3 -F
