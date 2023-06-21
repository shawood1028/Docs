### CenterOS 7.X

安装jdk

oracle 下载 jdk-8u371-linux-x64.tar.gz

```bash
mkdir /usr/lib/jvm/
tar -xzf jdk-8u371-linux-x64.tar.gz -C /usr/lib/jvm/
vim /etc/profile
```

### 最后一行粘贴以下

```bash
# jdk环境变量配置

export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_371
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

source /etc/profile
java -version
```

### jdk11

```bash
mkdir /usr/lib/jvm/
tar -xzf jdk-11.0.18_linux-x64_bin.tar.gz -C /usr/lib/jvm/
vim /etc/profile
```

```bash
# jdk环境变量配置

export JAVA_HOME=/usr/lib/jvm/jdk-11.0.18
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

source /etc/profile
java -version
```