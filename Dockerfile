FROM ubuntu:14.04
MAINTAINER wlu wlu@linkernetworks.com

RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    apt-get -y update && \
    apt-get -y install mesos=0.26.0-0.2.145.ubuntu1404 openjdk-7-jre

RUN apt-get install -y vim && \
    ln -f -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    apt-get clean

ENV MESOS_NATIVE_JAVA_LIBRARY=/usr/lib/libmesos.so \
    JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
ENN PATH=$JAVA_HOME/bin:$PATH
