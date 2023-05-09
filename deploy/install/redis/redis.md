### CenterOS 7.X

```bash
安装redis
yum install -y tcl gcc
wget https://download.redis.io/releases/redis-6.2.6.tar.gz
tar -xzf redis-6.2.6.tar.gz
cd redis-6.2.6/
make MALLOC=libc
make install PREFIX=/usr/local/redis
# 查看redis状态
ps -ef | grep redis
# 复制配置文件
cp redis.conf /usr/local/redis/
#启动
./bin/redis-server redis.conf
#停止
# redis redis-cli -h 127.0.0.1 -p 6379 shutdown
```

```bash
# redis配置
## 开发基本配置
daemonize yes  
protected-mode no
###对所有ip 开放
bind 0.0.0.0
###设置redis密码
requirepass abcd1234!
## 设置redis可用内存大小
maxmemory 8192mb
```

