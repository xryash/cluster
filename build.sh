#!/usr/bin/env bash

export CI_REGISTRY_USER=igoreshadockeroid
export CI_REGISTRY_PASSWORD=Igoresha1996first
export CI_REGISTRY=


export HADOOP_BASE_IMAGE=hadoop-3.2.1-java-8-base-container
export HADOOP_NAMENODE_IMAGE=hadoop-3.2.1-java-8-namenode-container
export HADOOP_DATANODE_IMAGE=hadoop-3.2.1-java-8-datanode-container

#docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
#need to login
docker build -t $HADOOP_BASE_IMAGE hadoop-container/

docker build --build-arg HADOOP_BASE_IMAGE=${HADOOP_BASE_IMAGE} -t $HADOOP_NAMENODE_IMAGE hadoop-namenode/

#docker build --build-arg HADOOP_BASE_IMAGE=${HADOOP_BASE_IMAGE} -t $HADOOP_DATANODE_IMAGE hadoop-datanode/

