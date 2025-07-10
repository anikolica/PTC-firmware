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
    input [64*32-1:0]   reg_rw_in,
    
    output              XMC_JTAG_TMS, // XMC4300 bootstrap and JTAG
    output              XMC_JTAG_TCK,
    input               XMC_JTAG_TDO,
    output              XMC_JTAG_TDI,
    output              XMC_JTAG_RST, // XMC4300 PORST_N
    
    // UARTS are from PS and AXI peripheral
    //output              ECAT_UART_TX,
    //input               ECAT_UART_RX,
    //output              DEBUG_UART_TX,
    //input               DEBUG_UART_RX,
    
    // On-board I2C control 
    output              SOC_I2C_SW_RST,
    output              WIB_I2C_OE,
    output              MCU_I2C_OE,
    
    // I2C is from two AXI peripherals
    //WIB_SDA
    //WIB_SCL
    
    // SFPs
    input               SFP0_LOS,       // Slow Control (GbE)
    input               SFP0_TX_FAULT,
    input               SFP0_PRESENT,
    input               SFP1_LOS,       // DUNE Detector Safety System (EtherCAT)
    input               SFP1_TX_FAULT,
    input               SFP1_PRESENT,
    input               SFP2_LOS,       // Timing (62.5MHz DCSK)
    input               SFP2_TX_FAULT,
    input               SFP2_PRESENT,
    
    output              SFP0_SPARE_LED, // GbE indicator
    inout               SFP2_TX_DISABLE,// timing system TX
    output              WIB_CLK_SEL,    // select timing system of SoC clock source
    output              TIMING_GOOD,    // LED to indicate timing lock
    output              WIB_PE_SEL,     // priority encode on PCB or SoC
    inout [2:0]         WIB_RX_SEL,     // control timing TX MUX on PCN or SoC
    output              SYS_CMD,        // SoC test command out to timing master
    output              SOC_AUX_CLK,    // SoC test clock out to WIBs
    input               SYS_CLK,        // timing system master clock in
    
    input [5:0]         BP_IO,          // WIB "spare" IO for timing TX assert
    inout               BP_IO_OE,       // level translator enable (N)
    
    inout [7:0]         CRATE_ADDR,     // backplane address to WIB
    output              CRATE_ADDR_OE,  // level translator enable (N)
        
    // Regulator enables and clock out to SYNC pins
    output              EN_3V3,
    output              EN_2V5,  
    output              LV_SYNC,    
    output [5:0]        VP12_EN,
    output [6:0]        VP12_SYNC,

    // LTC2645 open-drain programmable alerts
    input               VP2V5_ALERT,
    inout               VP2V5_PG,
    input               VP3V3_PG,
    input               VP3V3_ALERT,
    input [6:0]         VP12_IV_ALERT,  
    input               VP48_IV_ALERT,
    input               LOAD_IV_ALERT,
    
    
    // TMP117 open drain programmable alerts
    input [2:0]         OVER_TEMP,
    output              OVER_TEMP_LED,
    
    output [64*32-1:0]  reg_ro_out, 
    
    //Load Enables
   output reg[7:0]              LOAD_EN0,
   output reg[7:0]              LOAD_EN1,
   output reg[7:0]              LOAD_EN2,
   output reg[7:0]              LOAD_EN3,
   output reg[7:0]              LOAD_EN4,
   output reg[7:0]              LOAD_EN5,
   
   //PWM Signals
   output               PWM0,
   output               PWM1,
   output               PWM2,
   output               PWM3,
   output               PWM4,
   output               PWM5,
   
   //CLKs and CMDs 
   output               SYS_CLK_P5,
   output               SYS_CLK_N5,
   output               SYS_CMD_P5,
   output               SYS_CMD_N5,
   input                SYS_CLK_5,
   
   output               SYS_CLK_P4,
   output               SYS_CLK_N4,
   output               SYS_CMD_P4,
   output               SYS_CMD_N4,
   input                SYS_CLK_4,

   output               SYS_CLK_P3,
   output               SYS_CLK_N3,
   output               SYS_CMD_P3,
   output               SYS_CMD_N3,         
   input                SYS_CLK_3,
   
   output               SYS_CLK_P2,
   output               SYS_CLK_N2,
   output               SYS_CMD_P2,
   output               SYS_CMD_N2, 
   input                SYS_CLK_2,
   
   output               SYS_CLK_P1,
   output               SYS_CLK_N1,
   output               SYS_CMD_P1,
   output               SYS_CMD_N1,
   input                SYS_CLK_1,
   
   output               SYS_CLK_P0,
   output               SYS_CLK_N0,
   output               SYS_CMD_P0,
   output               SYS_CMD_N0,
   input                SYS_CLK_0,
   
   output               OUT_CLK,
   input[2:0]           sel,
   
   //I2C
   output               I2C_SCL,
   inout                I2C_SDA,
   output               QC_EN
    );
    
   
    
    // *** Declarations ***
    wire [6:0]      vp12_sync_en;
    wire            lvsync_en;
    wire            xmc_reset;
    wire            xmc_jtag_en;
    wire            wib_pe_soc_en_n;
    wire            sfp2_tx_en;
    wire            sfp2_tx_en_reg;
    wire            sfp2_tx_mux_ovr;
    wire            sfp2_tx_en_from_muxbits;
    wire [7:0]      timing_stat;
    wire            ep_stst;
    wire            ep_clk_sel;
    wire            mmcm0_rst_n;
    wire            mmcm0_locked;
    wire [2:0]      wib_rx_sel_out;
    wire [2:0]      wib_rx_sel_in;
    wire [7:0]      crate_addr_out;
    
    //Wires for the cascading mux scheme
    wire            mux_01_out;
    wire            mux_23_out;
    wire            mux_45_out;
    wire            mux_0123_out;
    wire            mux_4567_out;
    reg             selected_clk;
    
    //Wires for PWM Register
    wire            PWM_EN0;
    wire            PWM_RST0;
    wire            PWM_INC0;
    wire            PWM_DEC0;
    wire [2:0]      PWM_DUTY0;
    wire [2:0]      PWM_DIV0;
    
    //Wires for PWM Register
    wire            PWM_EN1;
    wire            PWM_RST1;
    wire            PWM_INC1;
    wire            PWM_DEC1;
    wire [2:0]      PWM_DUTY1;
    wire [2:0]      PWM_DIV1;
    
    //Wires for PWM Register
    wire            PWM_EN2;
    wire            PWM_RST2;
    wire            PWM_INC2;
    wire            PWM_DEC2;
    wire [2:0]      PWM_DUTY2;
    wire [2:0]      PWM_DIV2;
    
    //Wires for PWM Register
    wire            PWM_EN3;
    wire            PWM_RST3;
    wire            PWM_INC3;
    wire            PWM_DEC3;
    wire [2:0]      PWM_DUTY3;
    wire [2:0]      PWM_DIV3;
    
    //Wires for PWM Register
    wire            PWM_EN4;
    wire            PWM_RST4;
    wire            PWM_INC4;
    wire            PWM_DEC4;
    wire [2:0]      PWM_DUTY4;
    wire [2:0]      PWM_DIV4;
    
    //Wires for PWM Register
    wire            PWM_EN5;
    wire            PWM_RST5;
    wire            PWM_INC5;
    wire            PWM_DEC5;
    wire [2:0]      PWM_DUTY5;
    wire [2:0]      PWM_DIV5;
    
    
    
    reg             timing_lock;
    wire             dummy;
    
    
    // *** R/W Register map ***
    // Reg 0, I2C and level translator control
    assign SOC_I2C_SW_RST   = reg_rw_in[ 0 * 32 +  0];
    assign MCU_I2C_OE       = reg_rw_in[ 0 * 32 +  8];
    assign WIB_I2C_OE       = reg_rw_in[ 0 * 32 +  9];
    assign bp_io_en         = reg_rw_in[ 0 * 32 + 16];
    assign crate_addr_en    = reg_rw_in[ 0 * 32 + 23];
    assign crate_addr_out   = reg_rw_in[ 0 * 32 +  31 : 0 * 32 +  24];
    // Reg 1, timing control
    assign wib_rx_sel_out   = reg_rw_in[ 1 * 32 +  2 : 1 * 32 +  0];
    assign wib_pe_soc_en    = reg_rw_in[ 1 * 32 +  3];
    assign sfp2_tx_en_reg   = reg_rw_in[ 1 * 32 +  8];
    assign sfp2_tx_mux_ovr  = reg_rw_in[ 1 * 32 +  9];
    assign ep_srst          = reg_rw_in[ 1 * 32 + 10];
    assign ep_clk_sel       = reg_rw_in[ 1 * 32 + 11];
    assign WIB_CLK_SEL      = reg_rw_in[ 1 * 32 + 16];
    assign mmcm0_rst_n      = reg_rw_in[ 1 * 32 + 17];
    // Reg 2 - 10, power regulator control
    assign EN_3V3           = ~reg_rw_in[ 2 * 32 +  0]; // TEST: FMC_LA33_P, pin G37 on FMC J1200-A, 1.8V
    assign EN_2V5           = ~reg_rw_in[ 3 * 32 +  0];
    assign VP12_EN[0]       = reg_rw_in[ 4 * 32 +  0]; // TEST: IOB_D1_N, pin 32 on Anios J1403, 3.3V
    assign VP12_EN[1]       = reg_rw_in[ 5 * 32 +  0];
    assign VP12_EN[2]       = reg_rw_in[ 6 * 32 +  0];
    assign VP12_EN[3]       = reg_rw_in[ 7 * 32 +  0];
    assign VP12_EN[4]       = reg_rw_in[ 8 * 32 +  0];
    assign VP12_EN[5]       = reg_rw_in[ 9 * 32 +  0];
    assign vp12_sync_en     = reg_rw_in[10 * 32 +  6 : 10 * 32];
    assign lvsync_en        = reg_rw_in[10 * 32 +  7];
    // Reg 11, XMC control
    assign xmc_jtag_en      = reg_rw_in[11 * 32 +  0];
    assign xmc_reset_n      = reg_rw_in[11 * 32 +  8];
    // Reg 12, LED TEST
    assign SFP0_SPARE_LED   = reg_rw_in[11 * 32 +  0]; // wire to PS for GbE indicator?
    assign OVER_TEMP_LED    = reg_rw_in[11 * 32 +  1];
    
    // Attempt at PWM register mapping
    //Reg 13
    assign PWM_EN0           = reg_rw_in[12 * 32 +  9];
    assign PWM_RST0          = reg_rw_in[12 * 32 +  8];
    assign PWM_INC0          = reg_rw_in[12 * 32 +  7];
    assign PWM_DEC0          = reg_rw_in[12 * 32 +  6];
    assign PWM_DUTY0[2:0]    = reg_rw_in[12 * 32 +  5 : 12 * 32 + 3];
    assign PWM_DIV0[2:0]     = reg_rw_in[12 * 32 +  2 : 12 * 32];
    
    //Reg 14
    assign PWM_EN1           = reg_rw_in[13 * 32 +  9];
    assign PWM_RST1          = reg_rw_in[13 * 32 +  8];
    assign PWM_INC1          = reg_rw_in[13 * 32 +  7];
    assign PWM_DEC1          = reg_rw_in[13 * 32 +  6];
    assign PWM_DUTY1[2:0]    = reg_rw_in[13 * 32 +  5 : 12 * 32 + 3];
    assign PWM_DIV1[2:0]     = reg_rw_in[13 * 32 +  2 : 12 * 32];
    
    //Reg 15
    assign PWM_EN2           = reg_rw_in[14 * 32 +  9];
    assign PWM_RST2          = reg_rw_in[14 * 32 +  8];
    assign PWM_INC2          = reg_rw_in[14 * 32 +  7];
    assign PWM_DEC2          = reg_rw_in[14 * 32 +  6];
    assign PWM_DUTY2[2:0]    = reg_rw_in[14 * 32 +  5 : 12 * 32 + 3];
    assign PWM_DIV2[2:0]     = reg_rw_in[14 * 32 +  2 : 12 * 32];
    
    //Reg 16
    assign PWM_EN3           = reg_rw_in[15 * 32 +  9];
    assign PWM_RST3          = reg_rw_in[15 * 32 +  8];
    assign PWM_INC3          = reg_rw_in[15 * 32 +  7];
    assign PWM_DEC3          = reg_rw_in[15 * 32 +  6];
    assign PWM_DUTY3[2:0]    = reg_rw_in[15 * 32 +  5 : 12 * 32 + 3];
    assign PWM_DIV3[2:0]     = reg_rw_in[15 * 32 +  2 : 12 * 32];
    
    //Reg 17
    assign PWM_EN4           = reg_rw_in[16 * 32 +  9];
    assign PWM_RST4          = reg_rw_in[16 * 32 +  8];
    assign PWM_INC4          = reg_rw_in[16 * 32 +  7];
    assign PWM_DEC4          = reg_rw_in[16 * 32 +  6];
    assign PWM_DUTY4[2:0]    = reg_rw_in[16 * 32 +  5 : 12 * 32 + 3];
    assign PWM_DIV4[2:0]     = reg_rw_in[16 * 32 +  2 : 12 * 32];
    
    //Reg 18
    assign PWM_EN5           = reg_rw_in[17 * 32 +  9];
    assign PWM_RST5          = reg_rw_in[17 * 32 +  8];
    assign PWM_INC5          = reg_rw_in[17 * 32 +  7];
    assign PWM_DEC5          = reg_rw_in[17 * 32 +  6];
    assign PWM_DUTY5[2:0]    = reg_rw_in[17 * 32 +  5 : 12 * 32 + 3];
    assign PWM_DIV5[2:0]     = reg_rw_in[17 * 32 +  2 : 12 * 32];
    
    // *** TEMP ***
    assign SPARE0           = reg_rw_in[12 * 32 +  0];
    assign SPARE1           = reg_rw_in[12 * 32 +  1];
    // *************
    
    // *** RO Register map ***
    // Reg 64, SFP status
    assign reg_ro_out [ 0 * 32 +  0] = SFP0_TX_FAULT; // low = no fault
    assign reg_ro_out [ 0 * 32 +  1] = SFP0_LOS;      // low = no loss of signal
    assign reg_ro_out [ 0 * 32 +  2] = SFP0_PRESENT;  // low = present
    assign reg_ro_out [ 0 * 32 +  8] = SFP1_TX_FAULT;
    assign reg_ro_out [ 0 * 32 +  9] = SFP1_LOS;
    assign reg_ro_out [ 0 * 32 + 10] = SFP1_PRESENT;
    assign reg_ro_out [ 0 * 32 + 16] = SFP2_TX_FAULT;
    assign reg_ro_out [ 0 * 32 + 17] = SFP2_LOS;
    assign reg_ro_out [ 0 * 32 + 18] = SFP2_PRESENT;
    // Reg 65, crate addres and WIB TX assert status
    assign reg_ro_out [ 1 * 32 + 13 :  1 * 32 +  8] = BP_IO;
    assign reg_ro_out [ 1 * 32 + 18 :  1 * 32 + 16] = wib_rx_sel_in;
    assign reg_ro_out [ 1 * 32 + 27 :  1 * 32 + 24] = timing_stat;
    assign reg_ro_out [ 1 * 32 + 28] = timing_lock;
    // Reg 66, power and temperature alerts
    assign reg_ro_out [ 2 * 32 +  6 :  2 * 32 +  0] = ~VP12_IV_ALERT; // low = alert
    assign reg_ro_out [ 2 * 32 +  8] = ~VP2V5_ALERT;                  // low = alert
    assign reg_ro_out [ 2 * 32 +  9] = ~VP3V3_ALERT;                  // low = alert
    assign reg_ro_out [ 2 * 32 + 18 :  2 * 32 + 16] = ~OVER_TEMP;     // low = alert
    assign reg_ro_out [ 2 * 32 + 24] = ~VP48_IV_ALERT;                // low = alert
    //
    assign reg_ro_out [ 62 * 32 +  0] = mmcm0_locked; // TEST
    assign reg_ro_out [ 63 * 32 +  31 : 63 * 32 +  0] = 32'hdeadbeef; // TEST
    
    // *** Buffers ***
    // Keep SYNC lines to LTM8064 tri-stated if not using (requires resistor stuffing option)
    // tri-state = disable
    // when not in tri-state, drive with clock
    IOBUF sync0_buf (.T(~vp12_sync_en[0]), .I(1'b0), .O(), .IO(VP12_SYNC[0])); // FIXME: Wire I to MMCMs for clock control
    IOBUF sync1_buf (.T(~vp12_sync_en[1]), .I(1'b0), .O(), .IO(VP12_SYNC[1]));
    IOBUF sync2_buf (.T(~vp12_sync_en[2]), .I(1'b0), .O(), .IO(VP12_SYNC[2]));
    IOBUF sync3_buf (.T(~vp12_sync_en[3]), .I(1'b0), .O(), .IO(VP12_SYNC[3]));
    IOBUF sync4_buf (.T(~vp12_sync_en[4]), .I(1'b0), .O(), .IO(VP12_SYNC[4]));
    IOBUF sync5_buf (.T(~vp12_sync_en[5]), .I(1'b0), .O(), .IO(VP12_SYNC[5]));
    IOBUF sync6_buf (.T(~vp12_sync_en[6]), .I(1'b0), .O(), .IO(VP12_SYNC[6]));
    IOBUF lvsync_buf (.T(~lvsync_en     ), .I(1'b0), .O(), .IO(LV_SYNC));
    
    // Keep XMC4300 JTAG interface tri-stated to use on-board 10-pin connector
    IOBUF rst_buf (.T(~xmc_jtag_en), .I(xmc_reset_n), .O(), .IO(XMC_JTAG_RST)); // Actually PORST_N
    IOBUF tms_buf (.T(~xmc_jtag_en), .I(1'b1), .O(), .IO(XMC_JTAG_TMS)); // controls boot mode
    IOBUF tck_buf (.T(~xmc_jtag_en), .I(1'b0), .O(), .IO(XMC_JTAG_TCK)); // controls boot mode
    IOBUF tdo_buf (.T(~xmc_jtag_en), .I(), .O(    ), .IO(XMC_JTAG_TDO)); // FIXME: wire Output to code block
    IOBUF tdi_buf (.T(~xmc_jtag_en), .I(1'b0), .O(), .IO(XMC_JTAG_TDI)); // FIXME: wire Input to code block
    
    // WIB priority encoder select
    // tri-state = TXB0104 controls MUX (default)
    // low = SoC controls MUX through WIB_RX_SEL lines (do not drive high!)
//    IOBUF pesel_buf (.T(~wib_pe_soc_en), .I(1'b0), .O(), .IO(WIB_PE_SEL));
//    IOBUF wib_rx_buf0 (.T(~wib_pe_soc_en), .I(wib_rx_sel_out[0]), .O(wib_rx_sel_in[0]), .IO(WIB_RX_SEL[0]));
//    IOBUF wib_rx_buf1 (.T(~wib_pe_soc_en), .I(wib_rx_sel_out[1]), .O(wib_rx_sel_in[1]), .IO(WIB_RX_SEL[1]));
//    IOBUF wib_rx_buf2 (.T(~wib_pe_soc_en), .I(wib_rx_sel_out[2]), .O(wib_rx_sel_in[2]), .IO(WIB_RX_SEL[2]));
//    // timing SFP
    // tri-state = transmitter disabled
    // low = transmitter enabled (do not drive high!)
    IOBUF sfp2_buf (.T(sfp2_tx_en), .I(1'b0), .O(), .IO(SFP2_TX_DISABLE));

    // Level translators from WIB 2.5V to SoC 1.8V
    // tri-state = disable (pullup on PCB)
    // low = enable (do not drive high!)

    IOBUF bpoe_buf (.T(~bp_io_en), .I(1'b0), .O(), .IO(BP_IO_OE));
    
    // NOTE: Jan 2023 PTCv4 only reads DIP settings in by default
    //       Future versions may have ability to drive address onto PTB
    IOBUF addroe_buf (.T(~crate_addr_en), .I(1'b0), .O(), .IO(CRATE_ADDR_OE));
    IOBUF addr_buf0 (.T(~crate_addr_en), .I(crate_addr_out[0]), .O(), .IO(CRATE_ADDR[0]));
    IOBUF addr_buf1 (.T(~crate_addr_en), .I(crate_addr_out[1]), .O(), .IO(CRATE_ADDR[1]));
    IOBUF addr_buf2 (.T(~crate_addr_en), .I(crate_addr_out[2]), .O(), .IO(CRATE_ADDR[2]));
    IOBUF addr_buf3 (.T(~crate_addr_en), .I(crate_addr_out[3]), .O(), .IO(CRATE_ADDR[3]));
    IOBUF addr_buf4 (.T(~crate_addr_en), .I(crate_addr_out[4]), .O(), .IO(CRATE_ADDR[4]));
    IOBUF addr_buf5 (.T(~crate_addr_en), .I(crate_addr_out[5]), .O(), .IO(CRATE_ADDR[5]));
    IOBUF addr_buf6 (.T(~crate_addr_en), .I(crate_addr_out[6]), .O(), .IO(CRATE_ADDR[6]));
    IOBUF addr_buf7 (.T(~crate_addr_en), .I(crate_addr_out[7]), .O(), .IO(CRATE_ADDR[7]));
    
    // MUX between endpoint output (default) and PLL-based clocks (reg sel when no timing system)
    BUFGMUX ts_clk_mux2x (.I0(clk125_from_ts), .I1(), .S(1'b0), .O(clk125));   
    

    
    pdts_endpoint_wrapper ts_ep_wrp
    (
        .addr       (16'h0000),
        .clk        (),
        .clk2x      (clk125_from_ts),
        .rdy        (),
        .rec_clk    (),
        .rec_d      (SYS_CLK_0),
        .rst        (),
        .sclk       (clk_axi),
        .srst       (ep_srst),
        .stat       (timing_stat),
        .sync       (),
        .sync_stb   (),
        .ts_clk_sel (ep_clk_sel),
        .tstamp     (),
        .tx_dis     (),
        .txd        (SYS_CMD_0)
    );
    
    
    PWM pwm_inst0
    (
        .clk(clk_axi),
        .en(PWM_EN0),
        .rst(PWM_RST0),
        .duty_inc(PWM_INC0),
        .duty_dec(PWM_DEC0),
        .duty(PWM_DUTY0),
        .PWM_out(PWM0)
    );
    
     PWM pwm_inst1
    (
        .clk(clk_axi),
        .en(PWM_EN1),
        .rst(PWM_RST1),
        .duty_inc(PWM_INC1),
        .duty_dec(PWM_DEC1),
        .duty(PWM_DUTY1),
        .PWM_out(PWM1)
    ); 
    
     PWM pwm_inst2
    (
        .clk(clk_axi),
        .en(PWM_EN2),
        .rst(PWM_RST2),
        .duty_inc(PWM_INC2),
        .duty_dec(PWM_DEC2),
        .duty(PWM_DUTY2),
        .PWM_out(PWM2)
    );
    
     PWM pwm_inst3
    (
        .clk(clk_axi),
        .en(PWM_EN3),
        .rst(PWM_RST3),
        .duty_inc(PWM_INC3),
        .duty_dec(PWM_DEC3),
        .duty(PWM_DUTY3),
        .PWM_out(PWM3)
    );
    
     PWM pwm_inst4
    (
        .clk(clk_axi),
        .en(PWM_EN4),
        .rst(PWM_RST4),
        .duty_inc(PWM_INC4),
        .duty_dec(PWM_DEC4),
        .duty(PWM_DUTY4),
        .PWM_out(PWM4)
    );
    
     PWM pwm_inst5
    (
        .clk(clk_axi),
        .en(PWM_EN5),
        .rst(PWM_RST5),
        .duty_inc(PWM_INC5),
        .duty_dec(PWM_DEC5),
        .duty(PWM_DUTY5),
        .PWM_out(PWM5)
    );
    
    // *** Main code ***
    
    // Powerup
    // --1) Sequence 3.3V and 2.5V at same time
    // --2) 
    
    // --XMC bootup: 
    // --1) power on 3.3V
    // --2) assert TMS
    // --3) bring JTAG lines out of tri-state
    // --4) assert xmc_reset_n (not reset)
    // --then XMC boots normally (as per p2512 of XMC4300 manual
    
    // *** TIMING ***
        mmcm0 fake_clk
    (
        .clk_out1 (SOC_AUX_CLK),            
        .resetn   (mmcm0_rst_n),
        .locked   (mmcm0_locked),
        .clk_in1  (clk_axi)
    );
    
    always @ (posedge clk_axi)
    begin
        if (timing_stat == 4'h8)
            timing_lock = 1'b1;
        else
            timing_lock = 1'b0;
    end
    assign TIMING_GOOD = timing_lock; // to LED
    
    // SFP2 TX control
    // If MUX override bit is set, pull down when any of 6 prio encode lines go low
    assign sfp2_tx_en_from_muxbits = (sfp2_tx_mux_ovr == 1'b1) ? &BP_IO: 1'b1;
    // pull TX_EN low when either: reg force bit is set, or MUX override is set
    assign sfp2_tx_en = ~sfp2_tx_en_reg && sfp2_tx_en_from_muxbits;
        
endmodule
