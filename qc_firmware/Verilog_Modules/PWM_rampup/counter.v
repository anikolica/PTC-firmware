module counter(
	input clk,
	output reg [3:0] counter
);

	always @(posedge clk)
		counter <= counter + 1'b1;
endmodule
