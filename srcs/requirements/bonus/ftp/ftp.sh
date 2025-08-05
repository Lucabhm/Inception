#! /bin/bash

mkdir -p /var/www/html

useradd -d /var/www/html ftpuser
echo "ftpuser:starwars" | chpasswd

chown -R ftpuser:ftpuser /var/www/html
mkdir -p /var/run/vsftpd/empty

/usr/sbin/vsftpd /etc/vsftpd.conf