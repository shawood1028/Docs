1. 创建一个新的namespace
kubectl create namespace  summer

2. 在该namespace下创建一个deployment
kubectl create -f mysql-deployment.yaml

3. deployment自动部署好replicaSet和pod

4. 创建对应服务

5. 验证是否成功