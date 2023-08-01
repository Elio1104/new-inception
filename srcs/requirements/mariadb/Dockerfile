FROM debian:buster


RUN apt-get update -y && apt-get install mariadb-server gettext moreutils -y
COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/init.sql /var/lib/mysql/init.sql
COPY ./conf/script.sh /var/lib/mysql/script.sh

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld  &&  chmod +x /var/lib/mysql/script.sh

EXPOSE 3306

ENTRYPOINT ["/var/lib/mysql/script.sh"]

CMD ["mysqld", "--skip-grant-tables", "--init-file /var/lib/mysql/init.sql"]