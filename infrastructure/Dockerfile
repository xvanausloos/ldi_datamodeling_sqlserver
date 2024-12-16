

# Choose exact tag (not 'latest'), to be sure that new version will not break creating image
FROM mcr.microsoft.com/mssql/server:2019-latest

# Copy initialization scripts
COPY *.sh ./
USER root 
RUN chmod +x *.sh
USER mssql

# Set environment variables, not to have to write them with docker run command
ENV ACCEPT_EULA Y
ENV MSSQL_PID Developer

# Run Microsoft SQl Server and initialization script (at the same time)
# Note: If you want to start MsSQL only (without initialization script) you can comment bellow line out, CMD entry from base image will be taken
CMD /bin/bash ./entrypoint.sh

