# Verilog Modules Directory

## Contributors
* Eliot Keener

## Description
This directory serves as a test area to write and check verilog modules befor they are officially implemented into the vivado project. As of today (7 July 2025), there are three PWM modules being held here.

### [PWM](https://github.com/anikolica/PTC-firmware/tree/QC_DEV/Verilog_Modules/PWM)
* Contains a PWM module that can and will be held at a hard-coded duty cycle.

### [PWM_inc_dec](https://github.com/anikolica/PTC-firmware/tree/QC_DEV/Verilog_Modules/PWM_inc_dec)
* Contains a PWM module that will accept increase and decrease inputs that will change the duty cycle by 10%.

### [PWM_rampup](https://github.com/anikolica/PTC-firmware/tree/QC_DEV/Verilog_Modules/PWM_rampup)
* Contains a PWM module that starts at a duty cycle of 0% and every 4096 clock cycles will increase by 10%.


## Testing these modules
Each module will have a main, and a tb verilog file. To test the verilog modules, I used this process.

1. Use Icarus verilog to compile the test bench (tb file).
2. Run the output executable which produces a .vcd file.
3. Use gtkwave to view the .vcd file and check that it works as expected.

## Documentation for software
* [Icarus Verilog](https://steveicarus.github.io/iverilog/)
* [GTKWave](https://gtkwave.sourceforge.net/)
