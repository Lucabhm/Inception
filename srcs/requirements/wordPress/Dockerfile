FROM debian:12

LABEL author="backendböhm"

WORKDIR /app

RUN apt-get update && apt-get upgrade \
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

RUN ln -s /usr/bin/php82 /usr/bin/php && \
    adduser -S -G www-data www-data || true && \
    mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www/html

COPY ./wordpress.sh .

RUN chmod +x wordpress.sh

ENTRYPOINT [ "./wordpress.sh" ]