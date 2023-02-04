#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from mt6895-common
-include device/xiaomi/mt6895-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/xaga

# Assert
TARGET_OTA_ASSERT_DEVICE := xaga,xagapro,xagain,xagaproin

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := xaga

# HIDL
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_xaga
TARGET_RECOVERY_DEVICE_MODULES := libinit_xaga

# Kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img

BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

TARGET_KERNEL_CONFIG := mikrn_xaga_stability_defconfig

# Kernel modules
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(wildcard $(DEVICE_PATH)/prebuilts/modules/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/prebuilts/modules/modules.load))

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
