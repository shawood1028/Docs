### centos 

#### git:

```bash
# git 设置
git config --global user.name "script_account"
git config --global user.email "script_account@gmail.com"
```

#### 生成随机密码:
```bash
pwgen -ncy1 16 8
```

#### 添加公钥:
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDjEZYosX0pPTDWHsAfcw6hmCDo3zbB09/SHy2sF+TOI9Xb72CXaq4n0HMAFEX3kpyeVkIn4+e2NsrFpKon2N1apghpeJhb+7WRxiedwk6K6Y8CDWHT+4EnMW2gWM3B4SwMAt0K97qIhUySjSVJyby2TSaQzg5AqgmSYHAy3AiSqbrON2mZKulnOegj70zfj1wxcYuWshzc2qTNw99dNA/vnZxC9Qy5w/bdUYwvii84MQIfIBeXgchPMieXyuLAiW8BeKvpEQXc5NaoeTyJ6z1s71h+ibhv+l3JplIAk86qINHCS0rwiBP9fcmTJuOCWiCboXWtDKtaGj7+XXlXFOYFXHEHjXNB1VbACrQebFj0PTxdwMQCSXG2OqpP4F19TN1nfAf90Wk4rzG1CUmmlnFg1cHkRd5UilLm6fuFw0tB5e/Vd77CMLl51+JQ5jvZhy7nRW/JkJvg8BvkfOMFsRlXI9T8kJ8cseV+WfdIbuo9wJ0+k1Wc1J8Z/BkgjVhBbvPszl+7mcYEoLoaIcuMj3seDiWs2YSvabwlZ48H63/M/tckoETK+dwOAdVrsh7iYfWVkVzUtVgrhuFDZFMokTyy6XcmioDrlS1k/5pTpPShBffEiqnWn01PysjGcfv/uHQ+idq2tvElQHRHMayedJemu31gwbQxiAoJwKmHo3F8TQ== shawood1028@gmail.com" | cat >> /root/.ssh/authorized_keys