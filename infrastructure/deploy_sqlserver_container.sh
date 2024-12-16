#!/bin/bash
docker stop mssqlex03 
docker rm mssqlex03
docker run --name "mssqlex03" --platform=linux/amd64 --hostname "mssqlex03" -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=12ERzes#FRR" -e "MSSQL_PID=Express" -p 1433:1433 -d mcr.microsoft.com/mssql/server:2022-CU13-ubuntu-22.04