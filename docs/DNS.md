# DNS解决方案

## Unbound

### 安装Unbound

```sh
opkg install unbound
opkg install unbound-control unbound-control-setup

unbound-control-setup  # 通常需要重启后unbound-control才能生效。
```

### 配置Unbound

使用Luci界面`/cgi-bin/luci/admin/services/unbound/configure`进行配置，使用Manual Conf和Extended Tabs。

## GoogleHosts

!!! info "已停用，由Unbound替代。"

GoogleHosts项目主页：<https://github.com/googlehosts/>

使用自定义Host时，需要在Luci中`/cgi-bin/luci/admin/network/dhcp`指明Addtional host file。

Host下载脚本：

```sh
#!/bin/sh

wget -O /etc/googlehosts https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts
wget -O /etc/googlehosts6 https://raw.githubusercontent.com/googlehosts/hosts-ipv6/master/hosts-files/hosts
```
