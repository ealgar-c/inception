#!/bin/bash

echo "DROP DATABASE IF EXISTS ${DB_NAME};" > setup.sql
echo "CREATE DATABASE ${DB_NAME};" >> setup.sql
echo "CREATE USER '${DB_USER}'@$'%' IDENTIFIED BY '${DB_PASSWD}';" >> setup.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';" >> setup.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%';" >> setup.sql
echo "FLUSH PRIVILEGES;" >> setup.sql

chmod 777 setup.sql
mv setup.sql /run/mysqld/setup.sql
chown -R mysql:root /var/run/mysqld
tail -f
mariadb $DB_NAME < run/mysqld/setup.sql
# mysql -u $DB_USER -p $DB_PASSWD < /run/mysqld/setup.sql