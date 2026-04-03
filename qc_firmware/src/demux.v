module demux_1_8(
		 input [2:0] sel,
		 input	    i,
		 input      clk,
		 output reg y0, y1, y2, y3, y4, y5, y6, y7);

   always @(posedge clk) begin
      case(sel)
	3'h0: {y0,y1,y2,y3,y4,y5,y6,y7} = {i, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
	3'h1: {y0,y1,y2,y3,y4,y5,y6,y7} = {1'b0, i, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
	3'h2: {y0,y1,y2,y3,y4,y5,y6,y7} = {1'b0, 1'b0, i, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
	3'h3: {y0,y1,y2,y3,y4,y5,y6,y7} = {1'b0, 1'b0, 1'b0, i, 1'b0, 1'b0, 1'b0, 1'b0};
	3'h4: {y0,y1,y2,y3,y4,y5,y6,y7} = {1'b0, 1'b0, 1'b0, 1'b0, i, 1'b0, 1'b0, 1'b0};
	3'h5: {y0,y1,y2,y3,y4,y5,y6,y7} = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, i, 1'b0, 1'b0};
	3'h6: {y0,y1,y2,y3,y4,y5,y6,y7} = 8'h0;
	3'h7: {y0,y1,y2,y3,y4,y5,y6,y7} = 8'h0;
	
      endcase // case (sel)
   end // always @ (*)
endmodule
