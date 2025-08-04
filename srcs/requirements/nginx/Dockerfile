FROM debian:12

LABEL author="backendböhm"

WORKDIR /app

RUN apt-get update && apt-get upgrade \
	apt-get install -y \
	nginx \
	openssl \
	curl

COPY conf/nginx.conf /etc/nginx/

COPY ./nginx.sh /app

RUN chmod +x nginx.sh

ENTRYPOINT ["./nginx.sh"]