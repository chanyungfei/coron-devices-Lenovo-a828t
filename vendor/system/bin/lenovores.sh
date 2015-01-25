#!/system/bin/sh

setprop persist.sys.sdcard.copy 0

busybox tar -xvf /system/preinstall/lenovo/lenovores.tar -C /mnt/sdcard/

setprop persist.sys.sdcard.copy 1

