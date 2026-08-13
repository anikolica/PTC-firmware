FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " file://boot.cmd.default"

do_compile() {
    cat << 'EOF' > ${S}/boot.cmd
setenv autoload no
setenv netretry yes

echo "=== Starting HTTP Netboot ==="
echo "Server IP is: ${serverip}"
echo "Board IP is:  ${ipaddr}"

setenv bootargs "console=ttyPS0,115200 earlycon"

sleep 1

# Download image.ub to 0x40000000 (1GB offset) to avoid memory collision
echo "Downloading image.ub over HTTP..."
wget 0x40000000 ${serverip}:/image.ub

# Boot FIT image from 0x40000000
echo "Booting image.ub..."
bootm 0x40000000
EOF

    uboot-mkimage -A arm -O linux -T script -C none -a 0 -e 0 -n "HTTP Boot Script" -d ${S}/boot.cmd ${B}/boot.scr

    touch ${S}/pxeboot.pxe
    touch ${B}/pxeboot.pxe
}