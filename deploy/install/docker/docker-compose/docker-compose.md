### docker-compose

#### 1. 安装

```bash
# sudo curl -L https://download.fastgit.org/docker/compose/releases/download/2.17/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker run -d -p 8081:8081 --name nexus2 --net=host -e TZ=Asia/Shanghai -e INSTALL4J_ADD_VM_PARAMS="-Xms4g -Xmx4g -XX:MaxDirectMemorySize=3g -Djava.util.prefs.userRoot=/nexus-data/javaprefs" -v /home/nexus-data:/nexus-data nexus:1.0


docker-compose up -d --no-create
```

