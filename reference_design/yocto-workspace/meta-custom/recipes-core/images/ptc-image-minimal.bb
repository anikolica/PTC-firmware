SUMMARY = "PTC Production Minimal Image"
require recipes-core/images/core-image-minimal.bb

# Stripping rules
IMAGE_FEATURES = "read-only-rootfs ssh-server-dropbear empty-root-password allow-empty-password"
IMAGE_LINGUAS = ""
USE_NLS = "no"
NO_RECOMMENDATIONS = "1"
IMAGE_FSTYPES = "cpio.gz"

# Add only runtime dependencies
# Ignoring OpenOCD - potentially want to include this in the minimal image for
when deployed?
# Likewise for setting the u-boot env
IMAGE_INSTALL += " \
    systemd-timesyncd \
    systemd-networkd \
    mtd-utils-flashcp \
    mtd-utils-flash-erase \
    sfp-init \
    genskeleton \
"

# Direct systemd to act as /init
ROOTFS_POSTPROCESS_COMMAND += "link_systemd_init; "
link_systemd_init() {
    ln -sf /lib/systemd/systemd ${IMAGE_ROOTFS}/init
}
