#!/bin/bash
#Cleanup before build
export HOME=$(pwd)
echo "Remove Any files"

cd $HOME/rf-tools/AIK-Linux

sudo ./cleanup.sh

echo "Copy Ramdisk"

sudo cp -a $HOME/rf-tools/J200G/ramdisk/. $HOME/rf-tools/AIK-Linux/ramdisk

echo "copy split-img"

sudo cp -a $HOME/rf-tools/J200G/split_img/. $HOME/rf-tools/AIK-Linux/split_img

echo "copy compiled zimage"

sudo cp $HOME/arch/arm/boot/zImage $HOME/rf-tools/AIK-Linux/split_img/boot.img-zImage

echo "copy compiled dtb"

sudo cp $HOME/boot.img-dtb $HOME/rf-tools/AIK-Linux/split_img/boot.img-dtb

echo "packing image"

sudo ./repackimg.sh

echo "Copy boot.img"
mkdir -p $HOME/rf-tools/out
sudo cp $HOME/rf-tools/AIK-Linux/image-new.img $HOME/rf-tools/out/boot_J200G.img

echo "Cleanup after packing"

cd $HOME/rf-tools/AIK-Linux

sudo ./cleanup.sh

rm $HOME/boot.img-dtb

echo "boot.img saved to /rf-tools/out"

