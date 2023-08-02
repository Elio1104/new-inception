FROM debian:buster

RUN apt-get update && apt-get upgrade && apt-get -y install \
    curl \
    php7.3 \
    php-fpm \
    php-mysqli

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/wordpress
WORKDIR /var/www/wordpress

COPY ./tools/create_wordpress.sh ./
RUN chmod +x ./create_wordpress.sh
COPY ./conf/wp-config.php ./

EXPOSE 9000

ENTRYPOINT ["./create_wordpress.sh"]