#!/bin/sh
# Чистим резервные копии

### Today + hour in 24h format ###
NOW=$(date +"%F")

rm -rf /var/www/site/$NOW.tar.gz