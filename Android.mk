#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),xaga)
include $(call all-subdir-makefiles,$(LOCAL_PATH))

include $(CLEAR_VARS)

BIN_SYMLINK := $(TARGET_OUT_VENDOR)/bin/jpegtool
BIN_SYMLINK += $(TARGET_OUT_VENDOR)/bin/dumpfaultd.mt6895
$(BIN_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6895/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(BIN_SYMLINK)

BIN_HW_SYMLINK := $(TARGET_OUT_VENDOR)/bin/hw/android.hardware.graphics.allocator@4.0-service-mediatek
BIN_HW_SYMLINK += $(TARGET_OUT_VENDOR)/bin/hw/camerahalserver
$(BIN_HW_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6895/android.hardware.graphics.allocator@4.0-service-mediatek.mt6895 $@

ALL_DEFAULT_INSTALLED_MODULES += $(BIN_HW_SYMLINK)

MDOTA_SYMLINK := $(TARGET_OUT_VENDOR)/etc/mdota
$(MDOTA_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf /mnt/vendor/mdota $@

ALL_DEFAULT_INSTALLED_MODULES += $(MDOTA_SYMLINK)

LIB_MT6895_SYMLINK := $(addprefix $(TARGET_OUT_VENDOR)/lib/, $(strip $(shell cat $(DEVICE_PATH)/symlink/lib_mt6895.txt)))
$(LIB_MT6895_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6895/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(LIB_MT6895_SYMLINK)

LIB_HW_MT6895_SYMLINK := $(addprefix $(TARGET_OUT_VENDOR)/lib/hw/, $(strip $(shell cat $(DEVICE_PATH)/symlink/lib_hw_mt6895.txt)))
$(LIB_HW_MT6895_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6895/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(LIB_HW_MT6895_SYMLINK)

LIB64_MT6895_SYMLINK := $(addprefix $(TARGET_OUT_VENDOR)/lib64/, $(strip $(shell cat $(DEVICE_PATH)/symlink/lib64_mt6895.txt)))
$(LIB64_MT6895_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6895/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(LIB64_MT6895_SYMLINK)

LIB64_HW_MT6895_SYMLINK := $(addprefix $(TARGET_OUT_VENDOR)/lib64/hw/, $(strip $(shell cat $(DEVICE_PATH)/symlink/lib64_hw_mt6895.txt)))
$(LIB64_HW_MT6895_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6895/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(LIB64_HW_MT6895_SYMLINK)

AUDIO_PRIMARY_SYMLINK := $(TARGET_OUT_VENDOR)/lib/hw/audio.primary.mt6895.so
AUDIO_PRIMARY_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/audio.primary.mt6895.so
$(AUDIO_PRIMARY_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf audio.primary.mediatek.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(AUDIO_PRIMARY_SYMLINK)

AUDIO_R_SUBMIX_SYMLINK := $(TARGET_OUT_VENDOR)/lib/hw/audio.r_submix.mt6895.so
AUDIO_R_SUBMIX_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/audio.r_submix.mt6895.so
$(AUDIO_R_SUBMIX_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf audio.r_submix.mediatek.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(AUDIO_R_SUBMIX_SYMLINK)

EGL_SYMLINK := $(TARGET_OUT_VENDOR)/lib/egl/libGLES_mali.so
EGL_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/egl/libGLES_mali.so
$(EGL_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6895/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(EGL_SYMLINK)

GATEKEEPER_SYMLINK += $(TARGET_OUT_VENDOR)/lib/hw/gatekeeper.default.so
GATEKEEPER_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/gatekeeper.default.so
$(GATEKEEPER_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf libSoftGatekeeper.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(GATEKEEPER_SYMLINK)

SENSOR_SYMLINK := $(TARGET_OUT_VENDOR)/lib64/hw/sensors.mt6895.so
$(SENSOR_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf sensors.mediatek.V2.0.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(SENSOR_SYMLINK)

VULKAN_SYMLINK += $(TARGET_OUT_VENDOR)/lib/hw/vulkan.mt6785.so
VULKAN_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/vulkan.mt6785.so
$(VULKAN_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf ../egl/libGLES_mali.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(VULKAN_SYMLINK)

endif
