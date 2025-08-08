`timescale 1ns / 1ps
`include "PWM.v"


module PWM_tb;
	reg clk;
	reg rst;
	reg en;
	reg duty_inc;
	reg duty_dec;
	reg [2:0] duty_cycle;
	reg [2:0] div;
	wire PWM_out;


	parameter HALF_CYCLE = 50; //Define the half period of the clock cycle
	parameter CYCLE = 100; //Full clock cycle
	parameter PAUSE = CYCLE * 100; //A prolonged pause to observe changes

	//Instantiate the PWM generator
	PWM PWM_inst(
		.clk(clk),
		.en(en),
		.rst(rst),
		.duty_inc(duty_inc),
		.duty_dec(duty_dec),
		.duty(duty_cycle),
		.div(div),
		.PWM_out(PWM_out)
	);

	always
	begin
		forever #HALF_CYCLE clk = !clk; //Implements a clock at the defined frequency
	end

	initial begin //Initialize key registers
		$dumpfile("PWM.vcd");
		$dumpvars(0, clk, PWM_out, duty_inc, duty_dec, rst, PWM_inst.duty_changed, PWM_inst.duty_cycle,  PWM_inst.duty);
		clk=1'b0;
		en = 1'b1;
		div = 3'b001;
		PWM_inst.clock_div_inst.counter = 0;
		rst = 1'b1;
		#CYCLE
		rst = 1'b0;
		#CYCLE
		duty_cycle = 3'b100;
		duty_inc = 0;
		duty_dec = 0;
		#PAUSE
		duty_inc = 1;
		#CYCLE
		#CYCLE
	       	duty_inc = 0;
		#PAUSE
		duty_inc = 1;
		#CYCLE
		#CYCLE
	       	duty_inc = 0;
		#PAUSE
		duty_inc = 1;
		#CYCLE
		#CYCLE
	       	duty_inc = 0;
		rst = 1'b1;
		#CYCLE
		#CYCLE
		rst = 1'b0;
		#PAUSE
		duty_dec = 1;
		#CYCLE
		#CYCLE
	       	duty_dec = 0;
		#PAUSE
		duty_dec = 1;
		#CYCLE
		#CYCLE
	       	duty_dec = 0;
		#PAUSE


			
		#PAUSE
		$finish;
	end	
endmodule
