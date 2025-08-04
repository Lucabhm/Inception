#! /bin/sh

set -e
set -x

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=wordpress --dbuser=lbohm --dbpass=password --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root


# wget https://wordpress.org/latest.tar.gz
# tar -xzf latest.tar.gz --strip-components=1
# rm latest.tar.gz

# wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod +x wp-cli.phar
# mv wp-cli.phar /usr/local/bin/wp

# if [ ! -f "wp-config.php" ]; then

# 	wp core download \
# 		--allow-root

# 	wp config create \
# 		--dbname=wordpress \
# 		--dbuser=lbohm \
# 		--dbpass=password \
# 		--dbhost=mariadb \
# 		--allow-root

# 	wp core install \
# 		--url=localhost \
# 		--title=inception \
# 		--admin_user=admin \
# 		--admin_password=admin \
# 		--admin_email=admin@admin.com \
# 		--allow-root
# fi

# chown -R www-data:www-data /var/www/html

php-fpm8.2 -F
