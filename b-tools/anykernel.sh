# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=LegendKernel by lzzy12 and durgesh33 @ xda-developers
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=j2lte
device.name2=j2ltedd
device.name3=j2lteswa
device.name4=
device.name5=
} # end properties

# shell variables
block=/dev/block/platform/13540000.dwmmc0/by-name/BOOT;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;


## AnyKernel install
dump_boot;
# Ramdisk changes here


write_boot;

## end install

