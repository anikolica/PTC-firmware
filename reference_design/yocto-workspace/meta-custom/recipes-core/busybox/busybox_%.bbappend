FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://default.script"

do_install:append() {
    # Ensure the target directory skeleton layout exists on the rootfs
    install -d ${D}${datadir}/udhcpc

    # Install the script into /usr/share/udhcpc/ with executable privileges
    install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
}
