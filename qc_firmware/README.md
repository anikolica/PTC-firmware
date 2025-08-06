# PTC QC Firmware
### Maintainer
- TBD

### Contributors
- Eliot Keener (eliotk@iastate.edu)
- Adrian Nikolica
- Godwin Mayers

## Description
This repository is meant as a subset of firmware specifically designed for the QC project of PTCv4. Using the firmware from the reference_design directory as a base, the firmware was edited for the QC board including implementations for Pulse Width Modulation (PWM), clock dividers, and a 8 to 1 (really 6 to 1) decoder that interfaces with the hardware clock mux. A more detailed description of the clock divider is provided below.

## Clock Divider Frequencies
The written clock divider uses an 3 bit counter, so divisions up to 7 are possible. For a nominal 50 MHz clock, the output of the divider will look like:

| Div     |  Frequency  | Period  |
| ------- | ----------- | --------|
| 1       | 25MHz       | 40ns    |
| 2       | 12.5MHz     | 80ns    |
| 3       | ~8.3MHz     | 120ns    |
| 4       | 6.25MHz     | 160ns    |
| 5       | 5MHz        | 200ns    |
| 6       | ~4.17MHz    | 240ns    |
| 7       | ~3.57MHz    | 280ns    |

It is important to note that the PWM module uses the output of this clock divider almost as if it were the main clock. By virtue of PWM, this means the effective output will be divided again, and the PWM module was also written with a 3 bit counter.

## Directory Structure
| Directory    |  Purpose  | 
| ------- | ----------- | 
| src                        | Verilog source files, constraint files for the project       | 
| ip_repo                    | User-generate IP                                             | 
| sim                        | Simple Verilog testbench       | 
| scripts                    | Build Scripts       | 
| scripts/test_scripts       | Tests written to run the QC tests       | 
| Verilog_Modules            | Verilog modules and testbenches to prepare for firmware implementation       | 


## RW Register Map
Because the FPGA runs petalinux, you can use peek and poke to view its registers. Unlike i2cget and i2cset, the commands will look like `peek [addr]` and `poke [addr] [data]`, so you do not need to determine the i2c address of the FPGA.

