#Ð
# Copyright (C) 2018 The TwrpBuilder Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH :=  device/honor/msm8937_64

PRODUCT_PLATFORM := msm8937
TARGET_BOARD_PLATFORM := msm8937
TARGET_BOOTLOADER_BOARD_NAME := MSM8937
TARGET_BOARD_PLATFORM_GPU := qcom-adreno505

# Partitions
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_USES_PRODUCTIMAGE := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_HAS_LARGE_FILESYSTEM := true

BOARD_FLASH_BLOCK_SIZE := 0
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 35232153
BOARD_VENDORIMAGE_PARTITION_SIZE := 668991488
# TODO: Fix sizes of partitions
BOARD_PRODUCTIMAGE_PARTITION_SIZE := 210763776
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2884632576
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11811160064

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_SYSTEM := system

# Encryption
TW_INCLUDE_CRYPTO := true
BOARD_USES_METADATA_PARTITION := false
BOARD_USES_QCOM_FBE_DECRYPTION := true
PLATFORM_VERSION := 127
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2127-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_RECOVERY_QCOM_RTC_FIX := true
BOARD_USES_QCOM_HARDWARE := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Device Config
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/soc/78db000.usb/msm_hsusb/gadget/lun%d/file"

TARGET_RECOVERY_DEVICE_MODULES += \
    libandroidicu \
    libxml2 \
    vendor.display.config@1.0 \
    vendor.display.config@2.0

# Recovery
BOARD_HAS_NO_REAL_SDCARD := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_RECOVERY_SWIPE := true
BOARD_USES_MMCUTILS := true
BOARD_SUPPRESS_EMMC_WIPE := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery.fstab
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := false
RECOVERY_GRAPHICS_USE_LINELENGTH := true

TW_OVERRIDE_SYSTEM_PROPS := \
    "ro.build.date.utc;ro.build.product;ro.build.fingerprint=ro.system.build.fingerprint;ro.build.version.incremental;ro.product.device=ro.product.system.device;ro.product.model=ro.product.system.model;ro.product.name=ro.product.system.name"

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/Image.gz
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.bootdevice=7824900.sdhci slub_min_objects=12 unmovable_isolate1=2:192M,3:224M,4:256M unmovable_isolate2=2:64M,3:80M,4:80M androidboot.selinux=enforcing androidboot.selinux=enforcing buildvariant=user androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x00000100

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
