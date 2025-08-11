FROM debian:bullseye

LABEL author="backendböhm"

RUN apt-get update \
	&& apt-get install -y \
	nginx \
	openssl \
	curl

COPY conf/nginx.conf /etc/nginx/

COPY ./nginx.sh .

RUN chmod +x nginx.sh

ENTRYPOINT ["./nginx.sh"]