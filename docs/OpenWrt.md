# OpenWrt操作系统

## 安装系统

在路由器上刷入OpenWrt的固件即可。在刷入OpenWrt的固件之前，一般需要确认路由器的u-boot或Breed信息。

安装完成后可以通过SSH来访问Shell或HTTP来访问Luci。

## 更新系统

系统更新时，对文件系统做出的修改如无声明均会被重置。

要保留的修改需要在Luci设置界面`/cgi-bin/luci/admin/system/flashops/backupfiles`中指出。

## 为Luci管理界面安装SSL

```sh
opkg install luci-ssl
```

在httpd下一次启动时（`/etc/init.d/uhttpd restart`）会自动生成SSL证书，该过程可能耗时1分钟左右。

## 包管理器opkg

```sh
opkg update
opkg list [package-name]
opkg list-installed
opkg install [-d <path>] <package-name>
```

## 常用软件

```sh
opkg install curl
opkg install wget libustream-openssl ca-certificates
opkg install unzip
opkg install openssh-sftp-server
```

## IPv6 NAT

只有在一些特殊的场景下，比如在校园网环境中，才需要IPv6 NAT。通过以下步骤来启用：

首先要设置IPv6 Global ULA Prefix。
可以使用[ULA Generator](https://cd34.com/rfc4193/)获取一个以“fd”开头的地址，并将开头的“fd”改为“dd”，即修改为RFC协议中规定的Reserved地址段。

定义`/etc/hotplug.d/iface/90-ipv6`，以便在IPv6端口上线时自动设置路由表：

```sh
#!/bin/sh
[ "$ACTION" = ifup ] || exit 0

[ "$INTERFACE" = wan6 ] && {
    route -A inet6 add 2000::/3 gw $(route -A inet6 | grep ::/0 | grep eth0.2 |  awk '{print $2}') dev $(uci -q get network.wan6.ifname)
}
```

并在Luci`/cgi-bin/luci/admin/network/firewall/custom`中定义防火墙规则：

```sh
# Set up IPv6 routing.
WAN6=eth0.2
LAN=br-lan
ip6tables -t nat -A POSTROUTING -o $WAN6 -j MASQUERADE
ip6tables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
ip6tables -A FORWARD -i $LAN -j ACCEPT
```

---

有以下的资源可以参考：

- [OpenWrt官网](https://openwrt.org/)
- [恩山无线论坛](https://www.right.com.cn/forum/)
- [Breed](https://breed.hackpascal.net/)
