#!/bin/sh

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" >> query.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWD';" >> query.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> query.sql
echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PASSWD');" >> query.sql
echo "FLUSH PRIVILEGES;" >> query.sql

mariadb-install-db --user=mysql --datadir=/database

mysqld --user=mysql --datadir=/database &

sleep 2

mysql -u root < query.sql

kill $(jobs -p)