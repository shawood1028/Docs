### CenterOS 7.X

#### Maven安装

1. 下载安装Maven

```bash
# centos7.8
# build-server上安装maven
# centos、redhat 等类系统使用 yum 安装
yum install -y ca-certificates
cd /opt/packages
# 国内maven下载地址：
# https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.8.8/binaries/apache-maven-3.8.8-bin.tar.gz
wget https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.8.8/binaries/apache-maven-3.8.8-bin.tar.gz
tar -xzf apache-maven-3.8.8-bin.tar.gz -C /usr/local/
```

```bash
vim /etc/profile
```

在/etc/profile文件末尾加入如下配置

```bash
# Maven 环境变量配置
MAVEN_HOME=/usr/local/apache-maven-3.8.8
export PATH=${MAVEN_HOME}/bin:${PATH}
```

```bash
# 重载环境变量
# 查看Maven是否安装完成
source /etc/profile
mvn -version
```

2. 修改Maven源及配置

   替换maven源

   ```bash
   vim /usr/local/apache-maven-3.8.8/conf/settings.xml
   ```

   找到<mirrors></mirrors>标签对，添加一下代码：

   ```xml
    <mirror>
        <id>alimaven</id>
        <name>aliyun maven</name>
        <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
        <mirrorOf>central</mirrorOf>
    </mirror>
   ```

   指定下载资源位置

   ```bash
   mkdir /usr/local/apache-maven-3.8.8/repo
   ```

   ```xml
    <localRepository>/usr/local/apache-maven-3.8.8/repo</localRepository>
   ```

# 3.9.1
```bash
wget https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.9.1/binaries/apache-maven-3.9.1-bin.tar.gz
tar -xzf apache-maven-3.9.1-bin.tar.gz -C /usr/local/

vim /etc/profile
# Maven 环境变量配置
MAVEN_HOME=/usr/local/apache-maven-3.9.1
export PATH=${MAVEN_HOME}/bin:${PATH}
```
2. 修改Maven源及配置

   替换maven源

```bash
vim /usr/local/apache-maven-3.9.1/conf/settings.xml
```

   找到<mirrors></mirrors>标签对，添加一下代码：

   ```xml
    <mirror>
        <id>alimaven</id>
        <name>aliyun maven</name>
        <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
        <mirrorOf>central</mirrorOf>
    </mirror>
   ```

   指定下载资源位置

   ```bash
   mkdir /usr/local/apache-maven-3.9.1/repo
   ```

   ```xml
    <localRepository>/usr/local/apache-maven-3.9.1/repo</localRepository>
   ```