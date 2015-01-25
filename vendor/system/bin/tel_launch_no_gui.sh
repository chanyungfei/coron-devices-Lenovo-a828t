#!/system/bin/sh

#file_name="$NVM_ROOT_DIR/COMCfg.csv"
#file_exist=`ls $file_name`
#case "$file_exist" in
#    $file_name)
#    echo "$NVM_ROOT_DIR/COMCfg.csv";
#    ;;
#    *)
#	cat /marvell/tel/configuration/COMCfg.csv > $NVM_ROOT_DIR/COMCfg.csv;
#	cat /marvell/tel/configuration/platform.nvm > $NVM_ROOT_DIR/platform.nvm;
#	cat /marvell/tel/configuration/afcDacTable.nvm > $NVM_ROOT_DIR/afcDacTable.nvm;
#    ;;
#esac

#check NVM partition on eMMC
mk_ext4_fs="/system/bin/make_ext4fs"

nvm_partition="mmcblk0p12"

nvm_partition_dev="/dev/block/$nvm_partition"
nvm_partition_fs="/sys/fs/ext4/$nvm_partition"

case "`cd $nvm_partition_fs; pwd`" in
	"$nvm_partition_fs")
		#already have file system, nothing need to do
		;;
	*)
		#format it as ext4 then mount it
		$mk_ext4_fs $nvm_partition_dev;
		sync;
		mount -o nosuid -o nodev -t ext4 $nvm_partition_dev $NVM_ROOT_DIR;
		;;
esac

#copy default calibration xml to /NVM/ if dest not exist.
#src_file="/etc/audio_swvol_calibration_def.xml"
#dst_file="${NVM_ROOT_DIR}/audio_swvol_calibration.xml"

#if [ -f "${dst_file}" ]; then
#	echo "existing ${dst_file}";
#else
#	if [ -f "${src_file}" ]; then
#		cp ${src_file} ${dst_file}
#		chmod 666 ${dst_file}
#		chown system.system ${dst_file}
#		echo "cp: ${src_file} -> ${dst_file}"
#	fi
#fi

setprop sys.telephonymoduleloglevel 8
MODULE_DIR=/system/lib/modules
insmod $MODULE_DIR/cploaddev.ko
#echo 1 > /sys/devices/system/cpu/cpu0/cp
insmod $MODULE_DIR/seh.ko
# load cp and mrd image and release cp
/system/bin/cploader

if [ "$?" -ne 0 ]; then
	rmmod seh
	rmmod cploaddev
	exit
fi

cputype=`cat /sys/devices/system/cpu/cpu0/cputype`
fastdormancytimeout=`getprop persist.radio.fastdorm.timeout`
if [ -z "$fastdormancytimeout" ]; then
	case "$cputype" in
            "pxa986ax"|"pxa986zx")
	    setprop persist.radio.fastdorm.timeout 5
	    ;;
            "pxa988ax"|"pxa988zx")
	    setprop persist.radio.fastdorm.timeout 0
	    ;;
	    *)
	    setprop persist.radio.fastdorm.timeout 0
	    ;;
	esac
fi

insmod $MODULE_DIR/msocketk.ko
insmod $MODULE_DIR/citty.ko
insmod $MODULE_DIR/cci_datastub.ko
insmod $MODULE_DIR/ccinetdev.ko
insmod $MODULE_DIR/gs_modem.ko
insmod $MODULE_DIR/diag.ko
insmod $MODULE_DIR/gs_diag.ko
insmod $MODULE_DIR/cidatattydev.ko

# $1 src file
# $2 dst file
function copy_if_not_exist()
{
if [ -f "${2}" ]; then
	echo "existing ${2}";
else
	if [ -f "${1}" ]; then
		cp ${1} ${2}
		chmod 666 ${2}
		chown system.system ${2}
		echo "cp: ${1} -> ${2}"
	fi
fi
}

# $1 src file
# $2 dst file
function copy_if_not_same()
{
if [ -f "${2}" ]; then
#	echo "existing ${2}";
        cmp "${1}" "${2}"
        if [ "$?" -ne 0 ]; then
                echo "diff ${2}";
		if [ -f "${1}" ]; then
			cp ${1} ${2}
			chmod 666 ${2}
			chown system.system ${2}
			echo "cp: ${1} -> ${2}"
		fi
        else
		echo "same ${2}";
        fi
else
	if [ -f "${1}" ]; then
		cp ${1} ${2}
		chmod 666 ${2}
		chown system.system ${2}
		echo "cp: ${1} -> ${2}"
	fi
fi
}


