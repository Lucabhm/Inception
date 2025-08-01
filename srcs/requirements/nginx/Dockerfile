FROM alpine:3.22

LABEL author="backendböhm"

WORKDIR /app

RUN apk update && apk upgrade \
	&& apk add nginx \
	&& apk add openssl \
	&& apk add curl

COPY conf/nginx.conf /etc/nginx/

COPY ./nginx.sh /app

RUN chmod +x nginx.sh

ENTRYPOINT ["./nginx.sh"]