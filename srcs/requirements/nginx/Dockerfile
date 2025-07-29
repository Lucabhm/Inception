FROM alpine:3.22

LABEL author="backendböhm"

WORKDIR /var/www/html

RUN apk update && apk add nginx \
	&& apk add openssl

COPY conf/nginx.conf /etc/nginx/

COPY conf/index.html /var/www/html/

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]