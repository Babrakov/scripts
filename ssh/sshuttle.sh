#!/bin/bash

#don't forget to use common user name
USER=$(whoami)

killall sshuttle
#https://github.com/sshuttle/sshuttle
#send all traffic though ssh
sshuttle -r $USER@krs23.ru 0.0.0.0/0