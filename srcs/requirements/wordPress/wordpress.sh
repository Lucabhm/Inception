#! /bin/sh

set -e
set -x

if [ ! -f "/var/www/html/wp-config.php" ]; then

	rm -rf /var/www/html/*

	chown -R www-data:www-data /var/www/html/

	wget https://wordpress.org/latest.tar.gz
	tar -xzf latest.tar.gz
	mv wordpress/* /var/www/html/
	rm latest.tar.gz

	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	cd /var/www/html

	wp config create \
		--dbname=$WORDPRESS_DB_NAME \
		--dbuser=$WORDPRESS_DB_USER \
		--dbpass=$WORDPRESS_DB_PASSWORD \
		--dbhost=$WORDPRESS_DB_HOST \
		--allow-root

	wp core install \
		--url="localhost" \
		--title="inception" \
		--admin_user=admin \
		--admin_password=admin \
		--admin_email=admin@admin.com \
		--allow-root

	wp theme install twentytwentyfour \
		--activate \
		--allow-root

	wp user create \
		$WORDPRESS_TEST_USER \
		$WORDPRESS_TEST_USER_EMAIL \
		--user_pass=$WORDPRESS_TEST_USER_PASSWORD \
		--role=author \
		--path=/var/www/html/ \
		--allow-root

fi

php-fpm8.2 -F
