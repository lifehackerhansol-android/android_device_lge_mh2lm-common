#
# Copyright (C) 2018 The LineageOS Project
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

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/lge/mh2lm-common/mh2lm-common-vendor.mk)

COMMON_mh2lm_PATH := device/lge/mh2lm-common

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(COMMON_mh2lm_PATH)/overlay \
    $(COMMON_mh2lm_PATH)/overlay-lineage
    
PRODUCT_ENFORCE_RRO_TARGETS := *
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(COMMON_mh2lm_PATH)/overlay/frameworks/base/packages/SystemUI
    
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(COMMON_mh2lm_PATH)/overlay-lineage/lineage-sdk

# Properties
TARGET_SYSTEM_PROP += $(COMMON_mh2lm_PATH)/system.prop
TARGET_VENDOR_PROP += $(COMMON_mh2lm_PATH)/vendor.prop

# Audio
PRODUCT_COPY_FILES += \
    $(COMMON_mh2lm_PATH)/audio/audio_effects_tune.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects_tune.xml \
    $(COMMON_mh2lm_PATH)/audio/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf \
    $(COMMON_mh2lm_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(COMMON_mh2lm_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(COMMON_mh2lm_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(COMMON_mh2lm_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(COMMON_mh2lm_PATH)/audio/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml

# Bootanimation
TARGET_SCREEN_WIDTH := 2340
TARGET_SCREEN_HEIGHT := 1080

# DAC
PRODUCT_PACKAGES += \
    QuadDACPanel \
    vendor.lge.hardware.audio.dac.control@1.0-service

# Display
TARGET_SCREEN_DENSITY := 406
    
# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.lge_msmnile \
    vendor.lineage.biometrics.fingerprint.inscreen@1.0-service.lge_msmnile
    
PRODUCT_COPY_FILES += \
    $(COMMON_mh2lm_PATH)/configs/vendor.lineage.biometrics.fingerprint.inscreen.xml:vendor/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml
    
# FOD
TARGET_HAS_FOD := true
EXTRA_FOD_ANIMATIONS := true    

# Keylayout - Assist
PRODUCT_COPY_FILES += \
    $(COMMON_mh2lm_PATH)/keylayout/Vendor_1004_Product_637a.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Vendor_1004_Product_637a.kl

# Keylayout - Dual Display
PRODUCT_COPY_FILES += \
    $(COMMON_mh2lm_PATH)/keylayout/touch_dev_2nd.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/touch_dev_2nd.idc

# Media
PRODUCT_COPY_FILES += \
    $(COMMON_mh2lm_PATH)/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(COMMON_mh2lm_PATH)/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml
    
# Ramdisk
PRODUCT_PACKAGES += \
    init.lge.fingerprints.sh
    
# common sm8150
$(call inherit-product, device/lge/sm8150-common/sm8150.mk)
