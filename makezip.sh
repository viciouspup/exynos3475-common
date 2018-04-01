#!/bin/bash

# Ensuring that parameters are provided!
if [$1 -eq ""]
then
	echo "Usage: makezip.sh [version-name]"
	exit
fi


export CDIR="$(pwd)"
rm -rf $CDIR/b-tools/zImage
cp $CDIR/arch/arm/boot/zImage-dtb $CDIR/b-tools/
mkdir -p $CDIR/b-tools/out/
zip -r9 $CDIR/b-tools/out/UPDATE-Kernel-$1.zip $CDIR/b-tools/* -x README *.zip
