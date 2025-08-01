#! /bin/sh

wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

if [ ! -f "wp-config.php" ]; then
	wp config create \
		--dbname=your_database_name \
		--dbuser=your_database_user \
		--dbpass=your_database_password \
		--dbhost=your_database_host

	wp core install \
		--url=example.com \
		--title=Example \
		--admin_user=supervisor \
		--admin_password="test"
fi

php-fpm82 -F
