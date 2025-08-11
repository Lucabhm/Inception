#! /bin/sh

set -e
set -x

if [ ! -f "/var/www/html/wp-config.php" ]; then

	rm -rf /var/www/html/*

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

	wp config set WP_REDIS_HOST 'redis' \
		--allow-root

	wp config set WP_REDIS_PORT 6379 \
		--raw \
		--allow-root

	wp config set WP_CACHE true \
		--raw \
		--allow-root

	wp core install \
		--url="localhost" \
		--title="inception" \
		--admin_user=$WORDPRESS_ADMIN_USER \
		--admin_password=$WORDPRESS_ADMIN_PASSWORD \
		--admin_email=$WORDPRESS_ADMIN_EMAIL \
		--allow-root

	wp theme activate twentytwentyfour \
		--allow-root

	wp user create \
		$WORDPRESS_USER \
		$WORDPRESS_USER_EMAIL \
		--user_pass=$WORDPRESS_USER_PASSWORD \
		--role=author \
		--path=/var/www/html/ \
		--allow-root

	wp plugin install redis-cache \
		--activate \
		--path=/var/www/html/ \
		--allow-root
	
	wp redis enable --path=/var/www/html/ --allow-root

	chown -R www-data:www-data /var/www/html/wp-content

fi

php-fpm8.2 -F
