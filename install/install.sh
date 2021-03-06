#!/bin/bash

KERNEL_DIR=../tf300tg-kernel-source
CONFIG_DIR=../configuration
#copy over modified kernel source to prevent suspend
kernelSource=kernel/power
cp -r $CONFIG_DIR/$kernelSource $KERNEL_DIR/$kernelSource

./makekernel.sh
./buildblobpack.sh
./buildmkbootimg.sh
sudo ./buildos.sh
sudo ./makeinitrd.sh
sudo ./installtf300.sh
sudo ./makedisk.sh
./makeupdatezip.sh
