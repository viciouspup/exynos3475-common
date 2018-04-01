#!/system/bin/sh

BB=/res/busybox;
# Remount root and system read/write
mount -t rootfs -o remount,rw rootfs
mount -o remount,rw /system
mount -o remount,rw /data
 
# Check for init.d folder and create it if it doesn't available
if [ ! -e /system/etc/init.d ] ; then
	mkdir /system/etc/init.d
	chown -R root.root /system/etc/init.d
	chmod -R 755 /system/etc/init.d
else
	chown -R root.root /system/etc/init.d
	chmod -R 755 /system/etc/init.d
fi

# Run init.d scripts
export PATH=${PATH}:/system/bin:/system/xbin
$BB run-parts /system/etc/init.d
 
# cp uci,busybox
$BB mount -t rootfs -o remount,rw rootfs
$BB chmod -R 755 /res/*
ln -s /res/uci_p/uci /sbin/uci
/sbin/uci

# cp busybox
$BB mount -t rootfs -o remount,rw rootfs
ln -s /res/busybox /system/xbin/busybox
/system/xbin/busybox

chmod 777 /system/xbin/busybox;
chmod 777 /system/xbin/swapit;
chmod 777 /res/*
