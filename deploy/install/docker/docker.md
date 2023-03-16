### centos 安装docker
``` bash


sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

sudo yum install -y yum-utils

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum list docker-ce --showduplicates | sort -r


docker-ce.x86_64            3:23.0.1-1.el7                      docker-ce-stable
docker-ce.x86_64            3:23.0.0-1.el7                      docker-ce-stable
docker-ce.x86_64            3:20.10.9-3.el7                     docker-ce-stable


# 安装指定版本
sudo yum install docker-ce-23.0.1 docker-ce-cli-23.0.1 containerd.io docker-buildx-plugin docker-compose-plugin


sudo systemctl start docker


sudo docker run hello-world

# TODO 更换docker国内源

#
\ apt update \ apt install -y mysql-server-8.0 \
mysql --version
```

