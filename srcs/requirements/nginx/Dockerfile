FROM alpine:3.22

LABEL author="backendböhm"

WORKDIR /var/www/html/

RUN apk update && apk upgrade \
	&& apk add nginx \
	&& apk add openssl \
	&& apk add curl

COPY conf/nginx.conf /etc/nginx/

COPY conf/index.html /var/www/html/

ENTRYPOINT ["nginx", "-g", "daemon off;"]