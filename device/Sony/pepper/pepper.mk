#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit the proprietary counterpart
$(call inherit-product-if-exists, vendor/sony/pepper/pepper-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/sony/pepper/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Configs
PRODUCT_COPY_FILES += \
    device/sony/pepper/config/media_codecs.xml:system/etc/media_codecs.xml \
    device/sony/pepper/config/egl.cfg:system/lib/egl/egl.cfg \
    device/sony/pepper/config/asound.conf:system/etc/asound.conf \
    device/sony/pepper/config/dbus.conf:system/etc/dbus.conf \
    device/sony/pepper/config/sysmon.cfg:system/etc/sysmon.cfg \
    device/sony/pepper/config/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/sony/pepper/config/init.d/01stesetup:system/etc/init.d/01stesetup \
    device/sony/pepper/config/init.d/10dhcpcd:system/etc/init.d/10dhcpcd \
    device/sony/pepper/config/init.d/10hostapd:system/etc/init.d/10hostapd \
    device/sony/pepper/config/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel \
    device/sony/pepper/config/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Hostapd
PRODUCT_PACKAGES += \
    hostapd_cli \
    hostapd

# BT A2DP
PRODUCT_PACKAGES += \
    libasound_module_ctl_bluetooth \
    libasound_module_pcm_bluetooth

# light package
PRODUCT_PACKAGES += \
    lights.montblanc

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Fmradio
#PRODUCT_PACKAGES += \
#    FmRadioReceiver

# b2r2lib
PRODUCT_PACKAGES += \
    libblt_hw

# libomxil-bellagio
PRODUCT_PACKAGES += \
    libomxil-bellagio

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Custom init / uevent
PRODUCT_COPY_FILES += \
    device/sony/pepper/config/root/init.rc:root/init.rc \
    device/sony/pepper/config/root/fstab.st-ericsson:root/fstab.st-ericsson \
    device/sony/pepper/config/root/init.st-ericsson.rc:root/init.st-ericsson.rc \
    device/sony/pepper/config/root/ueventd.st-ericsson.rc:root/ueventd.st-ericsson.rc

# Recovery bootstrap script
PRODUCT_COPY_FILES += \
    device/sony/pepper/recovery/bootrec:root/sbin/bootrec \
    device/sony/pepper/recovery/usbid_init.sh:root/sbin/usbid_init.sh \
    device/sony/pepper/recovery/postrecoveryboot.sh:root/sbin/postrecoveryboot.sh


# HW Configs
PRODUCT_COPY_FILES += \
    device/sony/pepper/config/omxloaders:system/etc/omxloaders \
    device/sony/pepper/config/ril_config:system/etc/ril_config \
    device/sony/pepper/config/install_wlan:system/bin/install_wlan \
    device/sony/pepper/config/ste_modem.sh:system/etc/ste_modem.sh

# GPS
PRODUCT_COPY_FILES += \
    device/sony/pepper/config/gps.conf:system/etc/gps.conf\
    device/sony/pepper/config/cacert.txt:system/etc/suplcert/cacert.txt

PRODUCT_PROPERTY_OVERRIDES += \
    sys.mem.max_hidden_apps=10

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp \
    wifi.interface=wlan0

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# This device is hdpi.  However the platform doesn't
# currently contain all of the bitmaps at hdpi density so
# we do this little trick to fall back to the hdpi version
# if the hdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Configuration scripts
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/root/init.st-ericsson.device.rc:root/init.st-ericsson.device.rc \
   device/sony/pepper/prebuilt/logo-480x854.rle:root/logo.rle

# Configuration scripts
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/dash.conf:system/etc/dash.conf \
   $(LOCAL_PATH)/prebuilt/hw_config.sh:system/etc/hw_config.sh

# fake script needed for recovery
   $(LOCAL_PATH)/prebuilt/modelid_cfg.sh:system/bin/modelid_cfg.sh


# USB function switching
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/root/init.st-ericsson.usb.rc:root/init.st-ericsson.usb.rc

PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml

# Recovery bootstrap (device-specific part)
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/recovery.fstab:root/recovery.fstab

# Key layouts and touchscreen
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/AB8500_Hs_Button.kl:system/usr/keylayout/AB8500_Hs_Button.kl \
   $(LOCAL_PATH)/config/simple_remote.kl:system/usr/keylayout/simple_remote.kl \
   $(LOCAL_PATH)/config/simple_remote_appkey.kl:system/usr/keylayout/simple_remote_appkey.kl \
   $(LOCAL_PATH)/config/cyttsp-spi.kl:system/usr/keylayout/cyttsp-spi.kl \
   $(LOCAL_PATH)/config/cyttsp-spi.kcm:system/usr/keychars/cyttsp-spi.kcm \
   $(LOCAL_PATH)/config/so34-buttons.kl:system/usr/keylayout/so34-buttons.kl \
   $(LOCAL_PATH)/config/STMPE-keypad.kl:system/usr/keylayout/STMPE-keypad.kl \
   $(LOCAL_PATH)/config/tc3589x-keypad.kl:system/usr/keylayout/tc3589x-keypad.kl \
   $(LOCAL_PATH)/config/ux500-ske-keypad.kl:system/usr/keylayout/ux500-ske-keypad.kl.kl \
   $(LOCAL_PATH)/config/ux500-ske-keypad-qwertz.kl:system/usr/keylayout/ux500-ske-keypad-qwertz.kl \
   $(LOCAL_PATH)/config/cyttsp-spi.idc:system/usr/idc/cyttsp-spi.idc \
   $(LOCAL_PATH)/config/synaptics_rmi4_i2c.idc:system/usr/idc/synaptics_rmi4_i2c.idc \
   $(LOCAL_PATH)/config/sensor00_f11_sensor0.idc:system/usr/idc/sensor00_f11_sensor0.idc

# Misc configuration files
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/cflashlib.cfg:system/etc/cflashlib.cfg \
   $(LOCAL_PATH)/config/flashled_param_config.cfg:system/etc/flashled_param_config.cfg

# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/../../../vendor/cm/prebuilt/common/bootanimation/480.zip:system/media/bootanimation.zip

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/config/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/config/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/sony/pepper/pepper-vendor.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240
