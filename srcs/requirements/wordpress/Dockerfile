FROM debian:buster

RUN apt-get update && apt-get upgrade && apt-get -y install \
	wget \
    curl \
    php7.3 \
    php-fpm \
    php-mysql \
    mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN chown -R root:root /var/www/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/create_wordpress.sh /usr/local/bin/

CMD ["/usr/local/bin/create_wordpress.sh"]