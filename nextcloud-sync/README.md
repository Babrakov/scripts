Sync files between servers (on 199):
```
rsync -rvLtuzP --no-p --no-g --no-o --rsync-path="sudo rsync" /media/data/photo/Настя/ berzerk@192.168.31.201:/home/berzerk/data/nextcloud-data/anastasiia.s.babrakova/files/Photos/
rsync -rvLtuzP --no-p --no-g --no-o --rsync-path="sudo rsync" /media/data/photo/Таня/ berzerk@192.168.31.201:/home/berzerk/data/nextcloud-data/tatiana.a.babrakova/files/Photos/
rsync -rvLtuzP --no-p --no-g --no-o --rsync-path="sudo rsync" /media/data/photo/Семейный\ архив/ berzerk@192.168.31.201:/home/berzerk/data/nextcloud-data/sergei.a.babrakov/files/Photos/Семейный\ архив/

rsync -rvLtuzP --no-p --no-g --no-o --rsync-path="sudo rsync" berzerk@192.168.31.201:/home/berzerk/data/nextcloud-data/anastasiia.s.babrakova/files/Photos/ /media/data/photo/Настя/
rsync -rvLtuzP --no-p --no-g --no-o --rsync-path="sudo rsync" berzerk@192.168.31.201:/home/berzerk/data/nextcloud-data/tatiana.a.babrakova/files/Photos/ /media/data/photo/Таня/
rsync -rvLtuzP --no-p --no-g --no-o --rsync-path="sudo rsync" berzerk@192.168.31.201:/home/berzerk/data/nextcloud-data/sergei.a.babrakov/files/Photos/Семейный\ архив/ /media/data/photo/Семейный\ архив/
```

Index new and updated files (on 201):
```
docker exec --user www-data nextcloud-aio-nextcloud php occ files:scan anastasiia.s.babrakova
docker exec --user www-data nextcloud-aio-nextcloud php occ files:scan tatiana.a.babrakova
docker exec --user www-data nextcloud-aio-nextcloud php occ files:scan sergei.a.babrakov
```
