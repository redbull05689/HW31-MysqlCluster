# HW31-MysqlCluster

Развернуть InnoDB cluster в docker

Поднять стенд можно запуском скрипта ./start.sh

Проверить работустенда можно подключившись к mysqlrouter, через который можно взаимодействовать с кластером:
mysql -uclusteradmin -pclusterpass -P6446 -h 127.0.0.1


Полезные статьи:
https://habr.com/ru/post/423587/
https://habr.com/ru/post/332518/

Удалить *:
docker rm -f $(docker ps -a -q)
docker image rm $(docker images)