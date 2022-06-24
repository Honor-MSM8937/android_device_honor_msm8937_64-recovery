#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2019-2021 The OrangeFox Recovery Project
#	
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
# 	
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="msm8937_64"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
   	export TW_DEFAULT_LANGUAGE="en"
	export OF_KEEP_FORCED_ENCRYPTION=0
	export OF_PATCH_AVB20=0
	export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
        
	export OF_SCREEN_H=2160
	export OF_USE_MAGISKBOOT=0
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=0
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=0
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1

	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_NANO_EDITOR=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_ZIP_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_REPLACE_BUSYBOX_PS=1
	export OF_USE_NEW_MAGISKBOOT=0
	export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1

        # use system (ROM) fingerprint where available
        export OF_USE_SYSTEM_FINGERPRINT=1

	# OTA for custom ROMs
        export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=0

        # -- add settings for R11 --
        export OF_QUICK_BACKUP_LIST="/boot;/data;/system_image;/vendor_image;"
        # -- end R11 settings --

	# run a process after formatting data to work-around MTP issues
	export OF_RUN_POST_FORMAT_PROCESS=0

	# Build vars for our msm.
	export ALLOW_MISSING_DEPENDENCIES=true
	export LC_ALL="C"
	export FOX_INSTALLER_DEBUG_MODE=1
	export OF_MAINTAINER=KrutosX
	export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/platform/soc/7824900.sdhci/by-name/recovery_ramdisk"	
	export OF_FLASHLIGHT_ENABLE=1
	export OF_FL_PATH1="/sys/devices/soc/7af6000.i2c/i2c-6/6-006b/leds/torch-light0"
	export OF_FL_PATH2="/sys/devices/soc/7af6000.i2c/i2c-6/6-0063/leds/torch-light1"
	export TARGET_DEVICE_ALT="msm8937, msm8937_64, aum_l29, AUM_L29, AUML29"
	export LC_ALL="C"

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi
#
