USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/sony/pepper/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH := device/sony/pepper/include

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_HAS_NO_MISC_PARTITION := true

# Platform
TARGET_BOARD_PLATFORM := montblanc
TARGET_BOOTLOADER_BOARD_NAME := montblanc
BOARD_USES_STE_HARDWARE := true

# Architecture
TARGET_ARCH := arm
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_CPU_SMP := true

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_STE := true
COMMON_GLOBAL_CFLAGS += -DSTE_BT
BOARD_BLUEDROID_VENDOR_CONF := device/sony/pepper/hardware/bluetooth/vnd_u8500.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/pepper/hardware/bluetooth/include

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true

COMMON_GLOBAL_CFLAGS += -DSTE_AUDIO

# WIFI
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_TI_SOFTAP := true
BOARD_WLAN_DEVICE := wl12xx_mac80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wl12xx
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_wl12xx

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/sony/pepper/config/egl.cfg
COMMON_GLOBAL_CFLAGS += -DSTE_HARDWARE

# jb camera
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB

# surfaceflinger support for Xperia Sola,Go...
BOARD_EGL_NEEDS_LEGACY_FB := true
COMMON_GLOBAL_CFLAGS += -DEGL_NEEDS_FNW

# Fm Radio
#BOARD_USES_STE_FM := true
#COMMON_GLOBAL_CFLAGS += -DSTE_FM

# Lights
TARGET_PROVIDES_LIBLIGHTS := true

# ril implementation
BOARD_RIL_CLASS := ../../../device/sony/pepper/telephony-common/

# Custom boot
TARGET_PROVIDES_INIT_RC := true
TARGET_RECOVERY_PRE_COMMAND := "touch /cache/recovery/boot;sync;"
BOARD_CUSTOM_BOOTIMG_MK := device/sony/pepper/custombootimg.mk
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/sony/pepper/releasetools/semc_ota_from_target_files
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/sony/pepper/recovery/recovery-keys.c
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_10x18.h\"

BOARD_UMS_LUNFILE := "/sys/devices/platform/musb-ux500.0/musb-hdrc/gadget/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/musb-ux500.0/musb-hdrc/gadget/lun%d/file"

# Kernel information
TARGET_KERNEL_CONFIG := xperiasola_defconfig
TARGET_KERNEL_SOURCE := kernel/sony/u8500
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3
BOARD_KERNEL_BASE := 0x0
BOARD_RECOVERY_BASE := 0x0
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := cachepolicy=writealloc noinitrd init=init board_id=1 logo.nologo root=/dev/ram0 rw rootwait console=null androidboot.console=null androidboot.hardware=st-ericsson mem=96M@0 mem_mtrace=15M@96M mem_mshared=1M@111M mem_modem=16M@112M mem=32M@128M mem_issw=1M@160M hwmem=71M@161M mem=280M@232M mpcore_wdt.mpcore_margin=359 end lpj=24019
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000

# Partition information
BOARD_VOLD_MAX_PARTITIONS := 16

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01400000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01400000

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1056964608
BOARD_USERDATA_PARTITION_SIZE := 2147483648
BOARD_FLASH_BLOCK_SIZE := 131072

COMMON_GLOBAL_CFLAGS += -DNEW_NOTIFICATION

BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_SDCARD_INTERNAL_DEVICE := /dev/block/mmcblk0p14

TARGET_OTA_ASSERT_DEVICE := MT27i,MT27a,pepper
