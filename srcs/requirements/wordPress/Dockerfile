FROM alpine:3.22

LABEL author="backendböhm"

WORKDIR /app

RUN apk update && apk upgrade \
	&& apk del php82-pecl-imagick \
	&& apk add php82 php82-fpm php82-mysqli php82-curl php82-dom \
	php82-exif php82-fileinfo php82-gd php82-json \
	php82-mbstring php82-opcache php82-openssl \
	php82-pecl-imagick php82-session php82-xml php82-phar\
	php82-zip php82-zlib curl wget tar

RUN ln -s /usr/bin/php82 /usr/bin/php && \
    adduser -S -G www-data www-data || true && \
    mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www/html

COPY ./wordpress.sh /app

RUN chmod +x wordpress.sh

ENTRYPOINT [ "./wordpress.sh" ]