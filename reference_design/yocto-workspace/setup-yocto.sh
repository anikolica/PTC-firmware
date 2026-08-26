#!/bin/bash
set -e

XIL_REL="rel-v2025.1"

# Clone upstream layers if they don't exist
git clone -b scarthgap https://git.yoctoproject.org/poky
git clone -b scarthgap https://github.com/openembedded/meta-openembedded
git clone -b scarthgap https://git.yoctoproject.org/meta-arm
git clone -b scarthgap https://git.yoctoproject.org/meta-virtualization
git clone -b ${XIL_REL} https://github.com/Xilinx/meta-xilinx
git clone -b ${XIL_REL} https://github.com/Xilinx/meta-xilinx-tools
git clone -b ${XIL_REL} https://github.com/Xilinx/gen-machine-conf.git
git clone -b ${XIL_REL} https://github.com/ddrobner/meta-dune.git
