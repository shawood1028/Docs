#### ELK 集群安装 (8.6.2)

jdk版本要求:

**https://www.elastic.co/cn/support/matrix#matrix_jvm**

```bash
# 创建目录下载资源
mkdir /opt/elk && cd /opt/elk/
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.6.2-linux-x86_64.tar.gz
wget https://artifacts.elastic.co/downloads/kibana/kibana-8.6.2-linux-x86_64.tar.gz
wget https://artifacts.elastic.co/downloads/logstash/logstash-8.6.2-linux-x86_64.tar.gz
# 分发二进制包
scp kibana-8.6.2-linux-x86_64.tar.gz logstash-8.6.2-linux-x86_64.tar.gz root@192.168.0.212:/opt/elk/
# 解压
tar -xzf elasticsearch-8.6.2-linux-x86_64.tar.gz && tar -xzf kibana-8.6.2-linux-x86_64.tar.gz && tar -xzf logstash-8.6.2-linux-x86_64.tar.gz 
# 改名
mv elasticsearch-8.6.2 elasticsearch && mv kibana-8.6.2 kibana && mv logstash-8.6.2 logstash
# 使用es用户
useradd es
chown -R es:es elasticsearch kibana logstash

su es
mkdir -p /data/elk/ 
chown -R es:es /data/elk/ 
```

```bash
#启动服务
./bin/logstash -f config/greload.yml
```

```bash
# 调整进程最大打开文件数
# 临时设置
ulimit -n 65535
# 永久设置，重启生效 (阿里云ecs已修改)
vi /etc/security/limits.conf

* hard nofile 65535
* soft nofile 65535
```

```bash
# 调整进程最大虚拟内存区域数量
#临时设置
sysctl -w vm.max_map_count=262144
# 永久设置
echo "vm.max_map_count=262144" >> /etc/sysctl.conf
sysctl -p

# 重启
```

**集群配置**

停止es:

```bash
./bin/elasticsearch -d -p pid

kill -SIGTERM (es pid)
```

master

```yml
# vim config/elasticsearch.yml
cluster.name: elk-cluster # 集群名称
node.name: node-1 # 集群节点名称
#path.data: /path/to/data # 数据目录
#path.logs: /path/to/logs # 日志目录
network.host: 0.0.0.0 # 监听地址
http.port: 9200 # 监听端口
# transport.tcp.port: 9300 #内部节点之间通信端口
discovery.seed_hosts: [“192.168.31.61”, “192.168.31.62”,“192.168.31.63”] # 集群节点列表
cluster.initial_master_nodes: [“node-1”] # 首次启动指定的Master节点
```

#### Filebeat安装

```bash
wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.6.2-linux-x86_64.tar.gz
tar -xzf filebeat-8.6.2-linux-x86_64.tar.gz -C /opt/ && mv /opt/filebeat-8.6.2-linux-x86_64 /opt/filebeat
cd /opt/filebeat &&  nohup ./filebeat -e -c filebeat.yml > filebeat.log &

# 查看filebeat运行状态
ps -ef | grep filebeat

# 查看filebeat日志
tail -f -n 100 /var/log/messages
```

```bash
# 设置读取时间戳之间的全部日志内容
  multiline:
      pattern: '[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}'
      negate: true
      match: after
```

```
cd /usr/lib/systemd/system && vim filebeat.service
# filebeat.service
[Unit]
Description=filebeat server daemon
Documentation=/opt/filebeat/filebeat -help
Wants=network-online.target
After=network-online.target
 
[Service]
User=root
Group=root
Environment="BEAT_CONFIG_OPTS=-c /opt/filebeat/filebeat.yml"
ExecStart=/opt/filebeat/filebeat $BEAT_CONFIG_OPTS
Restart=always
 
[Install]
WantedBy=multi-user.target
```

```
systemctl enable filebeat
systemctl status filebeat
systemctl start filebeat
```



#### Elastalert2 安装

```bash
# 拉取镜像
docker pull jertel/elastalert2:2.10.0

# 启动镜像
docker run -itd --restart=always  --name elastalert2     -v /opt/elastalert/data:/opt/elastalert/data     -v /opt/elastalert/config.yaml:/opt/elastalert/config.yaml     -v /opt/elastalert/rules:/opt/elastalert/rules     -v /opt/elastalert/elastalert_modules:/opt/elastalert/elastalert_modules     -e ELASTICSEARCH_HOST="192.168.0.210"     -e ELASTICSEARCH_PORT=9200     -e CONTAINER_TIMEZONE="Asia/Shanghai"      -e SET_CONTAINER_TIMEZONE=True     -e TZ="Asia/Shanghai"     -e SET_CONTAINER_TIMEZONE=True     -e ELASTALERT_BUFFER_TIME=10      -e ELASTALERT_RUN_EVERY=1      jertel/elastalert2:2.10.0 --verbose

# 进入容器
docker exec -it elastalert2 bash
```

