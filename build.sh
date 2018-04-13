#!/bin/bash
DTS=arch/arm/boot/dts
RDIR=$(pwd)
# GCC
export CROSS_COMPILE=../linaro-7/bin/arm-eabi-
# J200G MM Defcon
make j2lteswa_N_defconfig -j$(nproc --all)
make exynos3475-j2lte_swa_open_00.dtb exynos3475-j2lte_swa_open_01.dtb exynos3475-j2lte_swa_open_02.dtb exynos3475-j2lte_swa_open_03.dtb exynos3475-j2lte_swa_open_04.dtb -j$(nproc --all)
# Make zImage
make ARCH=arm $(nproc --all)

# Cleaup
rm -rf $DTS/.*.tmp
rm -rf $DTS/.*.cmd
rm -rf $DTS/*.dtb
