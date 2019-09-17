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

在Luci管理界面`/cgi-bin/luci/admin/system/packages/ipkg`中，修改opkg源设置如下：

```sh
dest root /
dest ram /tmp
dest usb /mnt/sda1/optware
lists_dir ext /var/opkg-lists
option overlay_root /overlay
option check_signature
```
