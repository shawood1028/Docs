# project start 
## 1. flume
### start app01
```bash
nohup bin/flume-ng agent --conf conf --conf-file conf/app_01.conf --name a1 >/dev/null 2>&1 &
```

## 2. zookeeper
### start zookeeper
```bash
bin/zkServer.sh start
```

## 3. kafka
### start kafka
```bash
nohup ./bin/kafka-server-start.sh ./config/server.properties 1>/dev/null 2>&1 &
```

## 4. flink
### start flink
```bash
./bin/start-cluster.sh
```

## 5. efka
### start efka
```bash
ke.sh start
```

## 6. hadoop
### start hadoop
```bash
# start yarn
./sbin/start-yarn.sh
# start hdfs
./sbin/start-dfs.sh
```

## 7. hbase
### start hbase
``` bash

```