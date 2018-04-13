#!/bin/bash

# Ensuring that parameters are provided!
if [$1 -eq ""]
then
	echo "Usage: makezip.sh [version-name]"
	exit
fi


export CDIR="$(pwd)/.."
rm -rf $CDIR/b-tools/zImage
rm -rf $CDIR/b-tools/out
cp $CDIR/arch/arm/boot/zImage $CDIR/b-tools/
mkdir -p $CDIR/b-tools/out/
zip -r9 ./out/UPDATE-Kernel-$1.zip * -x README out/*.zip
