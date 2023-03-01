


# Power and Timing Card v4 (PTCv4) Firmware

## Maintainer

Adrian Nikolica (nikolica@hep.upenn.edu)

## Contributors

* Adrian Nikolica
* Godwin Mayers

## Documentation

* [(Old) PTCv3B Design Documentation](https://docs.dunescience.org/cgi-bin/private/ShowDocument?docid=6955)
* [Warm Interface Board v3 (WIBv3) Design Documentation](https://docs.dunescience.org/cgi-bin/private/ShowDocument?docid=24127)
* [Bristol Timing Endpoint Firmware](https://gitlab.cern.ch/dune-daq/timing/dune-timing-firmware)
* [Mercury XU5 PE1 Reference Design documentation](https://github.com/enclustra/Mercury_XU5_PE1_Reference_Design)
* [Petalinux documentation](https://github.com/enclustra/PetalinuxDocumentation)
* Enclustra Application Notes
  - [I2C AppNote](https://github.com/enclustra/I2CAppNote)
  - [Gigabit Ethernet AppNote](https://github.com/enclustra/GigabitEthernetAppNote)

## Changelog
See [Changelog](changelog.md).

## Description
This respository contains firmware and software source for PTCv4. Firmware runs on an Enclustra Mercury XU5 mezzanine (ME-XU5-5EV-2I-D12E variant). Software runs on an Infineon XMC4300 EtherCAT capable microcontroller.

### Directory Structure

|      |      |
| :--- | :--- |
| Mercury_XU5_PE1/ | Contains the recreated Vivado project. Does not need to be source controlled. |
| reference_design/src/ | Verilog source files, pin/timing constraint files |
| reference_design/scripts/ | Build scripts |
| reference_design/ip_repo/ | User-generated IP |

### Git Instructions
This project uses Vivado 2022.2 and petalinux 2022.2 in a Linux environment (Ubuntu 20.04.1 is used for development).

1. `git pull` changes from remote.
2. Open `vivado` from reference_design directory.
3. In tcl console, run `source ./scripts/create_project.tcl`
4. Work on project using IDE.
5. Go to **File - Project - Write Tcl**. Set the output file to `create_project.tcl`. Check *Write all properties*, *Recreate Block Designs using Tcl*, and *Write object values*. Uncheck *Copy sources to new project*. Check the `git diff` output and ensure no files path names are corrupted before comitting changes.
6. All other HDL files should be kept in the src/ directory.
7. `git commit` all changes and `git push`.

### Building software
First, from Vivado:
1. **File - Export - Export Hardware - Include Bitstream** and export to the default *Mercury_XU5_PE1/* project directory (this will export an .xsa file).
2. **File - Export - Export Hardware - Export Bitstream File** and choose the same default directory as above. Name the file *Mercury_XU5_PE1.bit*.
From the reference_design/ directory:
3. `petalinux-create -t project -n ptc.linux --template zynqMP`
4. Copy the `config` and `rootfs_config` files in this repo to the `/ptc.linux/project-spec/configs/` folder. 
5. `petalinux-config -p ptc.linux/ --get-hw-description Mercury_XU5_PE1/`. This will grab the exported .xsa and .bit files from before. In the graphical menu that pops up, select **Image Packaging Configuration - Root filesystem type - EXT4**. (This ensures the image will boot from an ext4 partition on the SD card.) This option should have been read from the `config` file copied earlier.
7. `petalinux-config -p ptc.linux/ -c rootfs` will bring up a graphical menu, and you can confirm that the choices in the `rootfs_config` file are reflected here. (There are several filesystem utilities that will be marked for install based on the file.)
8. Copy `system-user.dtsi` file in this repo to `project-spec/meta-user/recipes-bsp/device-tree/files/`. This ensures that the SD card controller, GEM (gigabit ethernet MAC that the PS uses for the SFP connection), and the I2C device on the PS, all get configured correctly.
9. `petalinux-build -p ptc.linux` will take many tens of minutes to build the first time.
10. `petalinux-package -p ptc.linux/ --boot --u-boot --fsbl ptc.linux/images/linux/zynqmp_fsbl.elf --fpga ptc.linux/images/linux/system.bit -o ptc.linux/images/linux/BOOT.bin` will package the output into a bootable image
11. From the `ptc.linux/` directory, you can test the build by using `petalinux-boot --qemu --u-boot`. The image will boot virtually, and you can login with password `root` (change this in the config menu from step 5). You can test if simple command line utilities -- like `peek` and `i2cdetect` -- were built into the image correctly by typing them at the prompt after logging in. CTRL+A, and then X, will exit a QEMU session.

### Booting software
1. Using your favorite partition editor (e.g. `gparted`), create two partitions on an SDHC micro-SD card: a 256MB FAT32 partition named `BOOT`, and the remainder of the disk should be an EXT4 partition called `ROOT`.
2. Copy the following files from `ptc-linux/images/linux/` to the `BOOT` partition: `BOOT.bin`, `image.ub`, `boot.scr`
3. Copy the file `rootfs.tar.gz` to the `ROOT` partition. `gunzip` and then `tar -xvf` the file to uncompress the entire contents.
4. Install the SD card, and install the Enclustra XU5 module into the PTC. Ensure default jumper settings are as per schematic. Ensure a microUSB cable is attached to the front panel UART connector, and open a connection to the COM port at 115kbaud.
5. Apply 48V to the main power connector, and stop the boot when the message `Hit any key to stop autoboot` appears. This will show the `ZynqMP` prompt.
6. `setenv bootargs root=/dev/mmcblk1p2`
7. `saveenv`
8. `boot` will continue the boot process. A `ptc login:` prompt should appear.


