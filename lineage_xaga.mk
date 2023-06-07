#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common LineageOS stuff
$(call inherit-product, vendor/proton/config/common.mk)

# Inherit from xaga device
$(call inherit-product, device/xiaomi/xaga/device.mk)

PRODUCT_DEVICE := xaga
PRODUCT_NAME := proton_xaga
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi Note11T Pro
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_CHARACTERISTICS := nosdcard

# Boot animation
TARGET_SCREEN_HEIGHT := 2460
TARGET_SCREEN_WIDTH := 1080
TARGET_BOOT_ANIMATION_RES := 1080

TARGET_SCREEN_DENSITY := 440

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

TARGET_SUPPORTS_QUICK_TAP := true
