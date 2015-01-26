#!/bin/bash

apkBaseName=$1
tempSmaliDir=$2

if [ "$apkBaseName" = "Settings" ];then
    echo ">>> in custom_app $apkBaseName"

    echo ">>> change EMULATED_STORAGE_TARGET to EMULATED_STORAGE_TARGET_X in Memory.java"
    sed -i 's/EMULATED_STORAGE_TARGET/EMULATED_STORAGE_TARGET_X/g' $tempSmaliDir/smali/com/android/settings/deviceinfo/Memory.smali
    echo ">>> use vendor persist.sys.primarysd property to support storage change"
    sed -i 's/persist.sys.baidu.default_write/persist.sys.primarysd/g' $tempSmaliDir/smali/com/android/settings/deviceinfo/Memory.smali
    sed -i 's/first_storage/0/g' $tempSmaliDir/smali/com/android/settings/deviceinfo/Memory.smali
    sed -i 's/secondary_storage/1/g' $tempSmaliDir/smali/com/android/settings/deviceinfo/Memory.smali

fi

