FROM debian:bullseye

LABEL author="backendböhm"

RUN apt-get update && \
	apt-get install -y wget php php-mysqli php-mysql php-pdo

COPY ./adminer.sh .

RUN chmod +x adminer.sh

ENTRYPOINT [ "sh", "./adminer.sh" ]