解压

# hive
export HIVE_HOME=/home/ubuntu/dev/hive-3.1.2
export PATH=$HIVE_HOME/bin:$PATH


解决 hive shell无法启动的问题

guava版本不一致，使用高版本。
$ rm /opt/shared/apache-hive-3.1.2-bin/lib/guava-19.0.jar
$ cp /opt/shared/hadoop-3.2.1/share/hadoop/hdfs/lib/guava-27.0-jre.jar /opt/shared/apache-hive-3.1.2-bin/lib/

创建hive 所需目录

  $ $HADOOP_HOME/bin/hadoop fs -mkdir       /tmp
  $ $HADOOP_HOME/bin/hadoop fs -mkdir       /user/hive/warehouse
  $ $HADOOP_HOME/bin/hadoop fs -chmod g+w   /tmp
  $ $HADOOP_HOME/bin/hadoop fs -chmod g+w   /user/hive/warehouse

安装mysql作为hive源数据库

更新源
sudo apt update

安装mysql
sudo apt install mysql-server
查看mysql服务状态
sudo service mysql status
查看密码
sudo cat /etc/mysql/debian.cnf

创建 ubuntu用户，密码为ubuntu
create user 'ubuntu'@'%' identified by 'ubuntu';