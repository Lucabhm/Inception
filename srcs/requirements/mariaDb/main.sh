#! /bin/sh

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
mysqld --user=mysql --port=3306
