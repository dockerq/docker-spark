FROM ubuntu:14.04
MAINTAINER adolphlwq kenan3015@gmail.com

RUN ln -f -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# download mesos
RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    apt-get -y update && \
    apt-get -y install mesos=0.28.1-2.0.20.ubuntu1404
#download java
RUN apt-get update && \
    apt-get -y install openjdk-7-jre curl && \
RUN curl -fL http://archive.apache.org/dist/spark/spark-1.6.0/spark-1.6.0-bin-hadoop2.6.tgz | tar xzf - -C /usr/local && \
    apt-get clean

ENV MESOS_NATIVE_JAVA_LIBRARY=/usr/lib/libmesos.so \
    JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 \
    SPARK_HOME=/usr/local/spark-1.6.0-bin-hadoop2.6 \
    NB_USER=jovyan \
    NB_UID=1000
ENV PATH=$JAVA_HOME/bin:$PATH \
    HOME=/home/$NB_USER \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER
WORKDIR $SPARK_HOME
USER $NB_USER
