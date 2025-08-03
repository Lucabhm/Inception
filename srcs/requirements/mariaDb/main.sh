#! /bin/sh

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

if [ ! -d /var/lib/mysql/mysql ]; then
	mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi

mysqld --user=mysql --datadir=/var/lib/mysql & pid="$!"

while ! /usr/bin/mariadb-admin ping --silent; do sleep 1; done

mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY 'securepass';

CREATE DATABASE IF NOT EXISTS wp_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE USER IF NOT EXISTS 'wp_user'@'%' IDENTIFIED BY 'wp_pass';
GRANT ALL PRIVILEGES ON wp_db.* TO 'wp_user'@'%';
FLUSH PRIVILEGES;
EOF

wait "$pid"
