#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from mt6895-common
$(call inherit-product, device/xiaomi/mt6895-common/mt6895-common.mk)

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/xaga/xaga-vendor.mk)

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/uinput-fpc.idc \
    $(LOCAL_PATH)/configs/idc/uinput-goodix.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/uinput-goodix.idc \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-aosp

PRODUCT_PACKAGES += \
    FrameworkResOverlay \
    XagaProFrameworkResOverlay \
    SystemUIOverlay \
    XagaProInFrameworkResOverlay \
    SettingsOverlay

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/modules/modules.load.recovery:recovery/root/lib/modules/modules.load.recovery

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/prebuilts/firmware/,recovery/root/vendor/firmware)

# Rootdir
PRODUCT_PACKAGES += \
    init.project.rc \
    meta_init.rc

# Xiaomi Parts
PRODUCT_PACKAGES += \
    XiaomiParts
