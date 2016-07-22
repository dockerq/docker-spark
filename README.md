# Jupyter pyspark-notebook executor docker image
[![Docker Pulls](https://img.shields.io/docker/pulls/adolphlwq/docker-spark.svg?maxAge=2592000)]()

## Intro
This image is a mesos executor. It is for you to execute pyspark interactively on Jupyter pyspark-notebook.
I have download:
- Spark 1.6.0
- Java 7

Also, I create a user `jovyan` and image run as `jovyan` default.

## Usage
You can use this docker image as base image and download packages dependencies for you custom cases. For example:
```
FROM adolphlwq/docker-spark:pyspark-notebook-1.6.0
RUN pip install cassandra-driver ...
```
