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
    if [ $? != 0 ]; then
        echo "$1 is required but not found in \$PATH."
        exit 1
    fi
}


# `detect_minieap` return 0 if MiniEAP is running.
detect_minieap () {
    MINIEAP_PID=`pgrep minieap`
    if [ -z $MINIEAP_PID ]; then
        echo "MiniEAP is not running."
        return 1
    else
        echo "MiniEAP is running."
        return 0
    fi
}


# `detect_network_connectivity` return 0 if network connectivity is good.
detect_network_connectivity () {
    echo "Testing network connectivity..."
    curl https://www.baidu.com --max-time 30 > /dev/null 2> /dev/null
    if [ $? != 0 ]; then
       echo "Network connectivity is poor."
       return 1
    else
       echo "Network connectivity is good."
       return 0
    fi
}


kill_minieap () {
    killall minieap
}


start_minieap () {
    minieap &
}


restart_minieap () {
    kill_minieap
    sleep 3
    start_minieap
}


check_dependency "minieap"
check_dependency "curl"

detect_minieap
if [ $? == 0 ]; then
    detect_network_connectivity
    if [ $? == 0 ]; then
        echo "MiniEAP is fine."
    else
        echo "Restarting MiniEAP..."
        restart_minieap
    fi
else
    echo "Starting MiniEAP..."
    start_minieap
fi

exit 0
```

## 中继客户端Agentx1

!!! info "已停用，使用MiniEAP替代。"

<https://bitbucket.org/CrazyBoyFeng/agentx1/>
