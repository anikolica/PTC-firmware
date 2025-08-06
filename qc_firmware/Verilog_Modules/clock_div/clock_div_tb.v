`timescale 1ns / 1ps
`include "clock_div.v"

module clock_div_tb;
	reg clk;
	reg rst;
	reg [2:0] div;
	wire clk_div;

	//Will generate a 50MHz Clock
	parameter HALF_CYCLE = 10;

	//Instantiate clock divider
	clock_div clock_div_inst(
		.CLK(clk),
		.RST(rst),
		.div(div),
		.clk_div(clk_div)
		);


	initial begin
		$dumpfile("clock_div.vcd");
		$dumpvars(0, clk, clk_div, clock_div_inst.RST, clock_div_inst.div);
		//Initialize key values
		clk = 1'b0;
		clock_div_inst.counter = 8'b0;
		rst = 1'b1;
		#1
		rst = 1'b0;
		//Div by 2
		div = 3'd1;
		#5000;
		rst = 1'b1;
		#100;
		rst = 1'b0;
		//Div by 4
		div = 3'd2;
		#5000;
		//Div by 8
		div = 3'd4;
		#5000;
		$finish;
	end

	always
	begin
		#HALF_CYCLE clk = !clk;
	end

endmodule
