FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get -y install php-fpm php-mysqli curl

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
RUN mkdir /run/php/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/wordpress
WORKDIR /var/www/wordpress

COPY ./conf/script.sh ./
RUN chmod +x ./script.sh
COPY ./conf/wp-conf.sh ./
RUN chmod +x wp-conf.sh

EXPOSE 9000

ENTRYPOINT ["./script.sh"]
