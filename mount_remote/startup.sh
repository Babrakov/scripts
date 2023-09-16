#!/bin/bash

#don't forget to use common user name
USER=$(whoami)

#curlftpfs –o allow_other krs23.ru/Dropbox/KeePass /mnt/ftp
sshfs -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3 krs23.ru:/home/$USER /home/$USER/mnt