# copy correct RF config file for CP
# pxa988zx -> sparrow v2.1
# pxa988ax -> sparrow v3.1

case "$cputype" in
    "pxa988zx")
	rfcfg_src="emei/TDRF_Config_Sparrow_V2.1.nvm"
	rfcfg_dst="TDRF_Config.nvm"
	;;
    "pxa988ax")
	rfcfg_src="emei/TDRF_Config_Sparrow_V3.1.nvm"
	rfcfg_dst="TDRF_Config.nvm"
	;;
	*)
	rfcfg_src=""
	rfcfg_dst=""
	;;
esac

copy_if_not_same "/etc/tel/ttc/AcStatOption.nvm" "${NVM_ROOT_DIR}/AcStatOption.nvm"
copy_if_not_same "/etc/tel/ttc/audio_avc.nvm" "${NVM_ROOT_DIR}/audio_avc.nvm"
copy_if_not_same "/etc/tel/ttc/audio_config.nvm" "${NVM_ROOT_DIR}/audio_config.nvm"
copy_if_not_same "/etc/tel/ttc/audio_ctm.nvm" "${NVM_ROOT_DIR}/audio_ctm.nvm"
copy_if_not_same "/etc/tel/ttc/audio_DualMic.nvm" "${NVM_ROOT_DIR}/audio_DualMic.nvm"
copy_if_not_same "/etc/tel/ttc/audio_ec.nvm" "${NVM_ROOT_DIR}/audio_ec.nvm"
copy_if_not_same "/etc/tel/ttc/audio_effect_config.xml" "${NVM_ROOT_DIR}/audio_effect_config.xml"
copy_if_not_same "/etc/tel/ttc/audio_eq.nvm" "${NVM_ROOT_DIR}/audio_eq.nvm"
copy_if_not_same "/etc/tel/ttc/audio_gain_calibration.xml" "${NVM_ROOT_DIR}/audio_gain_calibration.xml"
copy_if_not_same "/etc/tel/ttc/audio_gssp_config.nvm" "${NVM_ROOT_DIR}/audio_gssp_config.nvm"
copy_if_not_same "/etc/tel/ttc/audio_HLPF.nvm" "${NVM_ROOT_DIR}/audio_HLPF.nvm"
copy_if_not_same "/etc/tel/ttc/audio_misc.nvm" "${NVM_ROOT_DIR}/audio_misc.nvm"
copy_if_not_same "/etc/tel/ttc/audio_MSAmain.nvm" "${NVM_ROOT_DIR}/audio_MSAmain.nvm"
copy_if_not_same "/etc/tel/ttc/audio_ns.nvm" "${NVM_ROOT_DIR}/audio_ns.nvm"
copy_if_not_same "/etc/tel/ttc/audio_swvol_calibration.xml" "${NVM_ROOT_DIR}/audio_swvol_calibration.xml"
copy_if_not_same "/etc/tel/ttc/COMCfg.csv" "${NVM_ROOT_DIR}/COMCfg.csv"

setprop sys.tools.enable 1

/system/bin/eeh -M yes &
/system/bin/nvm &
/system/bin/diag &
/system/bin/atcmdsrv -M yes &
/system/bin/vcm &

copy_if_not_same "/etc/tel/configuration/TDRF_Config.nvm" "${NVM_ROOT_DIR}/TDRF_Config.nvm"
copy_if_not_same "/etc/tel/configuration/EEHandlerConfig_Linux.nvm" "${NVM_ROOT_DIR}/EEHandlerConfig_Linux.nvm"
copy_if_not_exist "/etc/tel/configuration/GsmCalData.nvm" "${NVM_ROOT_DIR}/GsmCalData.nvm"
copy_if_not_exist "/etc/tel/configuration/TdCalData.nvm" "${NVM_ROOT_DIR}/TdCalData.nvm"
copy_if_not_same "/etc/tel/configuration/SystemControl.nvm" "${NVM_ROOT_DIR}/SystemControl.nvm"

