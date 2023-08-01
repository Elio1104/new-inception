FROM debian:buster

RUN apt-get update && apt-get upgrade && apt-get -y install \
    wget \
    curl \
    php7.3 \
    php-fpm \
    php-mysqli

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php

COPY ./tools/create_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh

RUN mkdir -p /var/www/wordpress
WORKDIR /var/www/wordpress
COPY ./conf/config.php ./

ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]