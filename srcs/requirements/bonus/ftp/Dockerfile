FROM debian:bullseye

LABEL author="backendböhm"

RUN apt-get update && \
	apt-get install -y vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./ftp.sh .

RUN chmod +x ftp.sh

ENTRYPOINT [ "sh", "./ftp.sh" ]