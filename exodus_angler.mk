# Copyright 2016 ExodusAndroid Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Use the full CAF BSP
TARGET_USES_AOSP := false

# We have our own power HAL
TARGET_USES_DEVICE_SPECIFIC_POWERHAL := true

# CAF audio
AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := true
USE_CUSTOM_AUDIO_POLICY := 1

# CAF media
#TARGET_USES_MEDIA_EXTENSIONS := true

$(call inherit-product, device/huawei/angler/aosp_angler.mk)

# Generic CAF packages
include device/qcom/common/common.mk

# Generic CAF audio config
$(call inherit-product, hardware/qcom/audio/configs/msm8994/msm8994.mk)

# CAF display addons
PRODUCT_PACKAGES += \
    copybit.msm8994

# MSM8994 Audio HAL Settings
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.buffer.size.kb=32 \
    audio.offload.video=true \
    audio.offload.pcm.16bit.enable=true \
    audio.offload.multiple.enabled=false \
    audio.offload.pcm.24bit.enable=true \
    audio.offload.track.enable=true \
    audio.deep_buffer.media=true

# MSM8994 Display HAL settings
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=c2d \
    debug.sf.hw=1 \
    persist.debug.wfd.enable=1 \
    persist.demo.hdmirotationlock=false \
    persist.hwc.enable_vds=1 \
    persist.hwc.mdpcomp.enable=true \
    persist.hwc.ptor.enable=true \
    persist.mdpcomp.4k2kSplit=1 \
    persist.hwc.mdpcomp.maxpermixer=5
    persist.mdpcomp_perfhint=50 \
    persist.metadata_dynfps.disable=true \
    persist.sys.wfd.virtual=0

# ROI (region of interest) is miscalculated right now
PRODUCT_PROPERTY_OVERRIDES += \
    persist.mdp.partialUpdate=false

# Get the defaults going.
TARGET_BOOT_ANIMATION_RES := 1440

# Paranoid Android platform
include vendor/exodus/main.mk

# Override AOSP defaults that we want changed.
PRODUCT_NAME := exodus_angler
PRODUCT_DEVICE := angler
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 6P
PRODUCT_MANUFACTURER := Huawei
PRODUCT_RESTRICT_VENDOR_FILES := false
PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=angler \
	BUILD_FINGERPRINT=google/angler/angler:7.1.1/NMF26F/3425388:user/release-keys \
	PRIVATE_BUILD_DESC="angler-user 7.1.1 NMF26F 3425388 release-keys"
