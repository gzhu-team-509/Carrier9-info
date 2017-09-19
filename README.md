# Welcome to Team509 Access Point

## 信息

Team509的Wifi接入点是参考[GZHU-Wikiii](https://github.com/GZHU-Dress/GZHU-Wikiii)搭建的。

使用的路由器型号为Lenovo-Y1(Newifi mini)，路由器已刷入潘多拉系统。

路由器可用于中继校园网网络，（实验性功能）访问[Google学术搜索](https://scholar.google.com/)。

## 基本工作原理

任何人完成入网身份认证后，路由器会中继网络，任何接入路由器的使用者都可以连接上互联网，无需额外认证。

认证长期有效。在下列特殊情况中，可能需要重新连接：

- 路由器掉电重启
- 认证服务服务器每48小时断开连接

## 连接方法

48小时，使用锐捷客户端完成认证，然后使用任务管理器终止“锐捷认证客户端”即可

如果路由器因故掉电重启，则需要使用网线连接电脑和路由器的任意LAN口，执行下面的操作：

```bash

# 打开SSH客户端，以root身份登陆路由器（192.168.1.1），并执行：

screen /usr/bin/agentx1 -L br-lan -W eth0.2 -p LOCAL -a AFTER

# 关闭SSH客户端。
# 使用锐捷客户端完成入网身份认证，然后使用任务管理器终止“锐捷认证客户端”。
# 路由器会持续中继网络。

```
