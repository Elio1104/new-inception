#!/bin/sh

wp core download    --allow-root
echo "1"
wp core config		--dbname="$MYSQL_DATABASE"\
					--dbuser="$MYSQL_USER" \
					--dbpass="$MYSQL_PASSWORD" \
					--dbhost="$DB_HOST":"3306" \
                    --dbprefix='wp_' \
                    --allow-root
echo "2"
wp core install     --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root
echo "3"
wp user create      --allow-root --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS --path='/var/www/wordpress' >> /log.txt
echo "4"
exec "$@"