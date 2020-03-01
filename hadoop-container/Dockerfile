FROM ubuntu:16.04

RUN apt-get update \
        && apt-get install -y curl openjdk-8-jdk python3 ssh rsync\
        && rm -rf /var/lib/apt/lists/*

ENV HADOOP_VERSION=3.2.1 \
        HADOOP_HOME=/opt/hadoop \
        HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop \
        HDFS_NAMENODE_USER=root \
        HDFS_DATANODE_USER=root \
        HDFS_SECONDARYNAMENODE_USER=root \
        JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

COPY ./hadoop $HADOOP_HOME
#RUN curl -fSL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz -o /tmp/hadoop-$HADOOP_VERSION.tar.gz \
#        && tar -xvf /tmp/hadoop-$HADOOP_VERSION.tar.gz -C /tmp/hadoop-$HADOOP_VERSION \
#        && mv /tmp/hadoop-$HADOOP_VERSION $HADOOP_HOME \
#        && rm /tmp/hadoop-$HADOOP_VERSION.tar.gz

RUN ln -s $HADOOP_HOME/etc/hadoop /etc/hadoop

ENV DATANODE_DIR=${HADOOP_HOME}/data/dateNode \
        NAMENODE_DIR=${HADOOP_HOME}/data/nameNode \
        LOGS_DIR=${HADOOP_HOME}/logs

RUN mkdir $HADOOP_HOME/data \
        && mkdir $LOGS_DIR \
        && mkdir $DATANODE_DIR \
        && mkdir $NAMENODE_DIR \
        && chmod a+x -R $HADOOP_HOME

COPY hadoop-env.sh $HADOOP_HOME/etc/hadoop/hadoop-env.sh
COPY init_confs.py /init_confs.py
COPY confs.ini /confs.ini

COPY entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh \
        && chmod a+x $HADOOP_HOME/etc/hadoop/hadoop-env.sh

ENTRYPOINT [ "bash" ]