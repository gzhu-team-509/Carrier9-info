# DNS解决方案

## Unbound

!!! info "Unbound现使用非加密的DNS，上游为1.1.1.1，完全替代校园网DNS。"

### 安装Unbound

```sh
opkg install unbound
opkg install unbound-control unbound-control-setup

# 设置unbound-control
unbound-control-setup  # 通常需要重启后unbound-control才能生效。
```

### 配置Unbound

使用Luci界面`/cgi-bin/luci/admin/services/unbound/configure`进行配置，使用Manual Conf和Extended Tabs。

若要完全交由Unbound解析，需要在Luci界面`/cgi-bin/luci/admin/network/dhcp`中设置ignore resolve file`/tmp/resolv.conf.auto`。

#### 关于tls-upstream

由于硬件条件限制和tls-upstream连接建立速度慢等原因，unbound的解析速度可能会很慢，因此实践中不推荐完全由unbound解析，而是将unbound作为校园DNS的备用服务使用。

要完全交由unbound解析，应当使用非加密的DNS协议。

现有[1.1.1.1](https://1.1.1.1/)和[红鱼DNS](https://www.rubyfish.cn/)提供的DoT。

## GoogleHosts

!!! info "已停用，由Unbound替代。"

GoogleHosts项目主页：<https://github.com/googlehosts/>

使用自定义Host时，需要在Luci`/cgi-bin/luci/admin/network/dhcp`中指明Addtional host file。

Host下载脚本：

```sh
#!/bin/sh

wget -O /etc/googlehosts https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts
wget -O /etc/googlehosts6 https://raw.githubusercontent.com/googlehosts/hosts-ipv6/master/hosts-files/hosts
```
