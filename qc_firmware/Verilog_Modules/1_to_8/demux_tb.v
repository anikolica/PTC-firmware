`include "demux.v"
`timescale 1ns / 1ps

module demux_tb(
);
 	reg [2:0] sel;
	reg i;
	reg clk;
	wire y0, y1, y2, y3, y4, y5, y6;
	
	parameter HALF_CYCLE = 50;
	parameter CYCLE = 100;
	parameter PAUSE = 5 * CYCLE;

	demux_1_8 demux_inst(
		.sel(sel),
		.i(i),
		.clk(clk),
		.y0(y0),
		.y1(y1),
		.y2(y2),
		.y3(y3),
		.y4(y4),
		.y5(y5),
		.y6(y6)
	);

	always
		begin
			forever #HALF_CYCLE clk = !clk;
		end
	
	initial begin
		$dumpfile("demux.vcd");
		$dumpvars(0, sel, i, clk, y0, y1, y2, y3, y4, y5, y6);
		clk = 1'b0;
		i = 1'b1;
		#PAUSE

		sel = 3'h0;
		#PAUSE;

		sel = 3'h1;
		#PAUSE;

		sel = 3'h2;
		#PAUSE;

		sel = 3'h3;
		#PAUSE;

		sel = 3'h4;
		#PAUSE;

		sel = 3'h5;
		#PAUSE;

		sel = 3'h6;
		#PAUSE;
		$finish;

	end
endmodule

