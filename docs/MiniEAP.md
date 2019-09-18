# 校园网认证

## 代理客户端MiniEAP

### 编译和安装

使用@ysc3839 fork出的广州大学分支：<https://github.com/ysc3839/openwrt-minieap/tree/gzhu>

### 配置

使用`/etc/minieap.conf`进行配置。

### 状态监测脚本

`/root/bin/ensure-minieap.sh`

```sh
#!/bin/sh

# This script is uesd together with MiniEAP to achieve comfortable campus network experience.
# It is recommanded to run this script as a minutely cron job.

# When the script is exectued, it detects whether there is a MiniEAP instance running.
# If no MiniEAP instance is running, the script launches one. If a MiniEAP instance is already
# running, the script detects network connectivity. As long as network connectivity is good,
# the script does nothing. Otherwise, the script terminates the running MiniEAP instance and
# launch a new one.

# `check_denpendency $1` exit the script if $1 is not found in the $PATH.
check_dependency () {
    which $1 > /dev/null 2> /dev/null
    if [ $? != 0 ]
    then
        echo "$1 is required but not found in \$PATH."
        exit 1
    fi
}

check_dependency "minieap"
check_dependency "curl"
```

## 中继客户端Agentx1

!!! info "已停用，使用MiniEAP替代。"

<https://bitbucket.org/CrazyBoyFeng/agentx1/>
