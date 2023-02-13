# flume-kafka

## flume 设置
1. flume 安装以及基础配置见官网:
    https://flume.apache.org/releases/content/1.9.0/FlumeUserGuide.html

2. flume拉取日志送入kafka

    1.flume 配置：
    ```
        --  ./conf/conf/doc-kafka.properties

        #拉取日志到kafka
        # agent
        a1.sources = r1
        a1.channels = c1
        a1.sinks = k1

        # source的配置
        # source类型
        a1.sources.r1.type = TAILDIR

        a1.sources.r1.channels = c1
        a1.sources.r1.positionFile = /opt/flume/conf/jsons/app.json

        # 监控的目录
        a1.sources.r1.filegroups = f1
        a1.sources.r1.filegroups.f1 = /data/logs/app/*.log
        a1.sources,r1.fileHeader = true

        # set kafka sink
        a1.sinks.k1.channel = c1
        a1.sinks.k1.type = org.apache.flume.sink.kafka.KafkaSink
        a1.sinks.k1.kafka.topic = myapp
        a1.sinks.k1.bootstrap.servers = 192.168.5.34:9092,192.168.5.36:9092,192.168.5.37:9092
        a1.sinks.k1.kafka.flumeBatchSize = 20
        a1.sinks.k1.kafka.producer.acks = 1
        a1.sinks.k1.kafka.producer.linger.ms = 1
        a1.sinks.k1.kafka.producer.compression.type = snappy

        # set file channel
        a1.channels.c1.type = file
        a1.channels.c1.checkpointDir = /data/logs/flume_channels/c1/checkpoint
        a1.channels.c1.dataDirs = /data/logs/flume_channels/c1/data
    ```
3. kafka 配置(其中一个节点)