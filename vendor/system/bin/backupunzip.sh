#!/system/bin/sh

setprop ontim.backupunzip_result 0

APP_TARNAME=$(getprop ontim.backupunzip_tarname)
APP_ID=$(getprop ontim.backupunzip_id)
APP_NAME=$(getprop ontim.backupunzip_name)
RESTORE_FROMDIR=$(getprop ontim.backupunzip_restoretodir)

echo "$APP_TARNAME"
echo "$APP_ID"
echo "$APP_NAME"
echo "$RESTORE_FROMDIR"

busybox tar -xvf $RESTORE_FROMDIR$APP_TARNAME
busybox chown -R u0_a$APP_ID.u0_a$APP_ID /data/data/$APP_NAME
busybox chown -R system.system /data/data/$APP_NAME/lib

setprop ontim.backupunzip_result 1







