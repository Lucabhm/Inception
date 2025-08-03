#! /bin/sh

wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz
mv wordpress/* /var/www/html
rm -rf wordpress

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html

if [ ! -f "wp-config.php" ]; then
	wp config create \
		--dbname=wp_db \
		--dbuser=wp_user \
		--dbpass=wp_pass \
		--dbhost=mariadb

	wp core install \
		--url=https://localhost \
		--title=Example \
		--admin_user=supervisor \
		--admin_password="test" \
		--admin_email=admin@example.com
fi

chown -R www-data:www-data /var/www/html

php-fpm82 -F
