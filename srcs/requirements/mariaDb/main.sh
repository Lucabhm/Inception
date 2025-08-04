#! /bin/sh

set -e
set -x

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

if [ ! -d /var/lib/mysql/mysql ]; then
	mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi

mysqld --user=mysql --datadir=/var/lib/mysql --port=3306 & pid="$!"

while ! /usr/bin/mariadb-admin ping --silent; do sleep 1; done

mariadb -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY "${MYSQL_ROOT_PASSWORD}";

CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY "${MYSQL_PASSWORD}";
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO "${MYSQL_USER}"@'%';
FLUSH PRIVILEGES;
EOF

wait "$pid"
