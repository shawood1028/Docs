### CenterOS 7.X

#### mysql8 安装(8.0.32)

链接地址:https://www.jianshu.com/p/224a891932d8

```bash
rpm -qa|grep -i mariadb
rpm -qa|grep mariadb|xargs rpm -e --nodeps
rpm -qa|grep -i mariadb
rpm -qa|grep mysql

wget http://repo.mysql.com/mysql80-community-release-el7-7.noarch.rpm
rpm -ivh mysql80-community-release-el7-7.noarch.rpm

yum install -y mysql-community-server
systemctl start mysqld
mysql -V
systemctl status mysqld
systemctl enable mysqld
systemctl daemon-reload
systemctl list-unit-files|grep mysqld

mysqld --initialize

# 临时密码    &g1dY8FcKEUX
grep 'temporary password' /var/log/mysqld.log

# ij4teeD+iebed_oh
alter user 'root'@'localhost' identified by 'xxxxxxxxxx';

use mysql;

#修改root账户权限
update user set host = '%' where user = 'root';

#刷新权限
flush privileges;
```

### wsl 安装mysql
```bash
# 安装
wget  https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-boost-8.0.32.tar.gz

tar -zxvf mysql-boost-8.0.32.tar.gz
cd mysql-8.0.32
cmake -DCMAKE_INSTALL_PREFIX=/usr/local/mysql -DMYSQL_DATADIR=/dbdata/mysql/data -DWITH_BOOST=boost -DFORCE_INSOURCE_BUILD=ON

sudo make && make install

groupadd mysql
useradd -g mysql mysql
mkdir -p /dbdata/mysql/data
chown -R mysql:mysql /usr/local/mysql
chown -R mysql:mysql /dbdata/mysql
# 初始化
sudo /usr/local/mysql/bin/mysqld --initialize --user=mysql --basedir=/usr/local/mysql --datadir=/dbdata/mysql/data
```

```
# 配置my.cnfvim /etc/my.cnf
# 然后写入以下内容 
[client]
socket = /tmp/mysql.sock
 
[mysqld]
socket = /tmp/mysql.sock
basedir = /usr/local/mysql
datadir = /dbdata/mysql/data

# 配置服务项

sudo cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysqld
sudo chmod +x /etc/init.d/mysqld 
update-rc.d mysqld defaults
service mysqld start

# 添加环境变量

sudo vim /etc/profile

# 最后一行添加

# MySQL PATH
export PATH=/usr/local/mysql/bin:$PATH

# 生效
source /etc/profile
```
### 允许远程连接
```bash
#mysql初始化
mysqld --initialize
# x;>bp7TKR1e_
grep 'temporary password' /var/log/mysqld.log
mysql -u root -p 
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Solomon123@!';
set global validate_password.policy=LOW;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'abcd1234!';
# 允许mysql远程访问
create user root@'%' identified by 'abcd1234!';
grant all privileges on *.* to root@'%' with grant option;
FLUSH PRIVILEGES;
sudo vim /etc/my.cnf
# 添加配置
[mysqld]
port=3306
bind-address=0.0.0.0
# 重启服务
systemctl restart mysqld
```
systemctrl 管理服务
wsl 使用service
```
systemctl start mysqld 
systemctl stop mysqld
systemctl restart mysqld
```

### centos允许远程连接