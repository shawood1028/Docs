#### ELK 集群安装 (8.6.2)

jdk版本要求:

**https://www.elastic.co/cn/support/matrix#matrix_jvm**

```bash
# 创建目录下载资源
mkdir /opt/elk && cd /opt/elk/
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.6.2-linux-x86_64.tar.gz
wget https://artifacts.elastic.co/downloads/logstash/logstash-8.6.2-linux-x86_64.tar.gz
wget https://artifacts.elastic.co/downloads/kibana/kibana-8.6.2-linux-x86_64.tar.gz
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

```bash
# 生成kibana所需要的token
./bin/elasticsearch-create-enrollment-token -s kibana --url "https://127.0.0.1:9200"
#启动服务
nohup ./bin/logstash -f config/greload.yml &

bin/logstash -f logstash.conf --config.reload.automatic
bin/logstash -f logstash.conf --config.reload.automatic
```


```bash
# 启动es
# 停止es
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

#### Filebeat安装（old）

```bash
wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.6.2-linux-x86_64.tar.gz
tar -xzf filebeat-8.6.2-linux-x86_64.tar.gz -C /opt/ && mv /opt/filebeat-8.6.2-linux-x86_64 /opt/filebeat
cd /opt/filebeat &&  nohup ./filebeat -e -c filebeat.yml > filebeat.log &

# 查看filebeat运行状态
ps -ef | grep filebeat

# 查看filebeat日志
tail -f -n 100 /var/log/messages
```

#### 阿里云(new)

cd /usr/local

##### 安装elasticsearch 

```
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.6.2-linux-x86_64.tar.gz
sudo tar -xzf elasticsearch-8.6.2-linux-x86_64.tar.gz -C /usr/local
sudo mv /usr/local/elasticsearch-8.6.2 -C /usr/local/elasticsearch
sudo chown -R ecs-user:ecs-user /usr/local/elasticsearch
```

##### 安装logstash

```bash
# 下载安装包
wget https://artifacts.elastic.co/downloads/logstash/logstash-8.6.2-linux-x86_64.tar.gz
# 解压安装包
sudo tar -xzf logstash-8.6.2-linux-x86_64.tar.gz -C /usr/local
sudo mv /usr/local/logstash-8.6.2 /usr/local/logstash
sudo chown -R ecs-user:ecs-user /usr/local/logstash
```

##### 安装kibana

```bash
# 下载安装包
wget https://artifacts.elastic.co/downloads/kibana/kibana-8.6.2-linux-x86_64.tar.gz
sudo tar -xzf kibana-8.6.2-linux-x86_64.tar.gz -C /usr/local
sudo mv /usr/local/kibana-8.6.2 /usr/local/kibana
sudo chown -R ecs-user:ecs-user /usr/local/kibana
```



##### 安装filebeat

```bash
wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.6.2-linux-x86_64.tar.gz
tar -xzf filebeat-8.6.2-linux-x86_64.tar.gz -C /usr/local/ && mv /usr/local/filebeat-8.6.2-linux-x86_64 /usr/local/filebeat
# sudo chown -R ecs-user:ecs-user /usr/local/filebeat
# 修改配置
vim /usr/local/filebeat/filebeat.yml
# 测试
cd /usr/local/filebeat &&  nohup ./filebeat -e -c filebeat.yml > filebeat.log &

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
# 设置为系统服务
cd /usr/lib/systemd/system && vim filebeat.service
vim /usr/lib/systemd/system/filebeat.service

# filebeat.service 添加以下内容
[Unit]
Description=filebeat server daemon
Documentation=/usr/local/filebeat/filebeat -help
Wants=network-online.target
After=network-online.target

[Service]
User=root
Group=root
ExecStart=/usr/local/filebeat/filebeat -e -c /usr/local/filebeat/filebeat.yml
Restart=always

[Install]
WantedBy=multi-user.target
```

```
systemctl enable filebeat
systemctl start filebeat
systemctl status filebeat

sudo systemctl daemon-reload
sudo systemctl restart filebeat
```