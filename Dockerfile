# refer 'http://spark.apache.org/docs/latest/running-on-mesos.html#spark-properties'
# on 'spark.mesos.executor.docker.image' section
FROM ubuntu:14.04
WORKDIR /linker
RUN ln -f -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#download mesos
RUN apt-get update && \
    apt-get -y install openjdk-7-jre python-pip git vim curl supervisor

RUN git clone https://github.com/adolphlwq/linkerProcessorSample.git && \
    curl -fL http://archive.apache.org/dist/spark/spark-1.6.0/spark-1.6.0-bin-hadoop2.6.tgz | tar xzf - -C /usr/local && \
    apt-get clean

# download dependencies
RUN mkdir -p /linker/jars && \
    cd /linker/jars && \
    curl -O http://central.maven.org/maven2/org/apache/spark/spark-streaming-kafka_2.10/1.6.0/spark-streaming-kafka_2.10-1.6.0.jar

ADD supervisord.conf /etc/supervisord.conf

ENV MESOS_NATIVE_JAVA_LIBRARY=/usr/lib/libmesos.so \
    JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 \
    SPARK_HOME=/usr/local/spark-1.6.0-bin-hadoop2.6
ENV PATH=$JAVA_HOME/bin:$PATH
WORKDIR $SPARK_HOME
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
