# La Donnée Intelligente - Data Modeling demo
Created on 16/12/24

## Resource: 
- https://github.com/xvanausloos/sql-server-samples/tree/master/samples/databases/adventure-works
- https://www.youtube.com/watch?v=eNxbMwUGl1g

## Prerequisite
- SQL SERVER running in Docker

## Instructions
Follow this YouTube course about BI with SSIS / SSRS / SQL SERVER / POWERBI

## Install SQL SERVER using Docker image
```
./infrastructure/deploy_sqlserver_container.sh
```

## Copy the data 
Copy the GitHub data files `AdventuresWorks2014.bak` and scripts for AdventureWorks to the Docker image folder :  C:\Samples\AdventureWorks folder on your local client

```
export CONTAINER_NAME=mssql
export PWD=12ERzes#FRR
docker exec -it $CONTAINER_NAME /bin/bash

docker exec -it $CONTAINER_NAME /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $PWD -Q 'RESTORE FILELISTONLY FROM DISK = "/var/opt/mssql/backup/AdventureWorks2014.bak"'

docker exec -it $CONTAINER_NAME /opt/mssql-tools/bin/sqlcmd -S localhost \
   -U sa -P $PWD \
   -Q "RESTORE DATABASE AdventureWorks2014 FROM DISK = '/var/opt/mssql/backup/AdventureWorks2014.bak' 
   WITH MOVE 'AdventureWorks2014_Data' TO '/var/opt/mssql/data/AdventureWorks2014.mdf',
   MOVE 'AdventureWorks2014_Log' TO '/var/opt/mssql/data/AdventureWorks2014.ldf';"

```
