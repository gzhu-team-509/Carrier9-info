# DNS解决方案

## 验证、递归和缓存DNS解析器Unbound

### 安装和配置Unbound

```sh
opkg install unbound
opkg install unbound-control unbound-control-setup

unbound-control-setup  # 通常需要重启后unbound-control才能生效。
```

## GoogleHosts

!!! info "已停用，由Unbound替代。"
