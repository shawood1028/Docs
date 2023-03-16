### 

其构建镜像
docker build -t shawood:mysql8 .

运行
docker run -itd -p 3306:3306 -p 33060:33060 -p 33061:33061 --name shawood_mysql8  shawood:mysql8 /bin/bash