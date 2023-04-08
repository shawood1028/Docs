####  拉取镜像
docker pull sonatype/nexus3:3.50.0
```bash
#停止服务
docker stop --time=120 nexus
docker run -d -p 8081:8081 --name nexus -e INSTALL4J_ADD_VM_PARAMS="-Xms2703m -Xmx2703m -XX:MaxDirectMemorySize=2703m -Djava.util.prefs.userRoot=/some-other-dir" sonatype/nexus3
# docker volume create --name nexus-data
# docker run -d -p 8081:8081 --name nexus -v nexus-data:/nexus-data sonatype/nexus3
mkdir /home/nexus-data && chown -R docker:docker /home/nexus-data 
docker run -itd -p 8081:8081 --name nexus --privileged=true -e INSTALL4J_ADD_VM_PARAMS="-Xms4g -Xmx4g -XX:MaxDirectMemorySize=3g -Djava.util.prefs.userRoot=/nexus-data/javaprefs" -v /usr/local/nexus-data:/nexus-data sonatype/nexus3:3.50.0
# Docker开启远程API端口
https://blog.csdn.net/dongl890426/article/details/83714936
https://img-blog.csdnimg.cn/20200809114655566.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTQzMzEyODg=,size_16,color_FFFFFF,t_70
47.101.138.195:8081

```