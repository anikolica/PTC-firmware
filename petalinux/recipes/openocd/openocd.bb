#
# This is the openocd apllication recipe
#
#

SUMMARY = "openocd JTAG tool"
SECTION = "PETALINUX/apps"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=599d2d1ee7fc84c0467b3d19801db870"

SRCREV = "${AUTOREV}"
PV = "0.12.0"
# SRC_URI = "git://git.code.sf.net/p/openocd/code;protocol=https;submodules=1;branch=master"
SRC_URI = "https://sourceforge.net/projects/openocd/files/openocd/0.12.0/openocd-0.12.0.tar.bz2"
SRC_URI[sha256sum] = "af254788be98861f2bd9103fe6e60a774ec96a8c374744eef9197f6043075afa"

S = "${WORKDIR}/openocd-0.12.0"

INHIBIT_AUTOTOOLS_DEPS = "1"
DEPENDS = "libusb1 libftdi"

inherit autotools pkgconfig

do_configure:prepend() {
        (cd ${S} $$ ./bootstrap)
}

EXTRA_OECONF = "--enable-ftdi \
                --enable-jlink \
                --enable-xilinx-xc7"

do_install:append() {
        install -d ${D}${sysconfdir}/openocd
        install -d ${D}${bindir}
}



# CFLAGS:prepend = "-I ${S}/include"
BBCLASSEXTEND = "native nativesdk"
