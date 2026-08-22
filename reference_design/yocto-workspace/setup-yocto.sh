#!/bin/bash
set -e

# Clone upstream layers if they don't exist
git clone -b scarthgap git://git.yoctoproject.org/poky
git clone -b scarthgap https://github.com/openembedded/meta-openembedded
git clone -b scarthgap git://git.yoctoproject.org/meta-arm
git clone -b scarthgap https://git.yoctoproject.org/meta-virtualization
git clone -b rel-v2025.2 https://github.com/Xilinx/meta-xilinx
git clone -b rel-v2025.2 https://github.com/Xilinx/meta-xilinx-tools

# Initialize build environment
source poky/oe-init-build-env build
