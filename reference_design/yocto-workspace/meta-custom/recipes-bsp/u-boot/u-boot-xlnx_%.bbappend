FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " file://platform-top.h file://bsp.cfg"
SRC_URI += "file://u-boot-merged.cfg \
            file://0001-Take-i2c-switches-out-of-reset-in-board_late_init.patch \
            file://0001-Read-MAC-from-BRD_ID-EEPROM.patch \
            "
do_configure:prepend() {
    install -d ${S}/include/configs
    cp ${WORKDIR}/platform-top.h ${S}/include/configs/platform-top.h
}
