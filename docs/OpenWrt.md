# OpenWrt操作系统

## 安装

在路由器上刷入OpenWrt的固件即可。在刷入OpenWrt的固件之前，一般需要确认路由器的u-boot或Breed信息。

有以下的资源可以参考：

- [OpenWrt官网](https://openwrt.org/)
- [恩山无线论坛](https://www.right.com.cn/forum/)

安装完成后可以通过SSH或HTTP来访问路由器。

## 包管理器Opkg

```sh
opkg update
opkg list [package-name]
opkg list-installed
opkg install [-d <path>] <package-anme>
```

## 常用软件

## 挂载USB设备

## Luci管理界面

```sh
opkg install luci-ssl
```
