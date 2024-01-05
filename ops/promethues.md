prometheus 相关操作 
1.取消服务注册
curl -X PUT http://172.31.1.243:8500/v1/agent/service/deregister/node-exporter-ip-172-31-29-103.eu-central-1.compute.internal