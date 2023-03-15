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
    //SOC_I2C_SCL
    //SOC_I2C_SDA
    
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
    output              SFP2_TX_DISABLE,// timing system TX
    output              WIB_CLK_SEL,    // select timing system of SoC clock source
    output              TIMING_GOOD,    // LED to indicate timing lock
    output              WIB_PE_SEL,     // priority encode on PCB or SoC
    output [2:0]        WIB_RX_SEL,     // control timing TX MUX on PCN or SoC
    output              SYS_CMD,        // SoC test command out to timing master
    output              SOC_AUX_CLK,    // SoC test clock out to WIBs
    input               SYS_CLK,        // timing system master clock in
    
    input [5:0]         BP_IO,          // WIB "spare" IO for timing TX assert
    output              BP_IO_OE,       // level translator enable (N)
    
    input [7:0]         CRATE_ADDR,     // backplane slow
    input               CRATE_ADDR_OE,  // level translator enable (N)
        
    // Regulator enables and clock out to SYNC pins
    output              EN_3V3,
    output              EN_2V5,  
    output              LV_SYNC,    
    output [5:0]        VP12_EN,
    output [6:0]        VP12_SYNC,

    // LTC2645 open-drain programmable alerts
    input               VP2V5_ALERT,
    input               VP3V3_ALERT,
    input [6:0]         VP12_IV_ALERT,  
    input               VP48_IV_ALERT,
    
    // TMP117 open drain programmable alerts
    input [2:0]         OVER_TEMP,
    output              OVER_TEMP_LED,
    
    output [64*32-1:0]  reg_ro_out          
    );
    
    // *** Declarations ***
    wire [6:0]      vp12_sync_en;
    wire            lvsync_en;
    wire            xmc_reset;
    wire            xmc_jtag_en;
    wire            wib_pe_soc_en_n;
    wire            sfp2_tx_en;
    
    // *** R/W Register map ***
    // Reg 0, I2C and level translator control
    assign SOC_I2C_SW_RST   = reg_rw_in[ 0 * 32 +  0];
    assign MCU_I2C_OE       = reg_rw_in[ 0 * 32 +  8];
    assign WIB_I2C_OE       = reg_rw_in[ 0 * 32 + 16];
    assign bp_io_en         = reg_rw_in[ 0 * 32 + 24];
    assign crate_addr_en    = reg_rw_in[ 0 * 32 + 25];
    // Reg 1, timing control
    assign wib_pe_soc_en    = reg_rw_in[ 1 * 32 +  4];
    assign WIB_RX_SEL       = reg_rw_in[ 1 * 32 +  3 : 1 * 32 +  0];
    assign sfp2_tx_en       = reg_rw_in[ 1 * 32 +  8];
    assign WIB_CLK_SEL      = reg_rw_in[ 1 * 32 + 16];
    // Reg 2 - 10, power regulator control
    assign EN_3V3           = reg_rw_in[ 2 * 32 +  0]; // TEST: FMC_LA33_P, pin G37 on FMC J1200-A, 1.8V
    assign EN_2V5           = reg_rw_in[ 3 * 32 +  0];
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
    assign TIMING_GOOD      = reg_rw_in[11 * 32 +  1];
    assign OVER_TEMP_LED    = reg_rw_in[11 * 32 +  2];
    
    // *** TEMP ***
    assign SPARE0           = reg_rw_in[12 * 32 +  0];
    assign SPARE1           = reg_rw_in[12 * 32 +  1];
    
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
    assign reg_ro_out [ 1 * 32 +  7 :  1 * 32 +  0] = CRATE_ADDR;
    assign reg_ro_out [ 1 * 32 + 13 :  1 * 32 +  8] = BP_IO;
    // Reg 66, power and temperature alerts
    assign reg_ro_out [ 2 * 32 +  6 :  2 * 32 +  0] = ~VP12_IV_ALERT; // low = alert
    assign reg_ro_out [ 2 * 32 +  8] = ~VP2V5_ALERT;                  // low = alert
    assign reg_ro_out [ 2 * 32 +  9] = ~VP3V3_ALERT;                  // low = alert
    assign reg_ro_out [ 2 * 32 + 18 :  2 * 32 + 16] = ~OVER_TEMP;     // low = alert
    assign reg_ro_out [ 2 * 32 + 24] = ~VP48_IV_ALERT;                // low = alert
    //
    assign reg_ro_out [ 63 * 32 +  0] = 32'hdeadbeef; // TEST
    
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
    IOBUF rst_buf (.T(1'b0), .I(xmc_reset_n), .O(), .IO(XMC_JTAG_RST)); // Actually PORST_N
    IOBUF tms_buf (.T(~xmc_jtag_en), .I(1'b1), .O(), .IO(XMC_JTAG_TMS)); // controls boot mode
    IOBUF tck_buf (.T(~xmc_jtag_en), .I(1'b0), .O(), .IO(XMC_JTAG_TCK)); // controls boot mode
    IOBUF tdo_buf (.T(~xmc_jtag_en), .I(    ), .O(), .IO(XMC_JTAG_TDO)); // FIXME: wire Output to code block
    IOBUF tdi_buf (.T(~xmc_jtag_en), .I(1'b0), .O(), .IO(XMC_JTAG_TDI)); // FIXME: wire Input to code block
    
    // WIB priority encoder select
    // tri-state = TXB0104 controls MUX (default)
    // low = SoC controls MUX through WIB_RX_SEL lines (do not drive high!)
    IOBUF pesel_buf (.T(~wib_pe_soc_en), .I(1'b0), .O(), .IO(WIB_PE_SEL));
    // timing SFP
    // tri-state = transmitter disabled
    // low = transmitter enabled (do not drive high!)
    IOBUF sfp2_buf (.T(~sfp2_tx_en), .I(1'b0), .O(), .IO(SFP2_TX_DISABLE));
    
    // Level translators from WIB 2.5V to SoC 1.8V
    // tri-state = disable (pullup on PCB)
    // low = enable (do not drive high!)
    IOBUF bpoe_buf (.T(~bp_io_en), .I(1'b0), .O(), .IO(BP_IO_OE));
    IOBUF addroe_buf (.T(~crate_addr_en), .I(1'b0), .O(), .IO(CRATE_ADDR_OE));
    
    // MUX between endpoint output (default) and PLL-based clocks (reg sel when no timing system)
    BUFGMUX ts_clk_mux2x (.I0(clk125_from_ts), .I1(), .S(1'b0), .O(clk125));   
    
    pdts_endpoint_wrapper ts_ep_wrp
    (
        .addr       (16'h0000),
        .clk        (),
        .clk2x      (clk125_from_ts),
        .rdy        (),
        .rec_clk    (),
        .rec_d      (SYS_CLK),
        .rst        (),
        .sclk       (clk_axi),
        .srst       (SPARE0),
        .stat       (),
        .sync       (),
        .sync_stb   (),
        .ts_clk_sel (SPARE1),
        .tstamp     (),
        .tx_dis     (),
        .txd        (SYS_CMD)
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
    
    // Timing MUX control
    // FIXME: wire to timing module decoder
    //assign WIB_RX_SEL   = 3'b000; // Select SoC stream to MUX (default)
    //assign sfp2_en      = 1'b1; // keep timing SFP disabled (tri-state)
    //assign TIMING_GOOD  = 1'b0; // assignn to lock bit
    //assign SYS_CMD      = 1'b0; // output to MUX ch0, test TX to timing master
    //assign SOC_AUX_CLK  = 1'b0; // test fanout to WIBs, for test
    //assign TEST_SIG     = SYS_CLK; // timing master signal into SoC 
        
endmodule
