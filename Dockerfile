FROM ubuntu:14.04
MAINTAINER wlu wlu@linkernetworks.com

RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    apt-get -y update && \
    apt-get -y install mesos=0.26.0-0.2.145.ubuntu1404 openjdk-7-jre

RUN apt-get install -y vim && \
    ln -f -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    apt-get clean

#download spark
RUN curl http://ftp.mirror.tw/pub/apache/spark/spark-1.6.1/spark-1.6.1-bin-hadoop2.6.tgz | tar - C /usr/local

ENV MESOS_NATIVE_JAVA_LIBRARY=/usr/lib/libmesos.so \
    JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 \
    SPARK_HOME=/usr/local/spark-1.6.1
ENV PATH=$JAVA_HOME/bin:$PATH
