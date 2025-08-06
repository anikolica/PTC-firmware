`timescale 10ns / 1ns
`include "PWM_main.v"

module PWM_tb;
	reg clk;
	wire PWM_out;

	parameter HALF_CYCLE = 5;

	PWM_main PWM_inst(
		.clk(clk),
		.PWM_out(PWM_out)
	);

	always
	begin
		#HALF_CYCLE clk = ~clk;
	end

	initial begin 
		$dumpfile("PWM.vcd");
		$dumpvars(0, clk, PWM_out, PWM_inst.duty_cycle, PWM_inst.stepper_counter);
		clk=1'b0;
		PWM_inst.counter_inst.counter = 4'b0;
		PWM_inst.stepper_inst.step = 12'b0;

		#1000000;
		$finish;
	end
endmodule
