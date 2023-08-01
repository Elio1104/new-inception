CREATE DATABASE $MYSQL_DATABASE;
ALTER USER 'root'@localhost IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;