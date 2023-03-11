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
yum repolist all | grep mysql
systemctl list-unit-files|grep mysqld
systemctl enable mysqld.service

# 查看是否启动MySQL服务
ps -ef|grep mysql

# 启动服务
systemctl start mysqld.service

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

```
# 允许mysql远程访问
create user root@'%' identified by 'abcd1234!';
grant all privileges on *.* to root@'%' with grant option;
```

