# 使用USB设备拓展储存空间

可以使用USB设备来拓展设备的存储空间。

!!! info "`reboot`之前请注意`sync`"

---

## 基本USB支持

```sh
# USB支持
opkg install kmod-usb-core
opkg install kmod-usb-uhci kmod-usb-storage kmod-usb2 kmod-usb-ohci

opkg install mount-utils
opkg install block-mount   # 挂载 Luci界面

opkg install kmod-fs-ext4  # Ext4文件系统
opkg install kmod-fs-vfat  # FAT文件系统
```

## Swap和ext4分区

以一块ext4和swap分区为例：

```sh
mkdir -p /mnt/sda1
mount -t ext4 /dev/sda1 /mnt/share -o rw,sync
mkswap /dev/sda2
swapon /dev/sda2
```

## 在U盘上安装opkg包

在Luci管理界面`/cgi-bin/luci/admin/system/packages/ipkg`中，修改opkg设置如下：

```sh
dest sda1 /mnt/usb/optware
```

## 设置Path

导入PATH的方法如下：

`/root/bin/env.sh`

```sh
# Assume a ext4 partition is mounted at /mnt/sda1
OPTWARE_PATH=/mnt/sda1/optware

export PATH=$PATH:$OPTWARE_PATH/usr/bin/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$OPTWARE_PATH/usr/lib/
```

`/etc/profile`

```sh
source /root/bin/env.sh
```

## 在U盘上安装软件

```sh
opkg install --dest sda1 <package-name>
```

---

参考链接：

- [Adding a USB Device](https://openwrt.org/docs/guide-user/storage/usb-drives-quickstart)
- [USB Storage](https://openwrt.org/zh-cn/doc/howto/usb.storage)
- [Opkg](https://openwrt.org/zh/docs/techref/opkg)
