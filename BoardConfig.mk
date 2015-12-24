#
# Copyright (C) 2009 The Android Open Source Project
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

# BoardConfig.mk
LOCAL_PATH 					:= device/samsung/fortunave3g

# Inherit from samsung qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk 

# inherit from the proprietary version
-include vendor/samsung/fortunave3g/BoardConfigVendor.mk

# Platform
TARGET_BOARD_PLATFORM 				:= msm8916
TARGET_BOOTLOADER_BOARD_NAME 			:= msm8916
TARGET_BOARD_PLATFORM_GPU 			:= qcom-adreno306
TARGET_USE_QCOM_BIONIC_OPTIMIZATION 		:= true
TARGET_USES_QCOM_BSP 				:= true
COMMON_GLOBAL_CFLAGS 				+= -DQCOM_BSP
HAVE_SYNAPTICS_I2C_RMI4_FW_UPGRADE 		:= true

# Init
TARGET_INIT_VENDOR_LIB				:= libinit_msm
TARGET_LIBINIT_DEFINES_FILE			:= $(LOCAL_PATH)/init/init_fortunave3g.c

# Flags
TARGET_GLOBAL_CFLAGS 				+= -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS 				+= -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS 				+= -DNO_SECURE_DISCARD

# Architecture
TARGET_ARCH 					:= arm
TARGET_ARCH_VARIANT 				:= armv7-a-neon
TARGET_CPU_VARIANT 				:= cortex-a53
TARGET_CPU_CORTEX_A53 				:= true
TARGET_CPU_ABI 					:= armeabi-v7a
TARGET_CPU_ABI2 				:= armeabi
ARCH_ARM_HAVE_NEON				:= true
ARCH_ARM_HAVE_VFP 				:= true
ARCH_ARM_HAVE_TLS_REGISTER 			:= true
WITH_DEXPREOPT 					:= true

# Properties (reset them here, include more in device if needed)
TARGET_SYSTEM_PROP 				:= $(LOCAL_PATH)/system.prop

# Power
TARGET_POWERHAL_VARIANT 			:= qcom

# Media 
TARGET_ENABLE_QC_AV_ENHANCEMENTS 	:= true
TARGET_QCOM_MEDIA_VARIANT 			:= caf-k30t
TARGET_HAVE_OMX_HEVC 				:= true

# Kernel
BOARD_CUSTOM_BOOTIMG_MK 			:= $(LOCAL_PATH)/mkbootimg.mk
BOARD_KERNEL_BASE 				:= 0x80000000
BOARD_KERNEL_CMDLINE 				:= console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE 				:= 2048
BOARD_KERNEL_SEPARATED_DT 			:= true
BOARD_KERNEL_TAGS_OFFSET 			:= 0x01E00000
BOARD_RAMDISK_OFFSET     			:= 0x02000000
TARGET_KERNEL_SOURCE 				:= kernel/samsung/fortuna
BOARD_FLASH_BLOCK_SIZE 				:= 131072
TARGET_KERNEL_CONFIG 				:= msm8916_sec_defconfig
TARGET_KERNEL_SELINUX_CONFIG 		:= selinux_defconfig
TARGET_KERNEL_TIMA_CONFIG 			:= tima8916_defconfig
TARGET_KERNEL_VARIANT_CONFIG 		:= msm8916_sec_fortunave3g_eur_defconfig

WLAN_MODULES:
	mkdir -p $(KERNEL_MODULES_OUT)/pronto
	mv $(KERNEL_MODULES_OUT)/wlan.ko $(KERNEL_MODULES_OUT)/pronto/pronto_wlan.ko
	ln -sf /system/lib/modules/pronto/pronto_wlan.ko $(TARGET_OUT)/lib/modules/wlan.ko

TARGET_KERNEL_MODULES += WLAN_MODULES

