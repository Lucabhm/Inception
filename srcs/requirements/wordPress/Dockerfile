FROM debian:bullseye

LABEL author="backendböhm"

RUN apt-get update \
	&& apt-get install -y \
	php7.4 \
	php7.4-mysql \
	php7.4-fpm \
	php7.4-gd \
	php7.4-xml \
	php7.4-curl \
	php7.4-mbstring \
	php7.4-zip \
	php7.4-intl \
	unzip \
	curl \
	less \
	mariadb-client \
	wget

RUN mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www/html

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./wordpress.sh .

RUN chmod +x wordpress.sh

ENTRYPOINT [ "./wordpress.sh" ]