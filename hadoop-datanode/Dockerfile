
FROM

RUN mkdir -p $DATANODE_DIR

VOLUME $DATANODE_DIR

COPY entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

EXPOSE 9870

ENTRYPOINT ["/entrypoint.sh"]