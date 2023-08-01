FROM debian:buster


RUN apt update -y && apt upgrade -y && apt-get install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/mariadb.sh /usr/local/bin/
RUN chmod +x /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x /usr/local/bin/mariadb.sh

CMD ["/usr/local/bin/mariadb.sh"]