#! /bin/sh

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld /var/lib/mysql

if [ ! -d /var/lib/mysql/mysql ]; then
	mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

	mysqld_safe --bind-address=0.0.0.0 &
	sleep 10

	until mysqladmin ping --silent; do
		sleep 2; 
	done

	mariadb -u root <<-EOF
	ALTER USER 'root'@'localhost' IDENTIFIED BY "${MYSQL_ROOT_PASSWORD}";

	CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
	CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY "${MYSQL_PASSWORD}";
	GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO "${MYSQL_USER}"@'%';
	FLUSH PRIVILEGES;
	EOF
fi

wait
