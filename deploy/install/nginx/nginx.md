### CenterOS 7.X

#### Nginx 安装

https://mp.weixin.qq.com/s?__biz=MzAwNTM5Njk3Mw==&mid=2247507800&idx=1&sn=310b7d7b31bb4884093c4be3a1ec9b75&chksm=9b1fdfdaac6856cc193c2c7dde433850f67bef2440a10a481b9c7a24ed5ec62b24ca1dc42ea8&scene=21#wechat_redirect

```bash
yum install -y nginx
systemctl start nginx
nginx -v
systemctl status nginx
systemctl enable nginx
systemctl daemon-reload

# 验证配置文件
nginx -t 
# 重启nginx使配置文件生效
nginx -s reload
```
# nginx高可用部署

## keepalived 安装
```bash
cd /usr/local/src
wget https://www.keepalived.org/software/keepalived-2.2.7.tar.gz
cd keepalived-2.2.7/
yum install -y openssl openssl-devel libnl libnl-devel
./configure --prefix=/usr/local/keepalived
make && make install
```