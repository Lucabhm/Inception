FROM debian:12

LABEL author="backendböhm"

RUN apt-get update && \
	apt-get install -y wget

# COPY ./cadvisor.sh .

# RUN chmod +x cadvisor.sh

RUN wget https://github.com/google/cadvisor/releases/download/v0.49.2/cadvisor-v0.49.2-linux-amd64 && chmod +x cadvisor-v0.49.2-linux-amd64

# ENTRYPOINT [ "sh", "./cadvisor.sh" ]
ENTRYPOINT [ "./cadvisor-v0.49.2-linux-amd64" ]