| reg no.         | bits    | name            | description                                              |            |     
| --------------- | ------- | --------------- | -------------------------------------------------------- | ---------- | 
| 0               | [16]    | bp_io_en        |                                                          |            |      
| 0               | [23]    | crate_addre_en  |                                                          |            |      
| 0               | [31:24] | crate_addr_out  |                                                          |            |      
|                 |         |                 |                                                          |            |          
| 1               | [10]    | ep_srst         |                                                          |            |         
| 1               | [11]    | ep_clk_sel      |                                                          |            |         
| 1               | [17]    | mmcm0_rst_n     |                                                          |            |         
|                 |         |                 |                                                          |            |         
| 2               | [0]     | EN_3V3          |                                                          |            |         
| 3               | [0]     | EN_2V5          |                                                          |            |         
| 10              | [6:0]   | vp12_sync_en    |                                                          |            |         
| 10              | [7]     | lvsync_en       |                                                          |            |         
|                 |         |                 |                                                          |            |         
| 14              | [9]     | PWM_EN0         | Allows the PWM module to produce an output               | enable     |         
| 14              | [8]     | PWM_RST0        | Sets the duty cycle to what is set in bits 5:3           | rst        |         
| 14              | [7]     | PWM_INC0        | Increases the duty cycle by 12.5%                        | inc        |         
| 14              | [6]     | PWM_DEC0        | Decreases the duty cycle by 12.5%                        | dec        |         
| 14              | [5:3]   | PWM_DUTY0       | Sets the duty cycle to this value when reset is asserted | duty cycle |         
| 14              | [2:0]   | PWM_DIV0        | Clock divider value                                      | clk divide |         
|                 |         |                 |                                                          |            |         
| 15              | [9]     | PWM_EN1         | Allows the PWM module to produce an output               | enable     |         
| 15              | [8]     | PWM_RST1        | Sets the duty cycle to what is set in bits 5:3           | rst        |  
| 15              | [7]     | PWM_INC1        | Increases the duty cycle by 12.5%                        | inc        |  
| 15              | [6]     | PWM_DEC1        | Decreases the duty cycle by 12.5%                        | dec        |  
| 15              | [5:3]   | PWM_DUTY1       | Sets the duty cycle to this value when reset is asserted | duty cycle |  
| 15              | [2:0]   | PWM_DIV1        | Clock divider value                                      | clk divide |  
|                 |         |                 |                                                          |            |  
| 16              | [9]     | PWM_EN2         | Allows the PWM module to produce an output               | enable     |  
| 16              | [8]     | PWM_RST2        | Sets the duty cycle to what is set in bits 5:3           | rst        |  
| 16              | [7]     | PWM_INC2        | Increases the duty cycle by 12.5%                        | inc        |  
| 16              | [6]     | PWM_DEC2        | Decreases the duty cycle by 12.5%                        | dec        |  
| 16              | [5:3]   | PWM_DUTY2       | Sets the duty cycle to this value when reset is asserted | duty cycle |  
| 16              | [2:0]   | PWM_DIV2        | Clock divider value                                      | clk divide |  
|                 |         |                 |                                                          |            |  
| 17              | [9]     | PWM_EN3         | Allows the PWM module to produce an output               | enable     |  
| 17              | [8]     | PWM_RST3        | Sets the duty cycle to what is set in bits 5:3           | rst        |  
| 17              | [7]     | PWM_INC3        | Increases the duty cycle by 12.5%                        | inc        |  
| 17              | [6]     | PWM_DEC3        | Decreases the duty cycle by 12.5%                        | dec        |  
| 17              | [5:3]   | PWM_DUTY3       | Sets the duty cycle to this value when reset is asserted | duty cycle |  
| 17              | [2:0]   | PWM_DIV3        | Clock divider value                                      | clk divide |  
|                 |         |                 |                                                          |            |  
| 18              | [9]     | PWM_EN4         | Allows the PWM module to produce an output               | enable     |  
| 18              | [8]     | PWM_RST4        | Sets the duty cycle to what is set in bits 5:3           | rst        |  
| 18              | [7]     | PWM_INC4        | Increases the duty cycle by 12.5%                        | inc        |  
| 18              | [6]     | PWM_DEC4        | Decreases the duty cycle by 12.5%                        | dec        |  
| 18              | [5:3]   | PWM_DUTY4       | Sets the duty cycle to this value when reset is asserted | duty cycle |  
| 18              | [2:0]   | PWM_DIV4        | Clock divider value                                      | clk divide |  
|                 |         |                 |                                                          |            |  
| 19              | [9]     | PWM_EN5         | Allows the PWM module to produce an output               | enable     |  
| 19              | [8]     | PWM_RST5        | Sets the duty cycle to what is set in bits 5:3           | rst        |  
| 19              | [7]     | PWM_INC5        | Increases the duty cycle by 12.5%                        | inc        |  
| 19              | [6]     | PWM_DEC5        | Decreases the duty cycle by 12.5%                        | dec        |  
| 19              | [5:3]   | PWM_DUTY5       | Sets the duty cycle to this value when reset is asserted | duty cycle |  
| 19              | [2:0]   | PWM_DIV5        | Clock divider value                                      | clk divide |  

# RO Register Map
| reg no.         | bits    | name            | description                                              | 
| --------------- | ------- | --------------- | -------------------------------------------------------- | 
| 65               | [27:24] | timing_stat     |                                                          | 
| 65               | [28]    | timing_lock     |                                                          | 
|                 |         |                 |                                                          | 
| 66               | [6:0]   | VP12_IV_ALERT   | low = alert                                              | 
| 66               | [8]     | VP2V5_ALER      | low = alert                                              | 
| 66               | [9]     | VP3V3_ALERT     | low = alert                                              | 
|                 |         |                 |                                                          | 
| 126              | [0]     | mmcm0_locked    | Test                                                     | 
|                 |         |                 |                                                          | 
| 127              | [31:0]  | 32'hdeadbeef    | Test                                                     | 
