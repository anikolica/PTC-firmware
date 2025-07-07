`timescale 10ns / 1ns
`include "PWM_main.v"


module PWM_tb;
	reg clk;
	reg reset;
	reg duty_inc;
	reg duty_dec;
	wire PWM_out;


	parameter HALF_CYCLE = 5; //Define the half period of the clock cycle
	parameter CYCLE = 10; //Full clock cycle
	parameter PAUSE = CYCLE * 100; //A prolonged pause to observe changes

	//Instantiate the PWM generator
	PWM_main PWM_inst(
		.clk(clk),
		.duty_inc(duty_inc),
		.duty_dec(duty_dec),
		.PWM_out(PWM_out)
	);

	always
	begin
		forever #HALF_CYCLE clk = !clk; //Implements a clock at the defined frequency
	end

	initial begin //Initialize key registers
		$dumpfile("PWM.vcd");
		$dumpvars(0, clk, PWM_out, duty_inc, duty_dec, PWM_inst.duty_cycle);
		clk=1'b0;
		PWM_inst.counter_inst.counter = 8'b0;

		duty_inc = 0;
		duty_dec = 0;
		#PAUSE
		duty_inc = 1;
		#CYCLE	
		duty_inc = 0;
		#PAUSE
		duty_inc = 1;
		#CYCLE
		duty_inc = 0;
		#PAUSE
                duty_inc = 1;
		#CYCLE
		duty_inc = 0;
		#PAUSE
	        duty_dec = 1;
		#CYCLE
		duty_dec = 0;
		#PAUSE
		duty_dec = 1;
		#CYCLE
		duty_dec = 0;
		#PAUSE
		duty_dec = 1;
		#CYCLE
		duty_dec = 0;
		#PAUSE
		duty_dec = 1;
		#CYCLE
		duty_dec = 0;
		#PAUSE
		$finish;
	end	
endmodule
