#!/system/bin/sh
su

rmmod /system/lib/modules/mlan.ko
rmmod /system/lib/modules/sd8787.ko "drv_mode=1 mfg_mode=1 fw_name=mrvl/SD8777.bin"
rmmod /system/lib/modules/mbt8xxx.ko "multi_fn=0x04"
