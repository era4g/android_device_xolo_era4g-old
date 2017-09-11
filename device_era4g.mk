$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/xolo/era4g/era4g-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/xolo/era4g/overlay

# This device is hdpi
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/xolo/era4g/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Media config
MEDIA_CONFIGS := \
	$(LOCAL_PATH)/media/media_codecs.xml \
	$(LOCAL_PATH)/media/media_profiles.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(MEDIA_CONFIGS),$(f):system/etc/$(notdir $(f)))

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

KERNEL_MODULES += \
device/xolo/era4g/kernel/modules/autotst.ko \
device/xolo/era4g/kernel/modules/mali.ko \
device/xolo/era4g/kernel/modules/marlin_fm.ko \
device/xolo/era4g/kernel/modules/mmc_test.ko \
device/xolo/era4g/kernel/modules/sprdwl.ko 

PRODUCT_COPY_FILES += \
		device/xolo/era4g/init.board.rc:root/init.board.rc \
		device/xolo/era4g/init.sc8830.rc:root/init.sc8830.rc \
		device/xolo/era4g/init.sc8830.usb.rc:root/init.sc8830.usb.rc \
    device/xolo/era4g/fstab.sc8830:root/fstab.sc8830 \
    device/xolo/era4g/ueventd.sc8830.rc:root/ueventd.sc8830.rc \
		device/xolo/era4g/apns-conf.xml:system/etc/apns-conf.xml \
		device/xolo/era4g/bluetooth:system/etc/bluetooth \
device/xolo/era4g/init.usb.rc:root/init.usb.rc \
device/xolo/era4g/modules/autotst.ko:root/lib/modules/autotst.ko \
device/xolo/era4g/modules/mali.ko:root/lib/modules/mali.ko \
device/xolo/era4g/modules/marlin_fm.ko:root/lib/modules/marlin_fm.ko \
device/xolo/era4g/modules/mmc_test.ko:root/lib/modules/mmc_test.ko \
device/xolo/era4g/modules/sprdwl.ko:root/lib/modules/sprdwl.ko

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/headset-keyboard.kl:system/usr/keylayout/headset-keyboard.kl \
    $(LOCAL_PATH)/keylayout/sci-keypad.kl:system/usr/keylayout/sci-keypad.kl \
    $(LOCAL_PATH)/keylayout/sprd-eic-keys.kl:system/usr/keylayout/sprd-eic-keys.kl \
    $(LOCAL_PATH)/keylayout/sprd-gpio-keys.kl:system/usr/keylayout/sprd-gpio-keys.kl 

# prenuilt idc
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/idc/focaltech_ts.idc:system/usr/idc/focaltech_ts.idc \
$(LOCAL_PATH)/idc/msg2138_ts.idc:system/usr/idc/msg2138_ts.idc

# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# Codecs
# Codecs
PRODUCT_PACKAGES += \
	libstagefrighthw \
	libstagefright_sprd_aacdec \
	libstagefright_sprd_apedec \
	libstagefright_soft_imaadpcmdec \
	libstagefright_soft_mjpgdec \
	libstagefright_sprd_mp3dec \
	libstagefright_sprd_mpeg4dec \
	libstagefright_sprd_mpeg4enc \
	libstagefright_sprd_h264dec \
	libstagefright_sprd_h264enc \
	libstagefright_sprd_vpxdec

PRODUCT_PROPERTY_OVERRIDES += \
		persist.ttydev=ttyVUART0 \
		ro.sf.lcd_density=320 \
		ro.sf.hwrotation=0 \
		ro.opengles.version=131072 \
		ro.product.hardware=SS_SHARKLS \
		ro.product.modem.mode=GSM,EDGE,TD-SCDMA,WCDMA,TD-LTE,FDD-LTE \
		ro.product.partitionpath=/dev/block/platform/sdio_emmc/by-name/ \
		ro.adb.secure=0 \
		ro.secure=0 \
		persist.sys.usb.config=mtp,adb

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
		ro.adb.secure=0 \
		ro.secure=0 \
		persist.sys.usb.config=mtp,adb \
		telephony.lteOnCdmaDevice=0 \
		persist.radio.apm_sim_not_pwdn=1 \
		persist.radio.add_power_save=1 

# Default props
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=era4gRIL

# Graphics
PRODUCT_PACKAGES += \
	libGLES_mali \
	memtrack.sc8830 \
	gralloc.sc8830 \
	hwcomposer.sc8830 \
	sprd_gsp.sc8830 \
	libmemoryheapion \
	libion_sprd \
	libstagefright_shim \
	libgps_shim

# FM radio
PRODUCT_PACKAGES += \
	FMRadio \
	radio.fm.default \
	fm.sc8830

# PowerHAL
PRODUCT_PACKAGES += \
	power.sc8830

# Usb accessory
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Bluetooth
PRODUCT_PACKAGES += \
	bluetooth.default \
	audio.a2dp.default

# Bluetooth
PRODUCT_PACKAGES += \
	libbluetooth_jni

# Lights
PRODUCT_PACKAGES += \
	lights.sc8830

# gps
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/gps/gps.xml:system/etc/gps.xml

# Media config
MEDIA_CONFIGS := \
	$(LOCAL_PATH)/media/media_codecs.xml \
	$(LOCAL_PATH)/media/media_profiles.xml \
	$(LOCAL_PATH)/tiny_hw.xml \
	$(LOCAL_PATH)/audio_hw.xml \
	$(LOCAL_PATH)/audio_para \

PRODUCT_COPY_FILES += \
	$(foreach f,$(MEDIA_CONFIGS),$(f):system/etc/$(notdir $(f)))

# Audio
PRODUCT_PACKAGES += \
	audio.primary.sc8830 \
	audio_policy.sc8830 \
	audio.r_submix.default \
	audio.usb.default \
	audio_vbc_eq \
	libaudio-resampler \
	libatchannel \
	libatchannel_wrapper \
	libtinyalsa \
	libeng-audio

# Wifi
PRODUCT_PACKAGES += \
	wpa_supplicant \
	hostapd \

# Graphics
PRODUCT_PACKAGES += \
	libmemtrack \

# Permissions
PERMISSION_XML_FILES := \
	frameworks/native/data/etc/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.software.sip.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.software.midi.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(PERMISSION_XML_FILES),$(f):system/etc/permissions/$(notdir $(f)))

	# enable Google-specific location features,
	# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.locationfeatures=1 \
	ro.com.google.networklocation=1

PRODUCT_NAME := full_era4g
PRODUCT_DEVICE := era4g
