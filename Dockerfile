FROM hub.lnxsystems.com/library/python:centos8-1

ENV DBNAME /app/data/db.sqlite3

RUN mkdir -p /app/data 
COPY web /app/web
RUN pip3 install -r /app/web/requirements.txt
COPY entrypoint.sh /app/entrypoint.sh

#ENTRYPOINT ["/app/entrypoint.sh"] 
ENTRYPOINT ["/bin/bash"]
