#### clickhouse
    <yandex>
        <clickhouse_remote_servers>
            <ck_cluster>           <!--4分片1副本-->
                <shard>
                    <internal_replication>true</internal_replication>
                    <replica>
                        <host>172.31.28.80</host>
                        <port>9000</port>               #注意：若在users.xml中设置了用户和密码，此处要添加<user>test</user><password>123</password>
                    </replica>
                </shard>
                <shard>
                    <internal_replication>true</internal_replication>
                    <replica>
                        <host>172.31.20.190</host>
                        <port>9000</port>
                    </replica>
                </shard>
                <shard>
                    <internal_replication>true</internal_replication>
                    <replica>
                        <host>192.168.30.116</host>
                        <port>9000</port>
                    </replica>
                </shard>
            </ck_cluster>
        </clickhouse_remote_servers>
        <macros>      <shard>01</shard>      #注意：这里的内容，每个服务器的配置文件必须相同，否则复制表将无法操作
        <replica>172.31.28.80</replica>   #注意:每台服务器的配置文件。写自己的IP地址
        </macros>
        <networks>
            <ip>::</ip>
        </networks>
        <zookeeper>                                
            <node index="0">                  
                <host>172.31.28.80</host>
                <port>12181</port>                
            </node>
            <node index="1">
                <host>172.31.20.190</host>
                <port>12181</port>
            </node>
            <node index="2">
                <host>192.168.30.116</host>
                <port>12181</port>
            </node>
        </zookeeper>

        <clickhouse_compression>
            <case>
                <min_part_size>10000000000</min_part_size>
                <min_part_size_ratio>0.01</min_part_size_ratio>
                <method>lz4</method>
            </case>
        </clickhouse_compression>
    </yandex>