FROM ubuntu:16.04

RUN apt-get update \
        && apt-get install -y curl openjdk-8-jdk python3 ssh rsync\
        && rm -rf /var/lib/apt/lists/*


ENV HADOOP_VERSION=3.2.1 \
    HADOOP_CONF_DIR=/etc/hadoop \
    HADOOP_HOME=/opt/hadoop \
    HADOOP_OPTS="$HADOOP_OPTS -Djava.library.path=$HADOOP_HOME/lib/native"

ENV HDFS_NAMENODE_USER=root \
    HDFS_DATANODE_USER=root \
    HDFS_SECONDARYNAMENODE_USER=root


ENV DATANODE_DIR=${HADOOP_HOME}/data/dateNode \
    NAMENODE_DIR=${HADOOP_HOME}/data/nameNode


COPY ./hadoop $HADOOP_HOME
#RUN curl -O https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz \
#        && tar -xzf hadoop-$HADOOP_VERSION.tar.gz \
#        && mv hadoop-$HADOOP_VERSION $HADOOP_HOME \
#        && rm hadoop-$HADOOP_VERSION.tar.gz

RUN ln -s $HADOOP_HOME/etc/hadoop /etc/hadoop

RUN mkdir ${HADOOP_HOME}/logs

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# create conf files
COPY init_confs.py /init_confs.py
COPY hadoop-cluster.ini /hadoop-cluster.ini

# add envs to hadoop-env.sh
COPY init_hadoop_envs.py /init_hadoop_envs.py

RUN chmod a+x -R $HADOOP_HOME

RUN ssh-keygen -t rsa -P '' -f /root/.ssh/id_rsa \
        && cat ~/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys \
        && chmod 0600 /root/.ssh/authorized_keys

COPY entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]