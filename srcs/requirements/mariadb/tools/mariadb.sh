#!/bin/bash

export MYSQL_DATABASE=inception
export MYSQL_USER=alondot
export MYSQL_PASSWORD=test1234
export MYSQL_ROOT_PASSWORD=root1234

service mysql start;

echo "1"
service status mysql
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
echo "2"
service status mysql
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
echo "3"
service status mysql
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
echo "4"
service status mysql
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
echo "5"
service status mysql
mysql -e "FLUSH PRIVILEGES;"
echo "6"
service status mysql