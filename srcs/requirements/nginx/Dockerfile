FROM alpine:3.22

LABEL author="backendbohm"

WORKDIR /etc/nginx

RUN apk update && apk add nginx

COPY conf/nginx.conf ./nginx.conf

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]