module clock_div(
        input CLK,
        input RST,
        input [2:0] div,
        output reg enable_tick
);

        reg [4:0] counter;
        //
        //Invert the output clock when the counter equals the clock division
        always @(posedge CLK, posedge RST)
        begin
                if(RST == 1'b1) begin
                        enable_tick <= 1'b0;
                        counter <= 1'b0;
                end else if (counter == div - 1) begin
                        enable_tick <= 1'b1;
                        //counter <= 1'b0;
                end else if(counter == 0) begin
                        counter <= counter + 1;
                        enable_tick <= 1'b0;
  
                end else begin
                        counter <= counter + 1;
                end
        end
endmodule

