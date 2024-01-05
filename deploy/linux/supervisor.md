### 单机kafka
[program:zookeeper]
command=/data/kafka/bin/zookeeper-server-start.sh /data/kafka/config/zookeeper.properties
numprocs=1
autostart=true
startretries=3
autorestart=true
redirect_stderr=false
stdout_logfile=/data/supervisorlog/zookeeper.log
stdout_logfile_maxbytes=50MB
stdout_logfile_backups=10
stderr_logfile=/data/supervisorlog/zookeeper.log
stderr_logfile_maxbytes=10MB

[program:kafka]
command=/data/kafka/bin/kafka-server-start.sh /data/kafka/config/server.properties
numprocs=1
autostart=true
startretries=3
autorestart=true
redirect_stderr=false
stdout_logfile=/data/supervisorlog/kafka.log
stdout_logfile_maxbytes=50MB
stdout_logfile_backups=10
stderr_logfile=/data/supervisorlog/kafka.log
stderr_logfile_maxbytes=10MB