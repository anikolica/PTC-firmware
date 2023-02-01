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
    
    output reg          XMC_JTAG_TMS,
    output reg          XMC_JTAG_TCK,
    input               XMC_JTAG_TDO,
    output reg          XMC_JTAG_TDI,
    output reg          XMC_JTAG_RST,
    
    //output reg          ECAT_UART_TX,
    //input               ECAT_UART_RX,
    output reg          DEBUG_UART_TX,
    input               DEBUG_UART_RX,
    
    output reg          SOC_I2C_SW_RST,
    output reg          WIB_I2C_OE,
    output reg          MCU_I2C_OE,
    //WIB_SDA
    //WIB_SCL
    //SOC_I2C_SCL
    //SOC_I2C_SDA
    
    input               SFP0_LOS,
    input               SFP0_TX_FAULT,
    input               SFP0_PRESENT,
    input               SFP1_LOS,
    input               SFP1_TX_FAULT,
    input               SFP1_PRESENT,
    input               SFP2_LOS,
    input               SFP2_TX_FAULT,
    input               SFP2_PRESENT,
    
    output reg          SFP0_SPARE_LED,
    output reg          SFP2_TX_DISABLE,
    output reg          WIB_CLK_SEL,
    output reg          TIMING_GOOD,
    output reg          WIB_PE_SEL,
    output reg          WIB_RX_SEL0,
    output reg          WIB_RX_SEL1,
    output reg          WIB_RX_SEL2,
    output reg          SYS_CMD,
    output reg          SOC_AUX_CLK,
    input               SYS_CLK,
    
    input               BP_IO0,
    input               BP_IO1,
    input               BP_IO2,
    input               BP_IO3,
    input               BP_IO4,
    input               BP_IO5,
    output reg          BP_IO_OE,
    
    input               CRATE_ADDR0,
    input               CRATE_ADDR1,
    input               CRATE_ADDR2,
    input               CRATE_ADDR3,
    input               CRATE_ADDR4,
    input               CRATE_ADDR5,
    input               CRATE_ADDR6,
    input               CRATE_ADDR7,
    input               CRATE_ADDR_OE,
        
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
        
    //input               VP2V5_PG,
    //input               VP3V3_PG,
    input               VP2V5_ALERT,
    input               VP3V3_ALERT,
    input               VP12_IV_ALERT0,
    input               VP12_IV_ALERT1,
    input               VP12_IV_ALERT2,
    input               VP12_IV_ALERT3,
    input               VP12_IV_ALERT4,
    input               VP12_IV_ALERT5,
    input               VP12_IV_ALERT6,  
    input               VP48_IV_ALERT,
    
    input               OVER_TEMP0,
    input               OVER_TEMP1,
    input               OVER_TEMP2,
    output              OVER_TEMP_LED,
    
    output reg [64*32-1:0] reg_ro_out          
    );
    
    // test code ...
    reg test_reg;
    always @ (clk_axi) begin
        EN_3V3 <= reg_rw_in[2*32]; // FMC_LA33_P, pin G37 on FMC J1200-A, 1.8V
        VP12_EN0 <= reg_rw_in[4*32]; // IOB_D1_N, pin 32 on Anios J1403, 3.3V
    end
        
endmodule
