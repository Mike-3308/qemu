#!/bin/bash

mkdir dev home lib media opt proc run sbin sys tmp var

cd dev

#创建串口节点
mknod -m 666 tty1 c 4 1
mknod -m 666 tty2 c 4 2
mknod -m 666 tty3 c 4 3
mknod -m 666 tty4 c 4 4

#创建控制台节点
mknod -m 666 console c 5 1

#创建null节点
mknod -m 666 null c 1 3