LOCAL_PATH := $(call my-dir)

INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
$(INSTALLED_BOOTIMAGE_TARGET): $(PRODUCT_OUT)/kernel $(recovery_ramdisk) $(INSTALLED_RAMDISK_TARGET) $(PRODUCT_OUT)/utilities/busybox $(MKBOOTIMG) $(MINIGZIP) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Boot image: $@")
	$(hide) mkdir -p $(PRODUCT_OUT)/combinedroot/
	$(hide) cp -R $(PRODUCT_OUT)/root/* $(PRODUCT_OUT)/combinedroot/
	$(hide) cp -R $(PRODUCT_OUT)/recovery/root/sbin/* $(PRODUCT_OUT)/combinedroot/sbin/
	$(hide) mkdir -p $(PRODUCT_OUT)/combinedroot/res/images
	$(hide) cp -R $(PRODUCT_OUT)/../../../../bootable/recovery/res/images/* $(PRODUCT_OUT)/combinedroot/res/images/
	$(hide) cp -R $(PRODUCT_OUT)/../../../../device/sony/lotus/config/root/default.prop $(PRODUCT_OUT)/combinedroot/
	$(hide) cp -R $(PRODUCT_OUT)/../../../../device/sony/lotus/recovery/initrd.gz $(PRODUCT_OUT)/combinedroot/sbin/
	$(hide) cp -R $(PRODUCT_OUT)/../../../../device/sony/lotus/recovery/kexec $(PRODUCT_OUT)/combinedroot/sbin/
	$(hide) cp -R $(PRODUCT_OUT)/kernel $(PRODUCT_OUT)/combinedroot/sbin/
	$(hide) $(MKBOOTFS) $(PRODUCT_OUT)/combinedroot > $(PRODUCT_OUT)/combinedroot.cpio
	$(hide) cat $(PRODUCT_OUT)/combinedroot.cpio | gzip > $(PRODUCT_OUT)/combinedroot.fs
	$(hide) $(MKBOOTIMG) -o $@ --kernel $(PRODUCT_OUT)/kernel --ramdisk $(PRODUCT_OUT)/combinedroot.fs --cmdline '$(BOARD_KERNEL_CMDLINE)' --base $(BOARD_KERNEL_BASE) $(BOARD_MKBOOTIMG_ARGS)

INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
	$(recovery_ramdisk) \
	$(recovery_kernel)
	@echo ----- Making recovery image ------
	$(hide) $(MKBOOTIMG) -o $@ --kernel $(PRODUCT_OUT)/kernel --ramdisk $(PRODUCT_OUT)/ramdisk-recovery.img --cmdline '$(BOARD_KERNEL_CMDLINE)' --base $(BOARD_KERNEL_BASE) $(BOARD_MKBOOTIMG_ARGS)
	@echo ----- Made recovery image -------- $@