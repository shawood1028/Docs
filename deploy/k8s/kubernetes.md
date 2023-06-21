# kubernetes
![部署演进图](https://d33wubrfki0l68.cloudfront.net/912f564f002e88449c79773b6eaae22c97e3210b/ac016/zh-cn/docs/images/container_evolution.svg)
- 节点（Node）: Kubernetes 集群中的一台工作机器，是集群的一部分。

- 集群（Cluster）: 一组运行由 Kubernetes 管理的容器化应用程序的节点。 在大多数常见的 Kubernetes 部署环境中，集群中的节点都不在公共网络中。

- 边缘路由器（Edge Router）: 在集群中强制执行防火墙策略的路由器。可以是由云提供商管理的网关，也可以是物理硬件。

- 集群网络（Cluster Network）: 一组逻辑的或物理的连接，根据 Kubernetes [网络模型](https://kubernetes.io/zh-cn/docs/concepts/cluster-administration/networking/)在集群内实现通信。

- 服务（Service）：Kubernetes [服务（Service）](https://kubernetes.io/zh-cn/docs/concepts/services-networking/service/)， 使用[标签](https://kubernetes.io/zh-cn/docs/concepts/overview/working-with-objects/labels/)选择器（selectors）辨认一组 Pod。 除非另有说明，否则假定服务只具有在集群网络中可路由的虚拟 IP。


### k8s ip地址类型
1. Node IP: Node节点的IP地址，即物理网卡的IP地址
2. Pod IP: Pod的IP地址，即docker容器的IP地址，为虚拟地址
3. Cluster IP: Service的IP地址，此为虚拟IP地址

k8s启动默认创建四个初始名字空间

1. default

2. kuber-node-lease
3. kube-public
4. kube-system


Ingress:

简化流程：

客户端->Ingress管理的负载均衡器->Ingress-(路由规则)->service->pod