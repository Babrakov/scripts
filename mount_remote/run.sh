#!/bin/bash

#mount -t nfs -O uid=1000,iocharset=utf-8 10.15.0.5:/home/user /mnt/remote/
#curlftpfs –o allow_other site.com/share /mnt/ftp
sshfs -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3 site.com:/home/user/share /home/user/mnt
