#!/system/bin/sh

CHANNEL=$(getprop net.wifi.adbtest.channel)
POWER=$(getprop net.wifi.adbtest.power)
STANDARD=$(getprop net.wifi.adbtest.standard)
DATARATE=$(getprop net.wifi.adbtest.rate)

echo 22 $CHANNEL $POWER $STANDARD$'\n'25 1 $DATARATE$'\n'>/data/local/cmd2
wb
