#!/bin/bash
#Cleanup before build

echo "Remove Any files"
cd /home/elite/android/J2_MM/rf-tools/AIK-Linux

sudo ./cleanup.sh

echo "Copy Ramdisk"

sudo cp -a /home/elite/android/J2_MM/rf-tools/J200G/ramdisk/. /home/elite/android/J2_MM/rf-tools/AIK-Linux/ramdisk

echo "copy split-img"

sudo cp -a /home/elite/android/J2_MM/rf-tools/J200G/split_img/. /home/elite/android/J2_MM/rf-tools/AIK-Linux/split_img

echo "copy compiled zimage"

sudo cp /home/elite/android/J2_MM/arch/arm/boot/Image /home/elite/android/J2_MM/rf-tools/AIK-Linux/split_img/boot.img-zImage

echo "copy compiled dtb"

sudo cp /home/elite/android/J2_MM/boot.img-dtb /home/elite/android/J2_MM/rf-tools/AIK-Linux/split_img/boot.img-dtb

echo "packing image"

sudo ./repackimg.sh

echo "Copy boot.img"

sudo cp /home/elite/android/J2_MM/rf-tools/AIK-Linux/image-new.img /home/elite/android/J2_MM/rf-tools/out/boot_J200G.img

echo "Cleanup after packing"

cd /home/elite/android/J2_MM/rf-tools/AIK-Linux

sudo ./cleanup.sh

rm /home/elite/android/J2_MM/boot.img-dtb

echo "boot.img saved to /rf-tools/out"
