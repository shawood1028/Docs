# debian kafka install
## kafka 集群
```bash
# 解压安装
tar -xzf kafka_2.13-3.4.0.tgz -C /usr/local/ && mv /usr/local/kafka_2.13-3.4.0 /usr/local/kafka && cd /usr/local/kafka
vim config/kraft/server.properties

# 集群random-uuid
# NwqlQGw9SEi38SHV5SrzHA
./bin/kafka-storage.sh format -t NwqlQGw9SEi38SHV5SrzHA -c config/kraft/server.properties

```