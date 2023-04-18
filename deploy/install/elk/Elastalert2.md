#### Elastalert2 安装

```bash
# 拉取镜像
docker pull jertel/elastalert2:2.10.0

# 启动镜像
docker run -itd --restart=always  --name elastalert2     -v /opt/elastalert/data:/opt/elastalert/data     -v /opt/elastalert/config.yaml:/opt/elastalert/config.yaml     -v /opt/elastalert/rules:/opt/elastalert/rules     -v /opt/elastalert/elastalert_modules:/opt/elastalert/elastalert_modules     -e ELASTICSEARCH_HOST="192.168.0.210"     -e ELASTICSEARCH_PORT=9200     -e CONTAINER_TIMEZONE="Asia/Shanghai"      -e SET_CONTAINER_TIMEZONE=True     -e TZ="Asia/Shanghai"     -e SET_CONTAINER_TIMEZONE=True     -e ELASTALERT_BUFFER_TIME=10      -e ELASTALERT_RUN_EVERY=1      jertel/elastalert2:2.10.0 --verbose

# 进入容器
docker exec -it elastalert2 bash
```