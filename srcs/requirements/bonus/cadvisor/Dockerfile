FROM debian:bullseye

LABEL author="backendböhm"

RUN apt-get update && \
	apt-get install -y wget

RUN wget https://github.com/google/cadvisor/releases/download/v0.49.2/cadvisor-v0.49.2-linux-amd64 && chmod +x cadvisor-v0.49.2-linux-amd64

ENTRYPOINT [ "./cadvisor-v0.49.2-linux-amd64" ]