# TEAM509 Router's Homepage

每天6:30重启。

## [硬件](https://openwrt.org/toh/lenovo/lenovo_y1_v1)

| Model | Version | SoC | CPU MHz | Flash MB | RAM MB | WLAN Hardware | WLAN2.4 | WLAN5.0 | 100M ports | Gbit ports | Modem | USB |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Y1 | v1 | MediaTek MT7620A | 580 | 16 | 128 | MediaTek MT7612E | b/g/n | a/n/ac | 2 | - | No | 1x 2.0 |

*处理器架构* `ramips` `mipsel`

## 软件

1. openssh-sftp-server
2. unbound
3. wget, libustream-openssl, ca-certificates
4. unzip

## 服务

1. [Googlehosts](https://github.com/googlehosts/)提供的Host文件
2. [1.1.1.1](https://1.1.1.1/)和[红鱼DNS](https://www.rubyfish.cn/)提供的DoT。

## 历史

1. 最初，寝室的路由器是参考[GZHU-Dress/GZHU-Wikiii](https://github.com/GZHU-Dress/GZHU-Wikiii)以及[GZHU-Dress/openwrt-minieap](https://github.com/GZHU-Dress/openwrt-minieap)配置的，并曾经使用过一段时间的[CrazyBoyFeng/agentx1](https://bitbucket.org/CrazyBoyFeng/agentx1)，后来GZHU-Wikiii上的页面因为过时而或移除或存档了。

2. 此后，参考[ysc3839/openwrt-minieap](https://github.com/ysc3839/openwrt-minieap)更新了路由器上的软件。

3. Minieap脚本的编写参考了[updateing/router-scripts/](https://github.com/updateing/router-scripts)。
