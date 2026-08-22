SUMMARY = "Custom Replicated PetaLinux Image"
LICENSE = "MIT"

inherit core-image

# -------------------------------------------------------------
# Core & Package Groups
# -------------------------------------------------------------
IMAGE_INSTALL:append = " \
    packagegroup-core-boot \
    packagegroup-core-buildessential \
    packagegroup-core-buildessential-dev \
"

# -------------------------------------------------------------
# AMD / Xilinx Hardware & FPGA Tools
# -------------------------------------------------------------
IMAGE_INSTALL:append = " \
    fpga-manager-script \
    libdfx \
    linux-xlnx-udev-rules \
    udev-extraconf \
    u-boot-tools \
    libubootenv-bin \
"

# -------------------------------------------------------------
# Networking & Connectivity Tools
# -------------------------------------------------------------
IMAGE_INSTALL:append = " \
    bridge-utils \
    can-utils \
    ethtool \
    init-ifupdown \
    iproute2 \
    netcat \
    nfs-utils \
    openssh-sftp-server \
    rsync \
    tcpdump \
"

# -------------------------------------------------------------
# System Utilities & Storage Tools
# -------------------------------------------------------------
IMAGE_INSTALL:append = " \
    acl \
    acl-dev \
    bzip2 \
    dbus \
    dbus-dev \
    dosfstools \
    e2fsprogs-mke2fs \
    file \
    git \
    grep \
    gzip \
    haveged \
    i2c-tools \
    make \
    mtd-utils \
    pciutils \
    python3 \
    run-postinsts \
    sudo \
    tar \
    tcf-agent \
    unzip \
    vim \
    zip \
"

# -------------------------------------------------------------
# Custom Migrated User Applications (from meta-user)
# -------------------------------------------------------------
IMAGE_INSTALL:append = " \
    genskeleton \
    openocd \
    regtest \
    sfp-init \
"
