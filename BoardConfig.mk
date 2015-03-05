#
# Copyright (C) 2011 The Android Open-Source Project
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

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

TARGET_NO_BOOTLOADER := true

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x00000000

BOARD_KERNEL_SEPARATED_DT := true
BOARD_CUSTOM_BOOTIMG_MK := device/oneplus/bacon/mkbootimg.mk

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3

TARGET_KERNEL_SOURCE := kernel/oppo/msm8974
TARGET_KERNEL_CONFIG := msm8974_find7op_defconfig

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOOTLOADER_BOARD_NAME := A0001
TARGET_BOOTLOADER_NAME=oneplusone
TARGET_BOARD_INFO_FILE := device/oneplus/bacon/board-info.txt

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

BOARD_EGL_CFG := device/oneplus/bacon/configs/egl.cfg

# global
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP

# Display
TARGET_QCOM_DISPLAY_VARIANT := caf
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_C2D_COMPOSITION := true

# Recovery
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 14485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824

BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 36
BOARD_WANTS_EMMC_BOOT := true

BOARD_USES_SECURE_SERVICES := true

-include vendor/oneplus/bacon/BoardConfigVendor.mk

#TWRP flags
DEVICE_RESOLUTION := 1080x1920
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_USB_STORAGE := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_L_CRYPTO := true
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_EXCLUDE_SUPERSU := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_NO_SCREEN_BLANK := true
RECOVERY_VARIANT := twrp
#TW_TARGET_USES_QCOM_BSP := true
TARGET_HW_DISK_ENCRYPTION := true

#MultiROM config. MultiROM also uses parts of TWRP config
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/oneplus/bacon/mr_init_devices.c
MR_DPI := xhdpi
MR_DPI_FONT := 340
MR_FSTAB := device/oneplus/bacon/recovery.fstab
MR_KEXEC_MEM_MIN := 0x20000000
MR_USE_MROM_FSTAB := true
MR_KEXEC_DTB := true
MR_INFOS := device/oneplus/bacon/mrom_infos
MR_DEVICE_HOOKS := device/oneplus/bacon/mr_hooks.c
MR_DEVICE_HOOKS_VER := 3
MR_CONTINUOUS_FB_UPDATE := true
MR_USE_QCOM_OVERLAY := true
MR_QCOM_OVERLAY_HEADER := device/oneplus/bacon/framebuffer_qcom_overlay.h
MR_QCOM_OVERLAY_CUSTOM_PIXEL_FORMAT := MDP_RGBX_8888
MR_PIXEL_FORMAT := "RGBX_8888"
MR_DEVICE_VARIANTS := A0001 One
