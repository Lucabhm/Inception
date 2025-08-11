FROM debian:bullseye

LABEL author="backendböhm"

RUN apt-get update && \
	apt-get install -y \
	redis-server

ENTRYPOINT [ "redis-server", "--protected-mode", "no" ]
