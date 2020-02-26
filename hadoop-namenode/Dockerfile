ARG HADOOP_BASE_IMAGE

FROM ${HADOOP_BASE_IMAGE}:latest

HEALTHCHECK CMD curl -f http://localhost:9864/ || exit 1

RUN mkdir -p $NAMENODE_DIR

VOLUME $NAMENODE_DIR

COPY cmd.sh /cmd.sh

RUN chmod a+x /cmd.sh

EXPOSE 9864

CMD ["/cmd.sh"]