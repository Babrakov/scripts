#!/bin/bash
#Что пингуем
IP1=8.8.8.8
IP2=ya.ru
#Переменные для результатов проверки
RES1=0
RES2=0
#Кидаем на каждый адрес 3 пинга
ping -q -c 3 $IP1 > /dev/null && RES1=1
ping -q -c 3 $IP2 > /dev/null && RES2=1
#Если оба адреса не ответили - перезапускаем интерфейс eth0
if [ $RES1$RES2 = 00 ]
then
echo 'Houston, we have a problem' >> /home/berzerk/scripts/watch.log
date >> /home/berzerk/scripts/watch.log
`reboot`
fi