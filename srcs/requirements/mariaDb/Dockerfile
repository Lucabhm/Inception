FROM debian:12

LABEL author="backendböhm"

WORKDIR /app

RUN apt-get update && \
	apt-get install -y \
	mariadb-server \
	mariadb-client \
	libmariadb3 \
	libaio1 \
	tzdata \
	curl

COPY ./main.sh .

RUN chmod +x main.sh

ENTRYPOINT ["./main.sh"]