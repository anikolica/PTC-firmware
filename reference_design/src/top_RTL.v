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
    input   [64*32-1:0] reg_rw_in,
    input               timing_data_in,
    input   [7:0]       dip_crate_addr_in,
    //input   [7:0]       uC_data_in,
    
    output reg          XMC_JTAG_TMS,
    output reg          XMC_JTAG_TCK,
    input               XMC_JTAG_TDO,
    output reg          XMC_JTAG_RST,
    
    output reg          SOC_I2C_SW_RST,
    
    input               SFP0_LOS,
    input               SFP0_TX_FAULT,
    input               SFP1_LOS,
    input               SFP1_TX_FAULT,
    input               SFP2_LOS,
    input               SFP2_TX_FAULT,
    
    output reg          SFP2_TX_DISABLE,
    output reg          WIB_CLK_SEL,
    input               BP_IO0,
    input               BP_IO1,
    input               BP_IO2,
    input               BP_IO3,
    input               BP_IO4,
    input               BP_IO5,
    output reg          BP_IO_OE,
    output reg          WIB_TX_BACK,
    output reg          WIB_PE_SEL,
    output reg          WIB_RX_SEL0,
    output reg          WIB_RX_SEL1,
    output reg          WIB_RX_SEL2,
        
    output reg          EN_3V3,
    output reg          EN_2V5,  
    output reg          VP12_EN0,  
    output reg          VP12_EN1,  
    output reg          VP12_EN2,
    output reg          VP12_EN3,
    output reg          VP12_EN4,
    output reg          VP12_EN5,
        
    output reg          LV_SYNC,    
    output reg          VP12_SYNC0,
    output reg          VP12_SYNC1,
    output reg          VP12_SYNC2,
    output reg          VP12_SYNC3,
    output reg          VP12_SYNC4,
    output reg          VP12_SYNC5,
    output reg          VP12_SYNC6,
        
    input               VP2V5_PG,
    input               VP3V3_PG,
    input               VP2V5_ALERT,
    input               VP3V3_ALERT,
    input               VP12_IV_ALERT0,
    input               VP12_IV_ALERT1,
    input               VP12_IV_ALERT2,
    input               VP12_IV_ALERT3,
    input               VP12_IV_ALERT4,
    input               VP12_IV_ALERT5,
    input               VP12_IV_ALERT6,  
    
    input               OVER_TEMP0,
    input               OVER_TEMP1,
    input               OVER_TEMP2,
    output              OVER_TEMP_LED,
    
    output reg          timing_data_out,
    //output reg [7:0]       uC_data_out,
    output reg [64*32-1:0] reg_ro_out          
    );
    
    // test code ...
    reg test_reg;
    always @ (clk_axi) begin
        test_reg <= timing_data_in;
        timing_data_out <= test_reg;
    end
    
endmodule