# Wifi
BOARD_HAS_QCOM_WLAN 			        := true
BOARD_HAS_QCOM_WLAN_SDK 			:= true
BOARD_HOSTAPD_DRIVER 			        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB 			:= lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE 			        := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER 	                := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB 	        := lib_driver_cmd_qcwcn
WIFI_DRIVER_FW_PATH_AP 			        := "ap"
WIFI_DRIVER_FW_PATH_STA 			:= "sta"
TARGET_USES_QCOM_WCNSS_QMI 	 		:= true
TARGET_USES_WCNSS_CTRL 		 		:= true 
WPA_SUPPLICANT_VERSION 			        := VER_0_8_X
WIFI_DRIVER_MODULE_PATH 			:= "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME 			:= "wlan"

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR 	:= $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH 				:= true
BOARD_HAVE_BLUETOOTH_QCOM 			:= true
BLUETOOTH_HCI_USE_MCT 				:= true

# SD
TARGET_USE_CUSTOM_LUN_FILE_PATH 		:= /sys/devices/platform/msm_hsusb/gadget/lun%d/file
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR 		:= true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS 		:= true
BOARD_SUPPRESS_EMMC_WIPE 			:= true
BOARD_VOLD_MAX_PARTITIONS 			:= 28
TARGET_PLATFORM_DEVICE_BASE         := /devices/soc.0/

# Audio
BOARD_USES_ALSA_AUDIO 				 := true
TARGET_QCOM_AUDIO_VARIANT 			 := caf
#AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true

# Display
TARGET_QCOM_DISPLAY_VARIANT 		:= caf-k30t
TARGET_HAVE_NEW_GRALLOC             := true
TARGET_USES_POST_PROCESSING         := true
TARGET_USES_ION                     := true
TARGET_USES_NEW_ION_API 			:= true
TARGET_HAVE_HDMI_OUT 				:= false
TARGET_USES_OVERLAY 				:= true
TARGET_USES_C2D_COMPOSITION                     := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS                 := 3
TARGET_HARDWARE_3D				:= false
OVERRIDE_RS_DRIVER                              := libRSDriver_adreno.so
MAX_EGL_CACHE_KEY_SIZE                          := 12*1024
MAX_EGL_CACHE_SIZE                              := 2048*1024
USE_OPENGL_RENDERER                             := true

# Recovery
TARGET_RECOVERY_FSTAB 				:= $(LOCAL_PATH)/rootdir/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 			:= true
BOARD_HAS_LARGE_FILESYSTEM			:= true
TARGET_RECOVERY_DENSITY 			:= hdpi

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK 		:= true
BOARD_CHARGER_ENABLE_SUSPEND 			:= true
BOARD_CHARGER_SHOW_PERCENTAGE 			:= true

# Partition
BOARD_BOOTIMAGE_PARTITION_SIZE 			:= 13631488 # 13312*1024
BOARD_RECOVERYIMAGE_PARTITION_SIZE 		:= 15728640 # 15360*1024
BOARD_SYSTEMIMAGE_PARTITION_SIZE 		:= 1568669696 # 1531904*1024
BOARD_CACHEIMAGE_PARTITION_SIZE 		:= 314572800 # 307200*1024
BOARD_USERDATAIMAGE_PARTITION_SIZE 		:= 5731495936 # 5597164*1024
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE 		:= ext4

# RIL
BOARD_RIL_CLASS 				:= ../../../$(LOCAL_PATH)/ril/
PROTOBUF_SUPPORTED := true

# OTA override
TARGET_OTA_ASSERT_DEVICE			:= fortuna3g,fortunave3g,SM-G530H,SM-G530F,G530FZ,SM-G530AZ

# Camera
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS                  := $(LOCAL_PATH)

# Video
TARGET_HAVE_SIGNED_VENUS_FW                     := true

# FM
TARGET_QCOM_NO_FM_FIRMWARE                      := true

# QCOM RTC
BOARD_USES_QC_TIME_SERVICES 			:= true

# Crypto
TARGET_HW_DISK_ENCRYPTION 			:= true

# Fonts
EXTENDED_FONT_FOOTPRINT 			:= true

# Lights
TARGET_PROVIDES_LIBLIGHT 			:= true

BOARD_SEPOLICY_DIRS += \
        device/samsung/fortunave3g/sepolicy
        
BOARD_SEPOLICY_UNION += \
    file.te \
    device.te \
    app.te \
    cne.te \
    qmux.te \
    mpdecision.te \
    thermald.te \
    ueventd.te \
    rild.te\
    vold.te \
    file_contexts \
    genfs_contexts \
    te_macros
