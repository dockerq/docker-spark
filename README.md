# Init
[![Docker Pulls](https://img.shields.io/docker/pulls/adolphlwq/docker-spark.svg?maxAge=2592000)]()

This image is built as Spark Driver to run on Mesos to scheduler spark app in Mesos Cluster

## spark driver marathon json
```json
{
  "id": "/demo/perf-spark-driver",
  "cmd": "/usr/sbin/netdata -u netdata -d 1.5",
  "cpus": 1,
  "mem": 3096,
  "disk": 0,
  "instances": 1,
  "container": {
    "type": "DOCKER",
    "volumes": [],
    "docker": {
      "image": "adolphlwq/docker-spark:perf-spark-executor-1.6.0-openjdk-7-jre",
      "network": "BRIDGE",
      "portMappings": [
        {
          "containerPort": 19999,
          "hostPort": 0,
          "servicePort": 10009,
          "protocol": "tcp",
          "name": "19999",
          "labels": {}
        }
      ],
      "privileged": true,
      "parameters": [],
      "forcePullImage": false
    }
  },
  "portDefinitions": [
    {
      "port": 10009,
      "protocol": "tcp",
      "labels": {}
    }
  ]
}
```
