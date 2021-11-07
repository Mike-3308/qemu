#!/bin/bash

qemu-system-arm \
	-M vexpress-a9 \
	-m 512M \
	-nographic \
	-kernel u-boot
