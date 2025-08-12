#! /bin/sh

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld /var/lib/mysql

if [ ! -d /var/lib/mysql/mysql ]; then
	mysql_install_db --user=mysql --ldata=/var/lib/mysql > /dev/null 2>&1
fi

mysqld_safe --datadir=/var/lib/mysql --bind-address=0.0.0.0 &
sleep 10

until mysqladmin ping --silent; do
	sleep 2; 
done

mysql -u root <<EOF
	ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
	CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;
	CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
	GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%';
	FLUSH PRIVILEGES;
EOF

wait
