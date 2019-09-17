# IPv6 NAT

只有在一些特殊的场景下，比如在校园网环境中，才需要IPv6 NAT。通过以下步骤来启用：

```sh
opkg install ip6tables kmod-ipt-nat6 kmod-ip6tables kmod-ip6tables-extra luci-proto-ipv6 iputils-traceroute6
```

首先要设置IPv6 Global ULA Prefix。
可以使用[ULA Generator](https://cd34.com/rfc4193/)获取一个以`fd`开头的地址，并将开头的`fd`改为`dd`，即修改为RFC协议中规定的Reserved地址段。

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

参考链接：

- [OpenWRT 路由器作为 IPv6 网关的配置](https://github.com/tuna/ipv6.tsinghua.edu.cn/blob/master/openwrt.md)
