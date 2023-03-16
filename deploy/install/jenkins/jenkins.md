docker pull jenkins:2.60.3

3c253e867c374b8abeafa0bbfbe4e646

sudo docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v /home/jenkins_home:/var/jenkins_home  -v /etc/localtime:/etc/localtime jenkins:2.60.3 bash