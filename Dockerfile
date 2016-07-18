# refer 'http://spark.apache.org/docs/latest/running-on-mesos.html#spark-properties'
# on 'spark.mesos.executor.docker.image' section
FROM ubuntu:14.04

RUN ln -f -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#download mesos
RUN apt-get update && \
    apt-get -y install openjdk-7-jre python-pip vim curl supervisor

RUN curl -fL http://archive.apache.org/dist/spark/spark-1.6.0/spark-1.6.0-bin-hadoop2.6.tgz |\ 	   tar xzf - -C /usr/local && \
    apt-get clean

# download dependencies
ADD requirements.txt /tmp/requirements.txt
ADD supervisord.conf /etc/supervisord.conf
RUN pip install -r /linker/requirements.txt && \
	rm /tmp/requirements.txt

ENV MESOS_NATIVE_JAVA_LIBRARY=/usr/lib/libmesos.so \
    JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 \
    SPARK_HOME=/usr/local/spark-1.6.0-bin-hadoop2.6
ENV PATH=$JAVA_HOME/bin:$PATH
WORKDIR $SPARK_HOME
VOLUME /linker
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]