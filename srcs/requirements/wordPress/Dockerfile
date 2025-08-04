FROM debian:12

LABEL author="backendböhm"

RUN apt-get update \
	&& apt-get install -y \
	php \
	php-mysql \
	php-fpm \
	php-gd \
	php-xml \
	php-curl \
	php-mbstring \
	php-zip \
	php-intl \
	unzip \
	curl \
	less \
	mariadb-client \
	wget

RUN mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www/html

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY ./wordpress.sh .

RUN chmod +x wordpress.sh

ENTRYPOINT [ "./wordpress.sh" ]