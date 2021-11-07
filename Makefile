uboot = ./uboot
busybox = ./busybox
linux = ./linux
image = ./image
scripts = ./scripts
rootfs = ./rootfs/
uboot_img = $(uboot)/u-boot*
filesystem = $(busybox)/rootfs.ext3
linux_img = $(linux)/arch/arm/boot/*

.PHONY : all
all :
	@-mkdir $(image)
	@cd $(uboot) && $(MAKE) -j8
	@cp -rf $(uboot_img) $(image)
	@cd $(busybox) && $(MAKE) -j8
	@cd $(busybox) && $(MAKE) install
	@cd $(busybox) && cp ./_install/* ../rootfs -rf
	@cd $(linux) && $(MAKE) -j8
	@cp -rf $(linux_img) $(image)
	@cp -rf $(scripts)/graphic.sh $(image)
	@cp -rf $(scripts)/nographic.sh $(image)
	@cp -rf $(scripts)/uboots.sh $(image)

.PHONY : preconfig
preconfig :
	@cd $(uboot) && $(MAKE) vexpress_ca9x4_defconfig
	@cd $(busybox) && $(MAKE) defconfig
	@cd $(linux) && $(MAKE) vexpress_defconfig
	
.PHONY : menuconfig
menuconfig :
	@cd $(uboot) && $(MAKE) menuconfig
	@cd $(busybox) && $(MAKE) menuconfig
	@cd $(linux) && $(MAKE) menuconfig
	
.PHONY : clean
clean : 
	@cd $(uboot) && $(MAKE) clean
	@cd $(busybox) && $(MAKE) clean
	@cd $(linux) && $(MAKE) clean
	@-rm -rf $(image)