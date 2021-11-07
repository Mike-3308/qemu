#!/bin/bash

#生成sd卡
dd if=/dev/zero of=rootfs.ext3 bs=1M count=32

#格式化sd卡
mkfs.ext3 rootfs.ext3

#挂载sd卡
mount -t ext3 rootfs.ext3 /mnt/ -o loop

#复制文件到sd卡
cp -r /home/mike/rootfs/* /mnt/

#卸载sd卡
umount /mnt/
