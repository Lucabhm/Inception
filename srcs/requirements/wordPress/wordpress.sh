#! /bin/sh

set -e
set -x

cd /var/www/html

wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz --strip-components=1
rm latest.tar.gz

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

if [ ! -f "wp-config.php" ]; then
	wp config create \
		--dbname=wp_db \
		--dbuser=wp_user \
		--dbpass=wp_pass \
		--dbhost=mariadb:3306 \
		--allow-root

	wp core install \
		--url=https://localhost \
		--title=Example \
		--admin_user=supervisor \
		--admin_password="test" \
		--admin_email=admin@example.com
fi

chown -R www-data:www-data /var/www/html

php-fpm8.2 -F
