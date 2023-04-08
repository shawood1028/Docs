### docker安装jenkins
```
# 拉取jenkins镜像
docker pull jenkins/jenkins:centos7-jdk11
# 正常启动
docker run \
  -u root \
  -d \
  --name jenkins2 \
  --net=host \
  -p 8080:8080 \
  -p 50000:50000 \
  -v /home/jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --restart=always
  jenkins/jenkins:centos7-jdk11

docker run \
  -u root \
  -d \
  --name jenkins2 \
  --net=host \
  -p 8080:8080 \
  -p 50000:50000 \
  -v /home/jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e TZ=Asia/Shanghai \
  jenkins:1.0

sudo chown -R 1000 /home/jenkins_home/
```
```
# 设置运行docker不需要root权限
sudo groupadd docker
sudo usermod -aG docker $USER
# You can also run the following command to activate the changes to groups
# or log out and log back in
newgrp docker
```
jenkins地址
http://192.168.20.200:8080

账号密码

jkadmin  
abcd1234!

### war包运行jenkins
```

nohup java -jar jenkins.war --httpPort=8080 > jenkins.log 2>&1 &
```

```
# 删除docker镜像残留文件
sudo rm -rf /home/jenkins_home  /etc/localtime
```

### 打包流程
1. git，svn更新，项目内打好jar包
2. 发送jar包至对应服务器
3. 远程服务器停止服务，删除原有jar包，启动服务