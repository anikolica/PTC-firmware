`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2025 11:26:52 AM
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb(

    );
    
    reg clk = 1'b0;
    reg [64*32-1:0] reg_rw_in;
    
    wire PWM0;
    wire PWM1;
    wire PWM2;
    wire PWM3;
    wire PWM4;
    wire PWM5;
    
    
    top_RTL top(
    .clk_axi(clk),
    .reg_rw_in(reg_rw_in),
    .PWM0(PWM0),
    .PWM1(PWM1),
    .PWM2(PWM2),
    .PWM3(PWM3),
    .PWM4(PWM4),
    .PWM5(PWM5)
    );
    
    // *** TESTS ***
    
    always #10 clk = ~clk;
 
    //assign PWM0 = 1'b1;
    
    initial begin
        //Initialize register 13 to be 0s
        #0 reg_rw_in[12 * 32 + 31 : 12 * 32] = 32'b0;
        //Turn on the enable
        #20 reg_rw_in[12 * 32 + 9] = 1'b1;
       //Set Clock to divide by 2
        #0 reg_rw_in[12 * 32 + 2: 12 * 32] = 3'b001;
        //Reset to initialize
        #0 reg_rw_in[12 * 32 + 8] = 1'b1;
        #20 reg_rw_in[12 * 32 + 8] = 1'b0;
        //Set duty div
        #0 reg_rw_in[12 * 32 + 5: 12 * 32 + 3] = 3'b100;
        //Increase Duty
        #1000 reg_rw_in[12 * 32 + 7] = 1'b1;
        #20 reg_rw_in[12 * 32 + 7] = 1'b0;
        //Reset
        #1000 reg_rw_in[12 * 32 + 8] = 1'b1;
        #20 reg_rw_in[12 * 32 + 8] = 1'b0;
        //Decrease Duty
        #1000 reg_rw_in[12 * 32 + 6] = 1'b1;
        #20 reg_rw_in[12 * 32 + 6] = 1'b0;
        //Reset
        #1000 reg_rw_in[12 * 32 + 8] = 1'b1;
        #20 reg_rw_in[12 * 32 + 8] = 1'b0;
        //Set Clock to divide by 4
        #0 reg_rw_in[12 * 32 + 2: 12 * 32] = 3'b010;        
         //Initialize register to be 0s
        #5000 reg_rw_in[12 * 32 + 31 : 12 * 32] = 32'b0;
        
        //Initialize register 14 to be 0s
        #10 reg_rw_in[13 * 32 + 31 : 13 * 32] = 32'b0;
        //Turn on the enable
        #20 reg_rw_in[13 * 32 + 9] = 1'b1;
       //Set Clock to divide by 2
        #0 reg_rw_in[13 * 32 + 2: 13 * 32] = 3'b001;
        //Reset to initialize
        #0 reg_rw_in[13 * 32 + 8] = 1'b1;
        #20 reg_rw_in[13 * 32 + 8] = 1'b0;
        //Set duty div
        #0 reg_rw_in[13 * 32 + 5: 13 * 32 + 3] = 3'b100;
        //Increase Duty
        #1000 reg_rw_in[13 * 32 + 7] = 1'b1;
        #20 reg_rw_in[13 * 32 + 7] = 1'b0;
        //Reset
        #1000 reg_rw_in[13 * 32 + 8] = 1'b1;
        #20 reg_rw_in[13 * 32 + 8] = 1'b0;
        //Decrease Duty
        #1000 reg_rw_in[13 * 32 + 6] = 1'b1;
        #20 reg_rw_in[13 * 32 + 6] = 1'b0;
        //Reset
        #1000 reg_rw_in[13 * 32 + 8] = 1'b1;
        #20 reg_rw_in[13 * 32 + 8] = 1'b0;
        //Set Clock to divide by 4
        #0 reg_rw_in[13 * 32 + 2: 13 * 32] = 3'b010;
         //Initialize register to be 0s
        #5000 reg_rw_in[13 * 32 + 31 : 13 * 32] = 32'b0;
        
        //Initialize register 15 to be 0s
        #10 reg_rw_in[14 * 32 + 31 : 14 * 32] = 32'b0;
        //Turn on the enable
        #20 reg_rw_in[14 * 32 + 9] = 1'b1;
       //Set Clock to divide by 2
        #0 reg_rw_in[14 * 32 + 2: 14 * 32] = 3'b001;
        //Reset to initialize
        #0 reg_rw_in[14 * 32 + 8] = 1'b1;
        #20 reg_rw_in[14 * 32 + 8] = 1'b0;
        //Set duty div
        #0 reg_rw_in[14 * 32 + 5: 14 * 32 + 3] = 3'b100;
        //Increase Duty
        #1000 reg_rw_in[14 * 32 + 7] = 1'b1;
        #20 reg_rw_in[14 * 32 + 7] = 1'b0;
        //Reset
        #1000 reg_rw_in[14 * 32 + 8] = 1'b1;
        #20 reg_rw_in[14 * 32 + 8] = 1'b0;
        //Decrease Duty
        #1000 reg_rw_in[14 * 32 + 6] = 1'b1;
        #20 reg_rw_in[14 * 32 + 6] = 1'b0;
        //Reset
        #1000 reg_rw_in[14 * 32 + 8] = 1'b1;
        #20 reg_rw_in[14 * 32 + 8] = 1'b0;
        //Set Clock to divide by 4
        #0 reg_rw_in[14 * 32 + 2: 14 * 32] = 3'b010;
        //Reset
        #1000 reg_rw_in[14 * 32 + 8] = 1'b1;
        #20 reg_rw_in[14 * 32 + 8] = 1'b0;
         //Initialize register to be 0s
        #5000 reg_rw_in[14 * 32 + 31 : 14 * 32] = 32'b0;
        
        //Initialize register 16 to be 0s
        #10 reg_rw_in[15 * 32 + 31 : 15 * 32] = 32'b0;
        //Turn on the enable
        #20 reg_rw_in[15* 32 + 9] = 1'b1;
       //Set Clock to divide by 2
        #0 reg_rw_in[15 * 32 + 2: 15 * 32] = 3'b001;
        //Reset to initialize
        #0 reg_rw_in[15 * 32 + 8] = 1'b1;
        #20 reg_rw_in[15 * 32 + 8] = 1'b0;
        //Set duty div
        #0 reg_rw_in[15 * 32 + 5: 15 * 32 + 3] = 3'b100;
        //Increase Duty
        #1000 reg_rw_in[15 * 32 + 7] = 1'b1;
        #20 reg_rw_in[15 * 32 + 7] = 1'b0;
        //Reset
        #1000 reg_rw_in[15 * 32 + 8] = 1'b1;
        #20 reg_rw_in[15 * 32 + 8] = 1'b0;
        //Decrease Duty
        #1000 reg_rw_in[15 * 32 + 6] = 1'b1;
        #20 reg_rw_in[15 * 32 + 6] = 1'b0;
        //Reset
        #1000 reg_rw_in[15 * 32 + 8] = 1'b1;
        #20 reg_rw_in[15 * 32 + 8] = 1'b0;
        //Set Clock to divide by 4
        #0 reg_rw_in[15 * 32 + 2: 15 * 32] = 3'b010;
        //Reset
        #1000 reg_rw_in[15 * 32 + 8] = 1'b1;
        #20 reg_rw_in[15 * 32 + 8] = 1'b0;
         //Initialize regi5ster to be 0s
        #5000 reg_rw_in[15 * 32 + 31 : 15 * 32] = 32'b0;
        
        //Initialize register 17 to be 0s
        #10 reg_rw_in[16 * 32 + 31 : 16 * 32] = 32'b0;
        //Turn on the enable
        #20 reg_rw_in[16* 32 + 9] = 1'b1;
       //Set Clock to divide by 2
        #0 reg_rw_in[16 * 32 + 2: 16 * 32] = 3'b001;
        //Reset to initialize
        #0 reg_rw_in[16 * 32 + 8] = 1'b1;
        #20 reg_rw_in[16 * 32 + 8] = 1'b0;
        //Set duty div
        #0 reg_rw_in[16 * 32 + 5: 16 * 32 + 3] = 3'b100;
        //Increase Duty
        #1000 reg_rw_in[16 * 32 + 7] = 1'b1;
        #20 reg_rw_in[16 * 32 + 7] = 1'b0;
        //Reset
        #1000 reg_rw_in[16 * 32 + 8] = 1'b1;
        #20 reg_rw_in[16 * 32 + 8] = 1'b0;
        //Decrease Duty
        #1000 reg_rw_in[16 * 32 + 6] = 1'b1;
        #20 reg_rw_in[16 * 32 + 6] = 1'b0;
        //Reset
        #1000 reg_rw_in[16 * 32 + 8] = 1'b1;
        #20 reg_rw_in[16 * 32 + 8] = 1'b0;
        //Set Clock to divide by 4
        #0 reg_rw_in[16 * 32 + 2: 16 * 32] = 3'b010;
        //Reset
        #1000 reg_rw_in[16 * 32 + 8] = 1'b1;
        #20 reg_rw_in[16 * 32 + 8] = 1'b0;
         //Initialize regi5ster to be 0s
        #5000 reg_rw_in[16 * 32 + 31 : 16 * 32] = 32'b0;
        
        //Initialize register 18 to be 0s
        #10 reg_rw_in[17 * 32 + 31 : 17 * 32] = 32'b0;
        //Turn on the enable
        #20 reg_rw_in[17* 32 + 9] = 1'b1;
       //Set Clock to divide by 2
        #0 reg_rw_in[17 * 32 + 2: 17 * 32] = 3'b001;
        //Reset to initialize
        #0 reg_rw_in[17 * 32 + 8] = 1'b1;
        #20 reg_rw_in[17 * 32 + 8] = 1'b0;
        //Set duty div
        #0 reg_rw_in[17 * 32 + 5: 17 * 32 + 3] = 3'b100;
        //Increase Duty
        #1000 reg_rw_in[17 * 32 + 7] = 1'b1;
        #20 reg_rw_in[17 * 32 + 7] = 1'b0;
        //Reset
        #1000 reg_rw_in[17 * 32 + 8] = 1'b1;
        #20 reg_rw_in[17 * 32 + 8] = 1'b0;
        //Decrease Duty
        #1000 reg_rw_in[17 * 32 + 6] = 1'b1;
        #20 reg_rw_in[17 * 32 + 6] = 1'b0;
        //Reset
        #1000 reg_rw_in[17 * 32 + 8] = 1'b1;
        #20 reg_rw_in[17 * 32 + 8] = 1'b0;
        //Set Clock to divide by 4
        #0 reg_rw_in[17 * 32 + 2: 17 * 32] = 3'b010;
        //Reset
        #1000 reg_rw_in[17 * 32 + 8] = 1'b1;
        #20 reg_rw_in[17 * 32 + 8] = 1'b0;
         //Initialize register to be 0s
        #5000 reg_rw_in[17 * 32 + 31 : 17 * 32] = 32'b0;
        
        #10000;
        $finish;
    end
    

    
endmodule
