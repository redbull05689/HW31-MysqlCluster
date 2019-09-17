#!/bin/bash

#docker build -t server_image ./image

# docker-compose up -d mysqlnode1
# docker-compose up -d mysqlnode2
# docker-compose up -d mysqlnode3

docker-compose up -d 

sleep 90

docker-compose exec mysqlnode1 mysqlsh clusteradmin@mysqlnode1:3306 -pclusterpass -- dba create-cluster otus

docker-compose exec mysqlnode1 mysqlsh clusteradmin@mysqlnode1:3306 -pclusterpass -- cluster add-instance clusteradmin@mysqlnode2 --password=clusterpass --recoveryMethod=clone

docker-compose exec mysqlnode1 mysqlsh clusteradmin@mysqlnode1:3306 -pclusterpass -- cluster add-instance clusteradmin@mysqlnode3 --password=clusterpass --recoveryMethod=clone


docker-compose up -d mysqlrouter