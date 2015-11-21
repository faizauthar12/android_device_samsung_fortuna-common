# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/full_fortunave3g.mk)

PRODUCT_RELEASE_NAME := fortunave3g

# Setup device configuration
PRODUCT_NAME := cm_fortunave3g
PRODUCT_DEVICE := fortunave3g
PRODUCT_BRAND := Samsung
PRODUCT_MANUFACTURER := Samsung
PRODUCT_MODEL := SM-G530H

# Extra overlay for HDPI
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/hdpi

