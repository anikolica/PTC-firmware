module clock_div(
        input CLK,
        input RST,
        input [2:0] div,
        output reg enable_tick
);

        reg [2:0] counter = 0;
        //
        //Invert the output clock when the counter equals the clock division
        always @(posedge CLK, posedge RST)
        begin
                if(RST == 1'b1) begin
                        enable_tick <= 1'b0;
                        counter <= 0;
                end else if (div != 0 && counter == div - 1) begin
                        enable_tick <= 1'b1;
                        counter <= 1'b0;
                end else begin
                        counter <= counter + 1;
                        enable_tick <= 1'b0;
                end
        end
endmodule

