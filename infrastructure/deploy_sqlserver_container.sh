#!/bin/bash
CONTAINER_NAME=mssql
PWD=12ERzes#FRR
docker stop $CONTAINER_NAME 
docker rm $CONTAINER_NAME
docker run --name "$CONTAINER_NAME" --platform=linux/amd64 --hostname "$CONTAINER_NAME" -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=$PWD" -e "MSSQL_PID=Express" -p 1433:1433 -d mcr.microsoft.com/mssql/server:2022-CU13-ubuntu-22.04
docker exec $CONTAINER_NAME mkdir -p /var/opt/mssql/backup
docker cp AdventureWorks2014.bak $CONTAINER_NAME:/var/opt/mssql/backup/


