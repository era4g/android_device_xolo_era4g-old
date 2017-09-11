# Release name
PRODUCT_RELEASE_NAME := era4g

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)


$(call inherit-product, vendor/cm/config/common_full_phone.mk)


#---------------------------#
# Use generic Omni configs #
#---------------------------#
$(call inherit-product, device/xolo/era4g/device_era4g.mk)

# Use specific resolution for bootanimation
TARGET_BOOTANIMATION_SIZE := 720x480

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := era4g
PRODUCT_NAME := cm_era4g
PRODUCT_BRAND := xolo
PRODUCT_MODEL := era4g
PRODUCT_MANUFACTURER := xolo

TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280
