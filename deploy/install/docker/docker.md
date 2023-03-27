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


### ubuntu 安装docker
```
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update

# List the available versions:
apt-cache madison docker-ce | awk '{ print $3 }'

VERSION_STRING=5:20.10.23~3-0~ubuntu-jammy
sudo apt-get install docker-ce=$VERSION_STRING docker-ce-cli=$VERSION_STRING containerd.io docker-buildx-plugin docker-compose-plugin


sudo systemctl enable docker.service
sudo systemctl enable containerd.service
```

### ubuntu 卸载ubuntu
```
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras

sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
```


### docker 命令详解
https://docs.docker.com/engine/reference/commandline/logs/