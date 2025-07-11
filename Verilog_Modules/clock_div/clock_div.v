module clock_div(
	input CLK,
	input RST,
	input [2:0] div,
	output reg clk_div
);

	reg [7:0] counter;
	reg compare;

	//Implement counter and compare it to the chosen clock division
	always @(posedge CLK)
	begin
		if (RST == 1'b1)
			compare <= 1'b0;
		else if (counter == div - 1)
			counter <= 1'b0;
		else
			counter <= counter + 1;
	end

	//Invert the output clock when the counter equals the clock division
	always @(posedge CLK, posedge RST)
	begin
		if(RST == 1'b1)
			clk_div <= 1'b0;
		else if (counter == div - 1)
			clk_div <= !clk_div;
	end
endmodule

