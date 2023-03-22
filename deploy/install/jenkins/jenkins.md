### docker安装jenkins
```

docker pull jenkins/jenkins:centos7-jdk11

# 正常启动
docker run \
  -u root \
  -d \
  --name jenkins \
  -p 8080:8080 \
  -p 50000:50000 \
  -v /home/jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins/jenkins:centos7-jdk11

sudo chown -R 1000 /home/jenkins_home/
```
```
# 删除docker镜像残留文件
sudo rm -rf /home/jenkins_home  /etc/localtime
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

f74efa622cf446709785ca004dc3d3f3

### war包运行jenkins
```

nohup java -jar jenkins.war --httpPort=8080 > jenkins.log 2>&1 &
```