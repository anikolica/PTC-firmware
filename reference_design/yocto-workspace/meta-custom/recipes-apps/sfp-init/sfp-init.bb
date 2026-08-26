SUMMARY = "SFP PHY I2C Initialization and DHCP setup"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SVC_NAME = "sfp-init"
SVC_TEMPLATE = "${SVC_NAME}@"
SVC_INSTANCE = "${SVC_NAME}@3-end1"

SRC_URI = " \
    file://sfp-init.sh \
    file://${SVC_TEMPLATE}.service \
    file://10-end1.network \
"

S = "${WORKDIR}"

inherit systemd

SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE:${PN} = "${SVC_INSTANCE}.service"
# SYSTEMD_AUTO_ENABLE:${PN} = "enable"

RDEPENDS:${PN} += "i2c-tools"

do_install() {
    # Install initialization script
    install -d ${D}${sbindir}
    install -m 0755 ${S}/sfp-init.sh ${D}${sbindir}/sfp-init.sh

    # Install systemd services
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/${SVC_TEMPLATE}.service ${D}${systemd_system_unitdir}/${SVC_TEMPLATE}.service

    install -d ${D}${systemd_system_unitdir}/multi-user.target.wants
    ln -sf ../${SVC_TEMPLATE}.service ${D}${systemd_system_unitdir}/multi-user.target.wants/${SVC_INSTANCE}.service


    # Install systemd-networkd DHCP configuration
    install -d ${D}${sysconfdir}/systemd/network
    install -m 0644 ${S}/10-end1.network ${D}${sysconfdir}/systemd/network/10-end1.network
}

FILES:${PN} += " \
    ${sbindir}/sfp-init.sh \
    ${systemd_system_unitdir}/${SVC_TEMPLATE}.service \
    ${systemd_system_unitdir}/multi-user.target.wants/${SVC_INSTANCE}.service \
    ${sysconfdir}/systemd/network/10-end1.network \
"