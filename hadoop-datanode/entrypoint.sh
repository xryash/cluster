#!/usr/bin/env bash

FROM



$HADOOP_HOME/bin/hdfs namenode -format

$HADOOP_HOME/sbin/start-dfs.sh

#$HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/root

