#
# Copyright (C) 2012 The Android Open-Source Project
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

# Use the Qualcomm common folder
include device/qcom/msm7x27/BoardConfigCommon.mk

## Boot loader & recovery
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_HAS_NO_SELECT_BUTTON := true

## Kernel
#TARGET_KERNEL_SOURCE := kernel/lge/msm7x27
TARGET_PREBUILT_KERNEL := device/lge/thunderc/kernels/test21/zImage
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom
BOARD_KERNEL_BASE := 0x12200000
BOARD_KERNEL_PAGESIZE := 2048

# Copy LG Kernel Headers here if necessary, DO NOT use Android auto-generated headers
TARGET_SPECIFIC_HEADER_PATH := device/lge/msm7x27-common/include

## Partition Sizes: Fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00700000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00700000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0xE600000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0a4e0000

BOARD_FLASH_BLOCK_SIZE := 131072

## Graphics
BOARD_EGL_NEEDS_LEGACY_FB := true
TARGET_DISABLE_TRIPLE_BUFFERING := true
COMMON_GLOBAL_CFLAGS += -DANCIENT_GL

## Camera
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
#BOARD_USES_LEGACY_CAMERA := true
#BOARD_CPU_COLOR_CONVERT := true

## Audio & FM Radio
TARGET_PROVIDES_LIBAUDIO := true
# BOARD_COMBO_DEVICE_SUPPORTED := true
# BOARD_FM_DEVICE := bcm4325
# BOARD_HAVE_FM_RADIO := true
# COMMON_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
# COMMON_GLOBAL_CFLAGS += -DQCOM_FM_ENABLED

## Wi-Fi & Wi-Fi HotSpot
#COMMON_GLOBAL_CFLAGS += -DWIFI_AP_HAS_OWN_DRIVER
WPA_SUPPLICANT_VERSION          := VER_0_8_X
BOARD_WLAN_DEVICE               := bcm4325
BOARD_WEXT_NO_COMBO_SCAN        := true
BOARD_WPA_SUPPLICANT_DRIVER     := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
#BOARD_WLAN_NO_FWRELOAD := true
WIFI_DRIVER_HAS_LGE_SOFTAP      := true
#WIFI_DRIVER_MODULE_ARG          := "ifname=wlan0 fwmode=1"
WIFI_DRIVER_MODULE_PATH         := "/system/lib/modules/wireless.ko"
WIFI_DRIVER_MODULE_ARG          := "firmware_path=/etc/wl/rtecdc.bin nvram_path=/etc/wl/nvram.txt config_path=/data/misc/wifi/config"
WIFI_DRIVER_MODULE_NAME         := "wireless"
WIFI_DRIVER_FW_PATH_STA         := "/system/etc/wl/rtecdc.bin"
WIFI_DRIVER_FW_PATH_AP          := "/system/etc/wl/rtecdc-apsta.bin"

#WIFI_AP_DRIVER_MODULE_ARG := "ifname=wl0.1 fwmode=2" 
#WIFI_AP_DRIVER_MODULE_PATH := "/system/lib/modules/wireless.ko"
#WIFI_AP_DRIVER_MODULE_NAME := "wireless" 
#WIFI_AP_FIRMWARE_LOADER := "" 
WIFI_DRIVER_LOADER_REUSE := true

## Wi-Fi Hotspot
#BOARD_HAVE_LEGACY_HOSTAPD := true
#BOARD_HOSTAPD_NO_ENTROPY := true

## GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE :=
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE_LEGACY := msm7x27 # temporary workaround
BOARD_USES_QCOM_LIBRPC := true

## Bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/lge/msm7x27-common/bluetooth/libbt_lge.txt


## RIL
BOARD_PROVIDES_LIBRIL := true
#TARGET_PROVIDES_LIBRIL := vendor/lge/thunderc/proprietary/lib/libril.so
BOARD_CDMA_NETWORK := true
#BOARD_LTE_ON_CDMA := false
#TARGET_LTE_ON_CDMA := false
#BOARD_USES_LEGACY_RIL := true
# Legacy ril
#COMMON_GLOBAL_CFLAGS += -DRIL_VERSION_2_SUPPORT
#BOARD_RIL_CLASS := ../../../device/lge/thunderc/ril/

## Lights
TARGET_PROVIDES_LIBLIGHT := true

## Mass Storage 
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file
BOARD_UMS_LUNFILE := /sys/devices/platform/msm_hsusb/gadget/lun0/file
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/vold/179:1
BOARD_SDEXT_DEVICE := /dev/block/vold/179:2

## Touch screen compatibility 
BOARD_USE_LEGACY_TOUCHSCREEN := true

## Minimal fonts
SMALLER_FONT_FOOTPRINT := true

## Browser & WebKit
ENABLE_WEBGL := true

BOARD_GLOBAL_CFLAGS += -DBOARD_CHARGING_CMDLINE_NAME='"lge.reboot"' -DBOARD_CHARGING_CMDLINE_VALUE='"pwroff"'
BOARD_USES_RECOVERY_CHARGEMODE := false 

## OTA script extra files (build/tools/releasetools) 
