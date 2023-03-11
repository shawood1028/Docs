### CenterOS 7.X

```bash
安装redis
yum install -y tcl gcc
wget https://download.redis.io/releases/redis-6.2.6.tar.gz
tar -xzf redis-6.2.6.tar.gz
make MALLOC=libc
make install PREFIX=/usr/local/redis
需要修改redis的配置文件：redis.conf。将该配置文件中的配置改为 daemonize yes  protected-mode no
目录下 ./bin/redis-server redis.conf
ps -ef | grep redis
# requirepass foobared 将注释去掉，修改foobared 为自己想要的密码，如 requirepass uNiepoh7aighoc/e
将bind 127.0.0.1 注释或者改为bind 0.0.0.0

#  uNiepoh7aighoc/e
```

