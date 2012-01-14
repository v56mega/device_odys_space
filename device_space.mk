$(call inherit-product, build/target/product/small_base.mk)
$(call inherit-product, build/target/product/languages_small.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

$(call inherit-product-if-exists, vendor/odys/space/space-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/odys/space/overlay

PRODUCT_PACKAGES += \
	Gallery \
	LiveWallpapers \
	LiveWallpapersPicker

# This is the list of libraries to include in the build
PRODUCT_PACKAGES += \
	sensors.space \
	lights.msm7k \
	copybit.msm7k \
	gralloc.msm7k \
	gps.space \
	libRS \
	librs_jni \
	hwprops \
	libOmxCore

TINY_TOOLBOX:=true

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/odys/space/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Boot logo

# PRODUCT_COPY_FILES += \
# 	device/odys/space/prebuilt/initlogo.rle:root/initlogo.rle

# Startup scripts
# If would like to name it init.space.rc, we would have to change the kernel parameter

PRODUCT_COPY_FILES += \
	device/odys/space/boot.space.rc:root/init.qcom.rc

# Configuration files

PRODUCT_COPY_FILES += \
	device/odys/space/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf 

# Proprietary files - BLOBS

PRODUCT_COPY_FILES += \
	device/odys/space/recovery/battery_charging:system/bin/battery_charging

# Reinject files extracted from old system

# Kernel modules

PRODUCT_COPY_FILES += \
	vendor/odys/space/proprietary/modules/libra_ftm.ko:system/lib/modules/libra_ftm.ko \
	vendor/odys/space/proprietary/modules/libra.ko:system/lib/modules/libra.ko \
	vendor/odys/space/proprietary/modules/librasdioif.ko:system/lib/modules/librasdioif.ko

# Hardware libraries

# copybit, gralloc and lights are not copied due to warnings

PRODUCT_COPY_FILES += \
#	vendor/odys/space/proprietary/hw/copybit.msm7k.so:system/lib/hw/copybit.msm7k.so \
#	vendor/odys/space/proprietary/hw/gralloc.msm7k.so:system/lib/hw/gralloc.msm7k.so \
#	vendor/odys/space/proprietary/hw/lights.msm7k.so:system/lib/hw/lights.msm7k.so \
	vendor/odys/space/proprietary/hw/sensors.7x27.so:system/lib/hw/sensors.7x27.so

# Graphic hardware

# PRODUCT_COPY_FILES += \
# 	vendor/odys/space/proprietary/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
# 	vendor/odys/space/proprietary/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
# 	vendor/odys/space/proprietary/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
# 	vendor/odys/space/proprietary/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so

# Bluez Plugin

# PRODUCT_COPY_FILES += \
# 	vendor/odys/space/proprietary/bluez-plugin/input.so:system/lib/bluez-plugin/input.so \
# 	vendor/odys/space/proprietary/bluez-plugin/audio.so:system/lib/bluez-plugin/audio.so

# Bluetooth helpers

PRODUCT_COPY_FILES += \
	vendor/odys/space/proprietary/hci_qcomm_init:system/bin/hci_qcomm_init
#	vendor/odys/space/proprietary/hciattach:system/bin/hciattach

# Radio and associated libraries

PRODUCT_COPY_FILES += \
	vendor/odys/space/proprietary/libcm.so:system/lib/libcm.so \
	vendor/odys/space/proprietary/libdsm.so:system/lib/libdsm.so \
	vendor/odys/space/proprietary/libdss.so:system/lib/libdss.so \
	vendor/odys/space/proprietary/libgsdi_exp.so:system/lib/libgsdi_exp.so \
	vendor/odys/space/proprietary/libgstk_exp.so:system/lib/libgstk_exp.so \
	vendor/odys/space/proprietary/libmmgsdilib.so:system/lib/libmmgsdilib.so \
	vendor/odys/space/proprietary/libnv.so:system/lib/libnv.so \
	vendor/odys/space/proprietary/liboem_rapi.so:system/lib/liboem_rapi.so \
	vendor/odys/space/proprietary/liboncrpc.so:system/lib/liboncrpc.so \
	vendor/odys/space/proprietary/libqmi.so:system/lib/libqmi.so \
	vendor/odys/space/proprietary/libqueue.so:system/lib/libqueue.so \
	vendor/odys/space/proprietary/libril-qc-1.so:system/lib/libril-qc-1.so \
	vendor/odys/space/proprietary/libwms.so:system/lib/libwms.so \
	vendor/odys/space/proprietary/libwmsts.so:system/lib/libwmsts.so \
	vendor/odys/space/proprietary/libsnd.so:system/lib/libsnd.so

# Camera control and encoding libraries

PRODUCT_COPY_FILES += \
	vendor/odys/space/proprietary/libcamera.so:system/lib/libcamera.so \
	vendor/odys/space/proprietary/liboemcamera.so:system/lib/liboemcamera.so \
#	vendor/odys/space/proprietary/libcamera_client.so:system/lib/libcamera_client.so \
#	vendor/odys/space/proprietary/libcameraservice.so:system/lib/libcameraservice.so \
	vendor/odys/space/proprietary/libmmjpeg.so:system/lib/libmmjpeg.so

# Media libraries

PRODUCT_COPY_FILES += \
	vendor/odys/space/proprietary/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
	vendor/odys/space/proprietary/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
	vendor/odys/space/proprietary/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
	vendor/odys/space/proprietary/libOmxVidEnc.so:system/lib/libOmxVidEnc.so

# GPS library

PRODUCT_COPY_FILES += \
	vendor/odys/space/proprietary/libgps.so:system/lib/libgps.so

# Bluetooth configuration files

# PRODUCT_COPY_FILES += \
# 	vendor/odys/space/proprietary/etc/bluetooth/main.conf:system/etc/bluetooth/main.conf \
# 	vendor/odys/space/proprietary/etc/bluetooth/audio.conf:system/etc/bluetooth/audio.conf \
# 	vendor/odys/space/proprietary/etc/bluetooth/input.conf:system/etc/bluetooth/input.conf \
# 	vendor/odys/space/proprietary/etc/bluetooth/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
# 	vendor/odys/space/proprietary/etc/bluetooth/blacklist.conf:system/etc/bluetooth/blacklist.conf

# Firmware

PRODUCT_COPY_FILES += \
	vendor/odys/space/proprietary/prebuilt/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
	vendor/odys/space/proprietary/prebuilt/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
	vendor/odys/space/proprietary/prebuilt/cfg.dat:system/etc/firmware/wlan/cfg.dat \
	vendor/odys/space/proprietary/prebuilt/qcom_wapi_fw.bin:system/etc/firmware/wlan/qcom_wapi_fw.bin \
	vendor/odys/space/proprietary/prebuilt/qcom_fw.bin:system/etc/firmware/wlan/qcom_fw.bin

# HostAPd configuration files

PRODUCT_COPY_FILES += \
	vendor/odys/space/proprietary/prebuilt/qcom_cfg.ini:data/hostapd/qcom_cfg.ini \
	vendor/odys/space/proprietary/prebuilt/hostapd.conf:data/hostapd/hostapd.conf

# Service and additional init script

PRODUCT_COPY_FILES += \
	vendor/odys/space/proprietary/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
	vendor/odys/space/proprietary/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
	vendor/odys/space/proprietary/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
	vendor/odys/space/proprietary/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
	vendor/odys/space/proprietary/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
	vendor/odys/space/proprietary/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh

# And last but not least a couple of prebuilt binaries

PRODUCTS_COPY_FILES += \
	vendor/odys/space/proprietary/prebuilt/battery_charging:system/bin/battery_charging \
	vendor/odys/space/proprietary/prebuilt/qmuxd:system/bin/qmuxd \
	vendor/odys/space/proprietary/prebuilt/btwlancoex:system/bin/btwlancoex \
	vendor/odys/space/proprietary/prebuilt/wifiwritemac:system/bin/wifiwritemac \
	vendor/odys/space/proprietary/prebuilt/port-bridge:system/bin/port-bridge \
	vendor/odys/space/proprietary/prebuilt/CKPD-daemon:system/bin/CKPD-daemon \
	vendor/odys/space/proprietary/prebuilt/hostapd:system/bin/hostapd \
	vendor/odys/space/proprietary/prebuilt/fm_qsoc_patches:system/bin/fm_qsoc_patches


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := odys_space
PRODUCT_DEVICE := space
PRODUCT_MODEL := Odys Space
PRODUCT_BRAND := ACTION
PRODUCT_MANUFACTURER := ACTION

# Generate descriptive build.id
DISPLAY_BUILD_NUMBER := true
