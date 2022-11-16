#!/bin/sh
# System + MySQL backup script
# # ---------------------------------------------------------------------

#########################
######TO BE MODIFIED#####

### System Setup ###
BACKUP=/root

### Настройка Mysql ###
MUSER="root"
MPASS="secret"
MHOST="localhost"

### Настройки FTP ###
#FTPD="/"
#FTPU="FTPUSER"
#FTPP="FTPPASSWORD"
#FTPS="FTPADDRESS"

#########################################

### Binaries ###
TAR="$(which tar)"
GZIP="$(which gzip)"
#FTP="$(which ftp)"
MYSQL="$(which mysql)"
MYSQLDUMP="$(which mysqldump)"

### Today + hour in 24h format ###
NOW=$(date +"%F")

### Create hourly dir ###
mkdir $BACKUP/$NOW

### Останавливаем Mysql ###
#service mysql stop

### Получаем имена всех баз Mysql ###
DBS="$($MYSQL -u $MUSER -h $MHOST -p$MPASS -Bse 'show databases')"
for db in $DBS
do

### Создаем директории для каждой базы. Резервное копирование будет происходить в различные каталоги ###
  mkdir $BACKUP/$NOW/$db
  FILE=$BACKUP/$NOW/$db/$db.sql.gz
  echo $i; $MYSQLDUMP --add-drop-table --allow-keywords -q -c -u $MUSER -h $MHOST -p$MPASS $db $i | $GZIP -9 > $FILE
done

### Создаем папку для сохранения web
#mkdir $BACKUP/$NOW/www
#cp -r /var/www/site $BACKUP/$NOW/www
#cp /var/www/index.php $BACKUP/$NOW/www
#cp /var/www/index.html $BACKUP/$NOW/www

### Создаем один большой файл для его последующей закачки ###
ARCHIVE=$BACKUP/$NOW.tar.gz
ARCHIVED=$BACKUP/$NOW

$TAR -zcvf $ARCHIVE $ARCHIVED

### Выкладываем на www
#mv $ARCHIVE /var/www/site

### Закачиваем на FTP ###
#cd $BACKUP
#DUMPFILE=server1-$NOW.tar.gz
#$FTP -n $FTPS <<END_SCRIPT
#quote USER $FTPU
#quote PASS $FTPP
#cd $FTPD
#mput $DUMPFILE
#quit
#END_SCRIPT

### Запускаем Mysql ###
#service mysql start

### Подчищаем за собой ###
### rm -rf $ARCHIVED