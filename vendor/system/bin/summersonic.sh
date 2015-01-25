



if [ -f "/system/framework/beat.jar" ]; then
	echo "beat.jar exists in /system/framerok."
	busybox sh /system/bin/uiautomator runtest /system/framework/beat.jar -c com.ontim.beat.action.SummerSonic
else
	echo "beat.jar doesn't exist in /system/framerok."
fi


