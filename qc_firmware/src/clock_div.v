module clock_div(
	input CLK,
	input RST,
	input [2:0] div,
	output reg enable_tick
);

	reg [7:0] counter;

	//Implement counter and compare it to the chosen clock division
	always @(posedge CLK, posedge RST)
	begin
		if (RST == 1'b1) begin
			counter <= 1'b0;
			enable_tick <= 1'b0;
		end 
		else if (counter == div - 1) begin
			counter <= 1'b0;
			enable_tick <= 1'b1;
		end 
		else begin
			counter <= counter + 1;
			enable_tick <= 1'b0;
		end
	end

//	//Invert the output clock when the counter equals the clock division
//	always @(posedge CLK, posedge RST)
//	begin
//		if(RST == 1'b1)
//			clk_div <= 1'b0;
//		else if (counter == div - 1)
//			clk_div <= !clk_div;
//		else
//		    clk_div <= clk_div;
//	end
endmodule

