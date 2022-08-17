# Power and Timing Card v4 (PTCv4) Firmware

## Maintainer

Adrian Nikolica (nikolica@hep.upenn.edu)

## Authors

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
| Vivado/ | Contains the recreated Vivado project. Does not need to be source controlled. |
| src/ | Verilog source files, pin/timing constraint files |
| scripts/ | Build scripts |


### Git Instructions

#### Basic workflow:
1. Git pull changes from remote.
2. Open vivado from reference_design directory.
3. In tcl console, run `source ./scripts/create_project.tcl`
4. Work on project using IDE.
5. Go to **File - Project - Write Tcl**. Set the output file to `./create_project.tcl`, and uncheck *Copy sources to new project*.
6. Commit all changes and push.

