# Spark/Kafka Performance/Stress Test

Spark Stress Test

## Kafka Stress test
### tools
- Vmstat
- iostat

### 1 partition 1replicas 1 thread
>1CPU 2G mem

- add test topic
```shell
dcos kafka topic add stress-test-00 --broker 0 --partition 1 --replicas 1
```
- test script
```
bin/kafka-producer-perf-test.sh  --topic kafka-test-02 --broker-list 10.140.0.18:1026 --initial-message-id 0  --threads 1  --messages 1000000
```

#### 1000000 message
- result
```
start.time, end.time, compression, message.size, batch.size, total.data.sent.in.MB, MB.sec, total.data.sent.in.nMsg, nMsg.sec
2016-08-04 08:27:55:115, 2016-08-04 08:28:05:253, 0, 100, 200, 95.37, 9.4069, 1000000, 98638.7848
```
- usage
    - `1000000`: `cpu`58%-60% `mem`1.8%

#### 10000000 message
- result
```
start.time, end.time, compression, message.size, batch.size, total.data.sent.in.MB, MB.sec, total.data.sent.in.nMsg, nMsg.sec
2016-08-04 08:50:47:085, 2016-08-04 08:51:59:651, 0, 100, 200, 953.67, 13.1422, 10000000, 137805.5839
```
- usage
    - `10000000`:`cpu`35%-46% `mem`2.1%

#### 100000000 message
- result
```
start.time, end.time, compression, message.size, batch.size, total.data.sent.in.MB, MB.sec, total.data.sent.in.nMsg, nMsg.sec
2016-08-04 08:58:49:443, 2016-08-04 09:08:19:876, 0, 100, 200, 9536.74, 16.7184, 100000000, 175305.4259
```
- usage
    - `100000`:`cpu`45% `mem`2.1%










### 1 partition 1replicas 2 thread
#### 1000000 message
- result
```
start.time, end.time, compression, message.size, batch.size, total.data.sent.in.MB, MB.sec, total.data.sent.in.nMsg, nMsg.sec
2016-08-04 10:26:10:519, 2016-08-04 10:26:16:538, 0, 100, 200, 95.37, 15.8444, 1000000, 166140.5549
```
- usage
    - `1000000`:`cpu`52% `mem`2.2%

#### 10000000 message
- result
```
start.time, end.time, compression, message.size, batch.size, total.data.sent.in.MB, MB.sec, total.data.sent.in.nMsg, nMsg.sec
2016-08-04 10:27:00:123, 2016-08-04 10:27:37:454, 0, 100, 200, 953.67, 25.5464, 10000000, 267873.8850
```
- usage
    - `10000000`:`cpu`65%-78% `mem`2.2%

#### 100000000 message
- result
```
start.time, end.time, compression, message.size, batch.size, total.data.sent.in.MB, MB.sec, total.data.sent.in.nMsg, nMsg.sec
2016-08-04 10:29:11:585, 2016-08-04 10:35:08:522, 0, 100, 200, 9536.74, 26.7183, 100000000, 280161.4851
```
- usage
    - `100000000`:`cpu`65%-81% `mem`2.3%



### 1 partition 1replicas 3 thread
#### 1000000 message
- result
```
start.time, end.time, compression, message.size, batch.size, total.data.sent.in.MB, MB.sec, total.data.sent.in.nMsg, nMsg.sec
2016-08-04 10:35:37:986, 2016-08-04 10:35:43:692, 0, 100, 200, 95.37, 16.7135, 999999, 175253.9432
```
- usage
    - `1000000`:`cpu`58% `mem`2.3%

#### 10000000 message
- result
```
start.time, end.time, compression, message.size, batch.size, total.data.sent.in.MB, MB.sec, total.data.sent.in.nMsg, nMsg.sec
2016-08-04 10:36:47:665, 2016-08-04 10:37:24:262, 0, 100, 200, 953.67, 26.0588, 9999999, 273246.4136
```
- usage
    - `10000000`:`cpu`65%-78% `mem`2.3%

#### 100000000 message
- result
```
start.time, end.time, compression, message.size, batch.size, total.data.sent.in.MB, MB.sec, total.data.sent.in.nMsg, nMsg.sec
2016-08-04 10:38:19:594, 2016-08-04 10:43:52:753, 0, 100, 200, 9536.74, 28.6252, 99999999, 300156.9791
```
- usage
    - `100000000`:`cpu`70%-96% `mem`2.3%

### 1 partition 1replicas 4 thread
#### 1000000 message
- result
```
start.time, end.time, compression, message.size, batch.size, total.data.sent.in.MB, MB.sec, total.data.sent.in.nMsg, nMsg.sec
2016-08-04 10:46:04:559, 2016-08-04 10:46:10:917, 0, 100, 200, 95.37, 14.9996, 1000000, 157282.1642
```
- usage
    - `1000000`:`cpu`58% `mem`2.4%

#### 10000000 message
- result
```
start.time, end.time, compression, message.size, batch.size, total.data.sent.in.MB, MB.sec, total.data.sent.in.nMsg, nMsg.sec
2016-08-04 10:46:04:559, 2016-08-04 10:46:10:917, 0, 100, 200, 95.37, 14.9996, 1000000, 157282.1642
```
- usage
    - `10000000`:`cpu`58% `mem`2.4%
## Reference
- [Testing Spark: Best Practices](https://spark-summit.org/2014/wp-content/uploads/2014/06/Testing-Spark-Best-Practices-Anupama-Shetty-Neil-Marshall.pdf)
- [Performance testing](https://cwiki.apache.org/confluence/display/KAFKA/Performance+testing)
- [Kafka repo test script](https://gist.github.com/jkreps/c7ddb4041ef62a900e6c)
