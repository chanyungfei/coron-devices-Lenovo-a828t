#!/system/bin/sh

setprop ontim.backupzip_result 0

APP_NAME=$(getprop ontim.backupzip_name)
APP_DIR=$(getprop ontim.backupzip_backdir)
BACKUP_TODIR=$(getprop ontim.backupzip_backtodir)

echo "$APP_NAME"
echo "$APP_DIR"
echo "$BACKUP_TODIR"

busybox tar -cvf $BACKUP_TODIR$APP_NAME.tar $APP_DIR
busybox sync

setprop ontim.backupzip_result 1

