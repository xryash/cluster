ARG HADOOP_BASE_IMAGE

FROM ${HADOOP_BASE_IMAGE}:latest

HEALTHCHECK CMD curl -f http://localhost:9870/ || exit

RUN mkdir -p $DATANODE_DIR

VOLUME $DATANODE_DIR

COPY cmd.sh /cmd.sh

RUN chmod a+x /cmd.sh

EXPOSE 9870

CMD ["/cmd.sh"]