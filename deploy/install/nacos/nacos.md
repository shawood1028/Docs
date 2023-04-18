```bash
#单机版部署
下载安装包

wget https://github.com/alibaba/nacos/releases/download/2.1.1/nacos-server-2.1.1.tar.gz

tar -xzf nacos-server-2.1.1.tar.gz -C /usr/local/

单机模式运行:

bash startup.sh -m standalone
```

```bash
# 集群版部署
# https://nacos.io/zh-cn/docs/cluster-mode-quick-start.html

wget https://github.com/alibaba/nacos/releases/download/2.1.1/nacos-server-2.1.1.tar.gz

tar -xzf nacos-server-2.1.1.tar.gz -C /usr/local/
# 修改配置
cp  /usr/local/nacos/conf/cluster.conf.example /usr/local/nacos/conf/cluster.conf
vim /usr/local/nacos/conf/cluster.conf
vim /usr/local/nacos/conf/application.properties

sh startup.sh
```

