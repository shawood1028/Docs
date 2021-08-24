### 准备基础环境
使用腾讯云服务器，共四台
系统环境:ubuntu20.04
1. 设置hostname
    vim /etc/hostname
	```powershell
    10.206.0.14 shadow01
    10.206.0.2  shadow02
    10.206.0.13 shadow03
    10.206.0.16 shadow04
	```

2. 设置免密登陆
    ssh-keygen
    cat ~/.ssh/id_rsa.pub >> authorized_keys
    scp authorized_keys 文件到各节点主机
3. 下载安装包并解压  （[Hadoop3.2.2安装包下载链接](https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-3.2.2/hadoop-3.2.2.tar.gz)）
4. 安装java 
	```powershell
		sudo apt install openjdk-8*
	```
5. 配置java 和 hadoop环境变量

	```powershell
	export HADOOP_HOME=/home/ubuntu/dev/hadoop-3.2.2
	export PATH=$PATH:$HADOOP_HOME/bin
	
	export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
	export PATH=$JAVA_HOME/bin:$PATH
	export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
	```
6. 修改core-site.xml配置文件

	```xml
		<property>
		    <name>hadoop.tmp.dir</name>
		    <value>file:/data/hadoop/tmp</value>
		    <description>Abase for other temporary directories.</description>
		</property>
		<property>
		    <name>fs.defaultFS</name>
		    <value>hdfs://shadow01:9000</value>
		</property>
	```

7. 修改hdfs-site.xml配置文件 
	

	```bash
	vim etc/hadoop/hdfs-site.xml
	```
	
	```xml
	<property>
	    <!-- 主节点地址 -->
	    <name>dfs.namenode.http-address</name>
	    <value>shadow01:50070</value>
	</property>
	<property>
	    <name>dfs.replication</name>
	    <value>3</value>
	</property>
	<property>
	    <name>dfs.name.dir</name>
	    <value>/data/hadoop/hdfs/name</value>
	</property>
	<property>
	     <name>dfs.data.dir</name>
	     <value>/data/hadoop/hdfs/data</value>
	</property>
	<property>
	     <name>dfs.webhdfs.enabled</name>
	     <value>true</value>
	</property>
	<property>
		 <name>dfs.http.address</name>
		 <value>0.0.0.0:50070</value>
	</property>
	```
8. 修改mapred-site.xml 

	```bash
	vim etc/hadoop/mapred-site.xml
	```

  

	```xml
	<property>
	      <name>mapreduce.framework.name</name>
	      <value>yarn</value>
	</property>
	<property>
	      <name>mapred.job.tracker</name>
	      <value>http://shadow01:9001</value>
	</property>
	<property>
	      <name>mapreduce.jobhistory.address</name>
	      <value>shadow01:10020</value>
	</property>
	<property>
	      <name>mapreduce.jobhistory.webapp.address</name>
	      <value>shadow01:19888</value>
	</property>
	<property>
	　　　 <name>mapreduce.application.classpath</name>
	　　　 <value>$HADOOP_MAPRED_HOME/share/hadoop/mapreduce/*:$HADOOP_MAPRED_HOME/share/hadoop/mapreduce/lib/*</value>
	</property>
	```

9. 修改yarn-stie.xml配置文件

	```bash
	vim etc/hadoop/yarn-site.xml
    ```
	```xml
	<property>
	    <name>yarn.nodemanager.aux-services</name>
	    <value>mapreduce_shuffle</value>
	</property>
	<property>
	    <name>yarn.resourcemanager.hostname</name>
	    <value>shadow01</value>
	</property>
	<property>
	    <name>yarn.nodemanager.env-whitelist</name>
	    <value>JAVA_HOME,HADOOP_COMMON_HOME,HADOOP_HDFS_HOME,HADOOP_CONF_DIR,CLASSPATH_PREPEND_DISTCACHE,HADOOP_YARN_HOME,HADOOP_MAPRED_HOME</value>
	</property>
	<property>
	    <name>yarn.resourcemanager.webapp.address</name>
	    <value>118.195.233.186:8088</value>
	    <description>配置外网只需要替换外网ip为真实ip，否则默认为 localhost:8088</description>
	</property>
	<property>
		<name>yarn.resourcemanager.bind-host</name>
		<value>0.0.0.0</value>
	</property>
	```

10. 配置启动脚本:

	```bash
	*-dfs.sh
	HDFS_DATANODE_USER=root
	HDFS_DATANODE_SECURE_USER=hdfs
	HDFS_NAMENODE_USER=root
	HDFS_SECONDARYNAMENODE_USER=root
	*-yarn.sh
	YARN_RESOURCEMANAGER_USER=root
	HDFS_DATANODE_SECURE_USER=yarn
	YARN_NODEMANAGER_USER=root
	```
11. 添加hadoop环境变量

	```bash
	vim etc/hadoop/hadoop-env.sh
	```
	
	```bash
	export HADOOP_HOME=/home/ubuntu/dev/hadoop-3.2.2
	export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
	```

12. 创建hadoop相关文件存储路径

    ```bash
    sudo mkdir -p /data/hadoop
    sudo chown -R ubuntu:ubuntu /data
    ```
13. 配置从节点

	```bash
	scp -r hadoop-3.2.2 ubuntu@shadow02:~/dev/
	scp -r hadoop-3.2.2 ubuntu@shadow03:~/dev/
	scp -r hadoop-3.2.2 ubuntu@shadow04:~/dev/
	```
  

14. 初始化并启动

    ```bash
    ./bin/hdfs namenode -format
    ./sbin/start-all.sh
    ```


15. jps查看各服务器状态


如果各位同学实践中遇到问题，欢迎自己尝试以后交流~


