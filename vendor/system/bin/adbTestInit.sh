#!/system/bin/sh
su

insmod /system/lib/modules/mlan.ko
insmod /system/lib/modules/sd8787.ko "drv_mode=1 mfg_mode=1 fw_name=mrvl/SD8777.bin"
insmod /system/lib/modules/mbt8xxx.ko "multi_fn=0x04"
rfkill unblock wifi

TESTMODE=$(getprop net.wifi.adbtest.testmode)

echo $TESTMODE > /data/local/cmd1

