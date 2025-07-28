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
        #0 reg_rw_in[64*32-1:0] = 0;
    
    //Test Register 1
        //bp_io_en
        #500 reg_rw_in[0 * 32 + 16] = 1'b1;
        #100 reg_rw_in[0 * 32 + 16] = 1'b0;
        //crate_addre_en
        #500 reg_rw_in[0 * 32 + 23] = 1'b1;
        //crate_addre_out
        #500 reg_rw_in[0 * 32 + 31: 0 * 32 + 24] = 7'b0000001;
        #100 reg_rw_in[0 * 32 + 31: 0 * 32 + 24] = 1'b0;
        #100 reg_rw_in[0 * 32 + 23] = 1'b0;
        
    //Test Register 2
        //wib_rx_sel_out
        #500 reg_rw_in[1 * 32 + 2: 1 * 32] = 1'b1;
        #100 reg_rw_in[1 * 32 + 2: 1 * 32] = 1'b0;
        //wib_pe_soc_en
        #500 reg_rw_in[1 * 32 + 3] = 1'b1;
        #100 reg_rw_in[1 * 32 + 3] = 1'b0;
        //sfp2_tx_en_reg
        #500 reg_rw_in[1 * 32 + 8] = 1'b1;
        #100 reg_rw_in[1 * 32 + 8] = 1'b0;
        //sfp2_tx_mux_ovr
        #500 reg_rw_in[1 * 32 + 9] = 1'b1;
        #100 reg_rw_in[1 * 32 + 9] = 1'b0;
        //ep_srst
        #500 reg_rw_in[1 * 32 + 10] = 1'b1;
        #100 reg_rw_in[1 * 32 + 10] = 1'b0;
        //ep_clk_sel
        #500 reg_rw_in[1 * 32 + 11] = 1'b1;
        #100 reg_rw_in[1 * 32 + 11] = 1'b0;
        //mmcm0_rst_n
        #500 reg_rw_in[1 * 32 + 17] = 1'b1;
        #100 reg_rw_in[1 * 32 + 17] = 1'b0;
        
    //Test Register 2-10
        //EN_3V3
        #500 reg_rw_in[2 * 32] = 1'b1;
        #100 reg_rw_in[2 * 32] = 1'b0;
        //EN_2V5
        #500 reg_rw_in[3 * 32] = 1'b1;
        #100 reg_rw_in[3 * 32] = 1'b0;
        //vp12_sync_en
        #500 reg_rw_in[10 * 32 + 6: 10 * 32] = 1'b1;
        #100 reg_rw_in[10 * 32 + 6: 10 * 32] = 1'b0;
        //lvsync_en
        #500 reg_rw_in[10 * 32 + 7] = 1'b1;
        #100 reg_rw_in[10 * 32 + 7] = 1'b0;
    
    //Test Register 11
        //xmc_jtag_en
        #500 reg_rw_in[11 * 32 + 0] = 1'b1;
        #100 reg_rw_in[11 * 32 + 0] = 1'b0;
        //xmc_reset_n
        #500 reg_rw_in[11 * 32 + 8] = 1'b1;
        #100 reg_rw_in[11 * 32 + 8] = 1'b0;
        
    //Test Register 14
        //Initialize register 14 to be 0s
        #0 reg_rw_in[14 * 32 + 31 : 14 * 32] = 32'b0;
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
         //Initialize register to be 0s
        #5000 reg_rw_in[14 * 32 + 31 : 14 * 32] = 32'b0;
        
    //Test Register 15
        //Initialize register 15 to be 0s
        #10 reg_rw_in[15 * 32 + 31 : 15 * 32] = 32'b0;
        //Turn on the enable
        #20 reg_rw_in[15 * 32 + 9] = 1'b1;
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
         //Initialize register to be 0s
        #5000 reg_rw_in[15 * 32 + 31 : 15 * 32] = 32'b0;
        
    //Test Register 16
        //Initialize register 16 to be 0s
        #10 reg_rw_in[16 * 32 + 31 : 16 * 32] = 32'b0;
        //Turn on the enable
        #20 reg_rw_in[16 * 32 + 9] = 1'b1;
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
         //Initialize register to be 0s
        #5000 reg_rw_in[16 * 32 + 31 : 16 * 32] = 32'b0;
        
    //Test Register 17
        //Initialize register 17 to be 0s
        #10 reg_rw_in[17 * 32 + 31 : 17 * 32] = 32'b0;
        //Turn on the enable
        #20 reg_rw_in[17 * 32 + 9] = 1'b1;
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
        
    //Test Register 18        
        //Initialize register 18 to be 0s
        #10 reg_rw_in[18 * 32 + 31 : 18 * 32] = 32'b0;
        //Turn on the enable
        #20 reg_rw_in[18 * 32 + 9] = 1'b1;
       //Set Clock to divide by 2
        #0 reg_rw_in[18 * 32 + 2: 18 * 32] = 3'b001;
        //Reset to initialize
        #0 reg_rw_in[18 * 32 + 8] = 1'b1;
        #20 reg_rw_in[18 * 32 + 8] = 1'b0;
        //Set duty div
        #0 reg_rw_in[18 * 32 + 5: 18 * 32 + 3] = 3'b100;
        //Increase Duty
        #1000 reg_rw_in[18 * 32 + 7] = 1'b1;
        #20 reg_rw_in[18 * 32 + 7] = 1'b0;
        //Reset
        #1000 reg_rw_in[18 * 32 + 8] = 1'b1;
        #20 reg_rw_in[18 * 32 + 8] = 1'b0;
        //Decrease Duty
        #1000 reg_rw_in[18 * 32 + 6] = 1'b1;
        #20 reg_rw_in[18 * 32 + 6] = 1'b0;
        //Reset
        #1000 reg_rw_in[18 * 32 + 8] = 1'b1;
        #20 reg_rw_in[18 * 32 + 8] = 1'b0;
        //Set Clock to divide by 4
        #0 reg_rw_in[18 * 32 + 2: 18 * 32] = 3'b010;
        //Reset
        #1000 reg_rw_in[18 * 32 + 8] = 1'b1;
        #20 reg_rw_in[18 * 32 + 8] = 1'b0;
         //Initialize regi5ster to be 0s
        #5000 reg_rw_in[18 * 32 + 31 : 18 * 32] = 32'b0;
        
    //Test Register 19
        //Initialize register 19 to be 0s
        #10 reg_rw_in[19 * 32 + 31 : 17 * 32] = 32'b0;
        //Turn on the enable
        #20 reg_rw_in[19 * 32 + 9] = 1'b1;
       //Set Clock to divide by 2
        #0 reg_rw_in[19 * 32 + 2: 19 * 32] = 3'b001;
        //Reset to initialize
        #0 reg_rw_in[19 * 32 + 8] = 1'b1;
        #20 reg_rw_in[19 * 32 + 8] = 1'b0;
        //Set duty div
        #0 reg_rw_in[19 * 32 + 5: 19 * 32 + 3] = 3'b100;
        //Increase Duty
        #1000 reg_rw_in[19 * 32 + 7] = 1'b1;
        #20 reg_rw_in[19 * 32 + 7] = 1'b0;
        //Reset
        #1000 reg_rw_in[19 * 32 + 8] = 1'b1;
        #20 reg_rw_in[19 * 32 + 8] = 1'b0;
        //Decrease Duty
        #1000 reg_rw_in[19 * 32 + 6] = 1'b1;
        #20 reg_rw_in[19 * 32 + 6] = 1'b0;
        //Reset
        #1000 reg_rw_in[19 * 32 + 8] = 1'b1;
        #20 reg_rw_in[19 * 32 + 8] = 1'b0;
        //Set Clock to divide by 4
        #0 reg_rw_in[19 * 32 + 2: 19 * 32] = 3'b010;
        //Reset
        #1000 reg_rw_in[19 * 32 + 8] = 1'b1;
        #20 reg_rw_in[19 * 32 + 8] = 1'b0;
         //Initialize register to be 0s
        #5000 reg_rw_in[19 * 32 + 31 : 19 * 32] = 32'b0;
        
        #10000;
        $finish;
    end
    

    
endmodule
