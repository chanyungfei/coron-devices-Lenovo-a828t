#!/system/bin/sh

CHANNEL=$(getprop net.wifi.adbtest.channel)

echo 22 $CHANNEL $'\n' 18 1$'\n'>/data/local/cmd2
wb
