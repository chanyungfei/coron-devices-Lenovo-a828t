#!/system/bin/sh

#move NVM_ROOT_DIR to init.rc so other applications and services also use it.
#export  NVM_ROOT_DIR="/data/Linux/Marvell/NVM"

setprop marvell.ril.ppp.enabled 0
setprop log.tag.Mms:transaction V
setprop log.tag.Mms:app V
setprop log.tag.Mms:threadcache V
setprop android.telephony.apn-restore 600000
setprop sys.usb.diagmodem 1

setprop ro.marvell.platform.type TTC_TD

#copy default calibration xml to /NVM/ if dest not exist.
src_file="/etc/audio_swvol_calibration_def.xml"
dst_file="${NVM_ROOT_DIR}/audio_swvol_calibration.xml"

if [ -f "${dst_file}" ]; then
	echo "existing ${dst_file}";
else
	if [ -f "${src_file}" ]; then
		cp ${src_file} ${dst_file}
		chmod 666 ${dst_file}
		chown system.system ${dst_file}
		echo "cp: ${src_file} -> ${dst_file}"
	fi
fi

#backup log files
/system/bin/backup_log.sh


#/system/bin/run_composite.sh;

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





#check if NVM partition has been mounted successfully
nvm_partition="mmcblk0p12"
nvm_partition_fs="/sys/fs/ext4/$nvm_partition"

signal=0
while [[ $signal != 1 ]]
do
    case "`cd $nvm_partition_fs; pwd`" in
        "$nvm_partition_fs")
            #alread mounted
            copy_if_not_exist "/etc/tel/configuration/TDRF_Config.nvm" "${NVM_ROOT_DIR}/TDRF_Config.nvm"
            
            signal=1
            ;;
        *)
            sleep 1s
	    ;;
    esac

done





copy_if_not_exist "/etc/tel/configuration/GsmCalData.nvm" "${NVM_ROOT_DIR}/GsmCalData.nvm"
copy_if_not_exist "/etc/tel/configuration/TdCalData.nvm" "${NVM_ROOT_DIR}/TdCalData.nvm"

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
copy_if_not_same "/etc/tel/configuration/SystemControl.nvm" "${NVM_ROOT_DIR}/SystemControl.nvm"
copy_if_not_same "/etc/tel/ttc/COMCfg.csv" "${NVM_ROOT_DIR}/COMCfg.csv"




copy_if_not_same "/etc/tel/configuration/TDRF_Config.nvm" "${NVM_ROOT_DIR}/TDRF_Config.nvm"
copy_if_not_same "/etc/tel/configuration/EEHandlerConfig_Linux.nvm" "${NVM_ROOT_DIR}/EEHandlerConfig_Linux.nvm"


sync

/system/bin/run_composite.sh;

