#!/bin/bash

echo "CREATE DATABASE ${DB_NAME} IF NOT EXIST;" >> setup.sql
echo "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWD}';" >> setup.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';" >> setup.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%';" >> setup.sql
echo "FLUSH PRIVILEGES;" >> setup.sql

chmod 777 setup.sql
mv setup.sql /run/mysqld/setup.sql
chown -R mysql:root /var/run/mysqld
# service mariadb start
mariadbd --init-file /run/mysqld/setup.sql
# mysql -u $DB_USER -p $DB_PASSWD < /run/mysqld/setup.sql