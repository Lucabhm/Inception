FROM debian:12

LABEL author="backendböhm"

RUN apt-get update && \
	apt-get install -y \
	mariadb-server \
	mariadb-client \
	curl

COPY ./mariadb.sh .

RUN chmod +x mariadb.sh

ENTRYPOINT ["./mariadb.sh"]