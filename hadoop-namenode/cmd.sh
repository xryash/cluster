#!/usr/bin/env bash

python3 init_confs.py

python3 init_hadoop_envs.py --envs JAVA_HOME HADOOP_HOME HADOOP_OPTS \
                                       --hadoop_env_path ${HADOOP_HOME}/etc/hadoop/hadoop-env.sh

service ssh start

$HADOOP_HOME/etc/hadoop/hadoop-env.sh

$HADOOP_HOME/bin/hdfs namenode -format

$HADOOP_HOME/sbin/start-dfs.sh

$HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/root

ssh localhost
