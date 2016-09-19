# refer 'http://spark.apache.org/docs/latest/running-on-mesos.html#spark-properties'
# on 'spark.mesos.executor.docker.image' section
FROM ubuntu:14.04
WORKDIR /linker
RUN ln -f -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#download jre and kits
RUN apt-get update && \
    apt-get -y install openjdk-7-jre python-pip vim curl
#download spark
RUN curl -fL http://archive.apache.org/dist/spark/spark-1.6.0/spark-1.6.0-bin-hadoop2.6.tgz | tar xzf - -C /usr/local
# download mesos
RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    apt-get -y update && \
    apt-get -y install mesos=0.28.1-2.0.20.ubuntu1404
# clean cache
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV MESOS_NATIVE_JAVA_LIBRARY=/usr/lib/libmesos.so \
    JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 \
    SPARK_HOME=/usr/local/spark-1.6.0-bin-hadoop2.6
ENV PATH=$JAVA_HOME/bin:$PATH
WORKDIR $SPARK_HOME
