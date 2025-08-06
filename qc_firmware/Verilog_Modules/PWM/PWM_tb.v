`timescale 1ps / 1ps
`include "PWM_main.v"


module PWM_tb;
	reg clk;
	reg reset;
	reg [7:0] duty_cycle;
	wire PWM_out;


	parameter CYCLE = 200000; //Define the period of the clock cycle

	PWM_main PWM_inst(
		.clk(clk),
		.reset(reset),
		.duty_cycle(duty_cycle),
		.PWM_out(PWM_out)
	);

	initial begin //Initialize key registers
		$dumpfile("PWM.vcd");
		$dumpvars(0, clk, PWM_out);
		clk=1'b0;
		duty_cycle = 8'b10000000;
		PWM_inst.counter_inst.counter = 8'b0;
	end

	always
	begin
		#CYCLE clk = !clk; //Implements a clock at the defined frequency
	end		

endmodule
