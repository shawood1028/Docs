1. 设置hostname
    vim /etc/hostname
    10.206.0.14 shadow01
    10.206.0.2  shadow02
    10.206.0.13 shadow03
    10.206.0.16 shadow04

2. 设置免密登陆
    ssh-keygen
    cat ~/.ssh/id_rsa.pub >> authorized_keys
    scp authorized_keys 文件到各节点主机
、