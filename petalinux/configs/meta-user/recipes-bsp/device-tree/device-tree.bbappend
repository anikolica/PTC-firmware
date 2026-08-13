FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Ensure the kernel shared workdir is populated before compiling the device tree
do_configure[depends] += "virtual/kernel:do_shared_workdir"

# Add the correct header search paths (no wildcards)
KERNEL_INCLUDE:append = " \
    ${STAGING_KERNEL_DIR}/include \
    ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts \
    ${STAGING_KERNEL_DIR}/scripts/dtc/include-prefixes \
"

SRC_URI:append = " file://system-user.dtsi"
SRC_URI:append = " file://net-conf.dtsi"
SRC_URI:append = " file://sd-conf.dtsi"
SRC_URI:append = " file://pwr-conf.dtsi"

require ${@'device-tree-sdt.inc' if d.getVar('SYSTEM_DTFILE') != '' else ''}
