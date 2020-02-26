#!/usr/bin/env bash

python3 init_confs.py

python3 init_hadoop_envs.py --envs JAVA_HOME HADOOP_HOME \
                                       --hadoop_env_path ${HADOOP_HOME}/etc/hadoop/hadoop-env.sh

service ssh start

$HADOOP_HOME/etc/hadoop/hadoop-env.sh