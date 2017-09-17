# Welcome to Team509 Access Point

## 信息

Team509的Wifi接入点是参考[GZHU-Wikiii](https://github.com/GZHU-Dress/GZHU-Wikiii)搭建的。

使用的路由器型号为Lenovo-Y1(Newifi mini)，路由器已刷入潘多拉系统。

## 基本工作原理

任何人完成入网身份认证后，路由器会中继网络，任何接入路由器的使用者都可以连接上互联网，无需额外认证。

认证长期有效。在下列特殊情况中，可能需要重新连接：

- 路由器掉电重启
- 认证服务服务器因故断开连接

## 连接方法

使用网线连接电脑和路由器的任意LAN口，运行下面的命令：

```bash
# 使用SSH客户端连接路由器（192.168.1.1），以root身份登陆。
/usr/bin/agentx1 -L br-lan -W eth0.2 -p LOCAL -a AFTER

# 进行下一步之前，使用锐捷客户端进行身份认证。

# 启动另一个SSH客户端连接并登陆路由器。
screen /usr/bin/agentx1 -L br-lan -W eth0.2 -p LOCAL -a AFTER

# 至此，电脑上的锐捷客户端和两个SSH客户端都可以关闭了。
# 路由器会持续中继网络。

```
