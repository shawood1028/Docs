### CenterOS 7.X
#### jenkins 安装

1. 设置yum源 安装jdk-11

   ```bash
   sudo yum install -y ca-certificates
   sudo wget -O /etc/yum.repos.d/jenkins.repo \
       https://pkg.jenkins.io/redhat-stable/jenkins.repo
   sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
   sudo yum upgrade
   # Add required dependencies for the jenkins package
   sudo yum install java-11-openjdk
   java -version
   # 指定版本安装
   yum install jenkins-2.375.3-1.1
   ```

2. 设置jenkins开机自动启动

   ```bash
   sudo systemctl enable jenkins
   sudo systemctl start jenkins
   sudo systemctl status jenkins
   sudo systemctl daemon-reload
   ```


3. 安装git maven

4. 设置jenkins git maven

5. 设置jenkins自动化部署流程

