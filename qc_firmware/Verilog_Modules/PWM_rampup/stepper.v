module stepper(
	input clk,
	output reg [11:0] step
);

	always @(posedge clk)
		step <= step + 1'b1;
endmodule
