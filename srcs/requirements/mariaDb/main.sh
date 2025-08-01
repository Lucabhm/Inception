#! /bin/sh

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

if [ ! -d /var/lib/mysql/mysql ]; then
	mariadb-install-db --user=lbohm --basedir=/usr --datadir=/var/lib/mysql
fi

while ! /usr/bin/mariadb-admin ping --silent; do sleep 1; done

mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY 'securepass';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
EOF

wait
