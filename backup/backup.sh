#!/bin/sh
### System Setup ###
BACKUP=/home/user/scripts/backup

### Binaries ###
TAR="$(which tar)"

### Today + hour in 24h format ###
NOW=$(date +"%F")

### Create hourly dir ###
mkdir $BACKUP/$NOW

### Создаем папку для сохранения почты
#mkdir $BACKUP/$NOW/varmail
cp -r /var/mail $BACKUP/$NOW/varmail
cp -r /mnt/cloud/files $BACKUP/$NOW/cloud

### Создаем один большой файл для его последующей закачки ###
ARCHIVE=$BACKUP/$NOW.tar.gz
ARCHIVED=$BACKUP/$NOW

#$TAR -zcvf $ARCHIVE $ARCHIVED
$TAR -zcf $ARCHIVE $ARCHIVED

### Копируем в /mnt/backup/mail.infoza
cp $ARCHIVE /mnt/backup

### Переносим на regru
scp -P 1022 $ARCHIVE user@yandex.ru:/home/user/backup/$NOW.tar.gz

### Подчищаем за собой ###
rm -rf $ARCHIVED
rm -f $ARCHIVE
