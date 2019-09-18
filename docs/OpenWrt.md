# OpenWrt操作系统

## 安装系统

在路由器上刷入OpenWrt的固件即可。在刷入OpenWrt的固件之前，一般需要确认路由器的u-boot或Breed信息，以免刷机过程中出错设备变砖时无法恢复。

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

---

关于OpenWrt，有以下的资源可以参考：

- [OpenWrt官网](https://openwrt.org/)
- [恩山无线论坛](https://www.right.com.cn/forum/)
- [Breed](https://breed.hackpascal.net/)
