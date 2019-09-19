# 使用USB设备拓展储存空间

可以使用USB设备来拓展设备的存储空间。

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

以一块swap和Ext4分区为例：

```sh
mkswap /dev/sda1
swapon /dev/sda1
mkdir -p /mnt/share
mount -t ext4 /dev/sda2 /mnt/share -o rw,sync
```

## 在U盘上安装opkg包

在Luci管理界面`/cgi-bin/luci/admin/system/packages/ipkg`中，修改opkg设置如下：

```sh
dest usb /mnt/usb/optware
```

## 设置Path

导入PATH的方法如下：

`/mnt/usb/optware/env.sh`

```sh
# Assume this partition is mounted as /mnt/usb/optware
OPTWARE_PATH=/mnt/usb/optware

export PATH=$PATH:$OPTWARE_PATH/usr/bin/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$OPTWARE_PATH/usr/lib/
```

`/root/bin/env.sh`

```sh
source /mnt/usb/optware/env.sh
```

`/etc/profile`

```sh
source /root/bin/env.sh
```

## 在U盘上安装软件

```sh
opkg install --dest usb <package-name>
```

---

参考链接：

- [Adding a USB Device](https://openwrt.org/docs/guide-user/storage/usb-drives-quickstart)
- [USB Storage](https://openwrt.org/zh-cn/doc/howto/usb.storage)
- [Opkg](https://openwrt.org/zh/docs/techref/opkg)
