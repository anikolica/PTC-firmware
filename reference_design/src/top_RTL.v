`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2022 04:23:09 PM
// Design Name: 
// Module Name: top_RTL
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


module top_RTL(
    input               clk_axi,
    input               clk_ext,
    input   [64*32-1:0] reg_rw_in,
    input               timing_data_in,
    input   [7:0]       dip_mac_addr_in,
    input   [7:0]       dip_crate_addr_in,
    input   [7:0]       uC_data_in,
    
    output reg             timing_ok_led_out,
    output reg [5:0]       wib_en_out,
    output reg [5:0]       wib_on_led_out,
    output reg             local_2v5_en_out,
    output reg             local_3v3_en_out,
    output reg             timing_clk_sel_out,
    output reg [7:0]       uC_data_out,
    output reg [64*32-1:0] reg_ro_out          
    );
    
    // test code ...
    wire    [64*32-1:0] net0;
    wire                net1;
    wire    [7:0]       net2, net3, net4;
    
    IBUF ibuf0 (.I(reg_rw_in), .O(net0));
    IBUF ibuf1 (.I(timing_data_in), .O(net1));
    IBUF ibuf2 (.I(dip_mac_addr_in), .O(net2));
    IBUF ibuf3 (.I(dip_crate_addr_i), .O(net3));
    IBUF ibuf4 (.I(uC_data_in), .O(net4));
    
    always @ (clk_axi) begin
        uC_data_out = ~uC_data_out;
    end
    
endmodule
