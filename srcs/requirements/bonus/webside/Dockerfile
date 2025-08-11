FROM debian:bullseye

LABEL author="backendböhm"

RUN apt-get update && \
	apt-get install -y python3

COPY ./index.html .

ENTRYPOINT [ "python3", "-m", "http.server", "8000" ]