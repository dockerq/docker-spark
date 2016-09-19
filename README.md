# Spark docker image
[![Docker Pulls](https://img.shields.io/docker/pulls/adolphlwq/docker-spark.svg?maxAge=2592000)]()

## Info
- Spark 1.6.0
- Mesos 0.28.1
- Jre 1.7

## Usage
- SPARK_HOME :`/usr/local/spark-1.6.0-bin-hadoop2.6`
- Try on docker image

  ```
  sudo docker run -it --name spark-try --net host adolphlwq/docker-spark bash
  ```

### Use it on Mesos Cluster as Mesos Spark executor
Refer **[Spark on Mesos](http://spark.apache.org/docs/latest/running-on-mesos.html#mesos-docker-support)** And **[Spark configuration](http://spark.apache.org/docs/latest/running-on-mesos.html#configuration)** for more details.

- Instance SparkConf

  ```python
  conf = SparkConf()
  conf.setMaster(mesos_endpoint)
  conf.set("spark.mesos.executor.docker.image", "adolphlwq/docker-spark")
  conf.set("spark.mesos.executor.home", "/usr/local/spark-1.6.0-bin-hadoop2.6")
  ```
- Instance SparkContext

  ```python
  sc = SparkContext(conf=conf)
  below is your code
  ...
  ```

## TODOs
No todos. Any issues is welcome.
