FROM alpine:3.22

LABEL author="backendböhm"

WORKDIR /app

RUN apk update && apk upgrade\
	&& apk add mariadb mariadb-client

COPY ./main.sh .

RUN chmod +x main.sh

ENTRYPOINT ["./main.sh"]