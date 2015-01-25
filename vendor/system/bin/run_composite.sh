#!/system/bin/sh

setprop sys.telephonymoduleloglevel 8

MODULE_DIR=/system/lib/modules
insmod $MODULE_DIR/cploaddev.ko
insmod $MODULE_DIR/seh.ko
# load cp and mrd image and release cp
/system/bin/cploader

if [ "$?" -ne 0 ]; then
	rmmod seh
	rmmod cploaddev
	stop ril-daemon
	exit
fi

if [ ! -e $NVM_ROOT_DIR ]; then
	mkdir -p $NVM_ROOT_DIR
	chown system.system $NVM_ROOT_DIR
fi

if [ ! -e $MARVELL_RW_DIR ]; then
	mkdir -p $MARVELL_RW_DIR
	chown system.system $MARVELL_RW_DIR
	chmod 0755 $MARVELL_RW_DIR
fi

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

# copy correct RF config file for CP
# pxa988zx -> sparrow v2.1
# pxa988ax -> sparrow v3.1
cputype=`cat /sys/devices/system/cpu/cpu0/cputype`
case "$cputype" in
    "pxa988zx")
	rfcfg_src="configuration/TDRF_Config.nvm"
	rfcfg_dst="TDRF_Config.nvm"
	;;
    "pxa988ax")
	rfcfg_src="configuration/TDRF_Config.nvm"
	rfcfg_dst="TDRF_Config.nvm"
	;;
	*)
	rfcfg_src=""
	rfcfg_dst=""
	;;
esac

# don't copy here
# copy_if_not_exist "/etc/tel/configuration/TDRF_Config.nvm" "${NVM_ROOT_DIR}/TDRF_Config.nvm"

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

start eeh
start nvm
start diag
start atcmdsrv
start vcm
