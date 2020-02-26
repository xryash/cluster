FROM

HEALTHCHECK CMD curl -f http://localhost:9864/ || exit 1

RUN mkdir -p $NAMENODE_DIR

VOLUME $NAMENODE_DIR

COPY entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

EXPOSE 9864

ENTRYPOINT ["/entrypoint.sh"]