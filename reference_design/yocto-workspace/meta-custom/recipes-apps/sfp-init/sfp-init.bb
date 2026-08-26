SUMMARY = "SFP PHY I2C Initialization and DHCP setup"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = " \
    file://sfp-init.sh \
    file://sfp-init.service \
    file://10-end1.network \
"

S = "${WORKDIR}"

inherit systemd

SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE:${PN} = "sfp-init.service"
SYSTEMD_AUTO_ENABLE:${PN} = "enable"

RDEPENDS:${PN} += "i2c-tools"

do_install() {
    # Install initialization script
    install -d ${D}${sbindir}
    install -m 0755 ${S}/sfp-init.sh ${D}${sbindir}/sfp-init.sh

    # Install systemd services
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${S}/sfp-init.service ${D}${systemd_system_unitdir}/sfp-init.service

    # Install systemd-networkd DHCP configuration
    install -d ${D}${sysconfdir}/systemd/network
    install -m 0644 ${S}/10-end1.network ${D}${sysconfdir}/systemd/network/10-end1.network
}

FILES:${PN} += " \
    ${sbindir}/sfp-init.sh \
    ${systemd_system_unitdir}/sfp-init.service \
    ${sysconfdir}/systemd/network/10-end1.network \
"