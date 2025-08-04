FROM debian:12

LABEL author="backendböhm"

RUN apt-get update && \
	apt-get install -y \
	mariadb-server \
	mariadb-client \
	libmariadb3 \
	libaio1 \
	tzdata \
	curl

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY ./init.sql /etc/mysql/init.sql

COPY ./mariadb.sh .

RUN chmod +x mariadb.sh

ENTRYPOINT ["./mariadb.sh"]