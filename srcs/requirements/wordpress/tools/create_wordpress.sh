#!bin/bash

if [ ! -e /var/www/wordpress/wp-config.php ]; then
    wp config create	--allow-root \
						--dbname=$MYSQL_DATABASE \
						--dbuser=$MYSQL_USER \
						--dbpass=$MYSQL_PASSWORD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'

    wp core install     --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root --path='/var/www/wordpress'
    
    wp user create      --allow-root --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS --path='/var/www/wordpress' >> /log.txt
    
    wp theme install hestia –activate
fi

if [ ! -d /run/php ]; then
    mkdir ./run/php
fi
exec /usr/sbin/php-fpm7.3 -F