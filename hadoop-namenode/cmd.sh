#!/usr/bin/env bash


python3 init_confs.py


if [ -z $SSH_PORT ]; then
  export SSH_PORT=2222
fi
port_line=`grep "Port " /etc/ssh/sshd_config`
sed -i "s/$port_line/Port $SSH_PORT/g" /etc/ssh/sshd_config
sed -i "35s/.*/    StrictHostKeyChecking no/g" /etc/ssh/ssh_config

ssh-keygen -t rsa -P '' -f /root/.ssh/id_rsa \
        && cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys \
        && chmod 0600 /root/.ssh/authorized_keys

service ssh start

$HADOOP_HOME/etc/hadoop/hadoop-env.sh

$HADOOP_HOME/bin/hdfs namenode -format

$HADOOP_HOME/sbin/start-dfs.sh

$HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/root

