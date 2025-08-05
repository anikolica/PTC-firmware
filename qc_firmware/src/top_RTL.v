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
    
    output              TIMING_GOOD,    // LED to indicate timing lock
    output              SYS_CMD,        // SoC test command out to timing master
    output              SOC_AUX_CLK,    // SoC test clock out to WIBs
    input               MUX_CLK,        // timing system master clock in from some WIB on the backplane
    
    input [5:0]         BP_IO,          // WIB "spare" IO for timing TX assert
    inout               BP_IO_OE,       // level translator enable (N)
    
    inout [7:0]         CRATE_ADDR,     // backplane address to WIB
    output              CRATE_ADDR_OE,  // level translator enable (N)
        
    // Regulator enables and clock out to SYNC pins
    output              EN_3V3,
    output              EN_2V5,  
    output              LV_SYNC,    
    output [6:0]        VP12_SYNC,

    // LTC2645 open-drain programmable alerts
    input               VP2V5_ALERT,
    inout               VP2V5_PG,
    input               VP3V3_PG,
    input               VP3V3_ALERT,
    input               VP12_IV_ALERT,  
    input               VP48_IV_ALERT,
    input               LOAD_IV_ALERT,
    
    
    // TMP117 open drain programmable alerts
    //input [2:0]         OVER_TEMP,
    //output              OVER_TEMP_LED,
    
    output [64*32-1:0]  reg_ro_out, 
    
    //Load Enables
   output              LOAD_EN0,
   output              LOAD_EN1,
   output              LOAD_EN2,
   output              LOAD_EN3,
   output              LOAD_EN4,
   output              LOAD_EN5,
   
   //PWM Signals
   output               PWM0,
   output               PWM1,
   output               PWM2,
   output               PWM3,
   output               PWM4,
   output               PWM5,
   
   //CLKs and CMDs 
   output               SYS_CMD_P5,
   output               SYS_CMD_N5,
   
   output               SYS_CMD_P4,
   output               SYS_CMD_N4,

   output               SYS_CMD_P3,
   output               SYS_CMD_N3,         

   output               SYS_CMD_P2,
   output               SYS_CMD_N2, 
   
   output               SYS_CMD_P1,
   output               SYS_CMD_N1,
  
   output               SYS_CMD_P0,
   output               SYS_CMD_N0,

   
   output               OUT_CLK,
   input[2:0]           sel,
   
   
   //SOC Auxiliary Lines
   inout [15:0]         SOC_AUX_IO,
   
   //Hardware Mux Lines
   output[2:0]          MUX_SEL,
   input                MUX_CLK_IN_P,
   input                MUX_CLK_IN_N,
   
   //I2C
   output               I2C_SCL,
   inout                I2C_SDA,
   output               QC_EN
    );
    
    // *** Declarations ***
    wire [6:0]      vp12_sync_en;
    wire            lvsync_en;
    wire [7:0]      timing_stat;
    wire            ep_stst;
    wire            ep_clk_sel;
    wire            mmcm0_rst_n;
    wire            mmcm0_locked;
    wire [7:0]      crate_addr_out;
    
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
    
    
    // *** R/W Register map ***
    // Reg 0, I2C and level translator control
    assign bp_io_en         = reg_rw_in[ 0 * 32 + 16];
    assign crate_addr_en    = reg_rw_in[ 0 * 32 + 23];
    assign crate_addr_out   = reg_rw_in[ 0 * 32 +  31 : 0 * 32 +  24];
   
    // Reg 1, timing control
    assign ep_srst          = reg_rw_in[ 1 * 32 + 10];
    assign ep_clk_sel       = reg_rw_in[ 1 * 32 + 11];
    assign mmcm0_rst_n      = reg_rw_in[ 1 * 32 + 17];
    
    // Reg 2 - 10, power regulator control
    assign EN_3V3           = ~reg_rw_in[ 2 * 32 +  0]; // TEST: FMC_LA33_P, pin G37 on FMC J1200-A, 1.8V
    assign EN_2V5           = ~reg_rw_in[ 3 * 32 +  0];
    assign vp12_sync_en     = reg_rw_in[10 * 32 +  6 : 10 * 32];
    assign lvsync_en        = reg_rw_in[10 * 32 +  7];
    
    // PWM register mapping
    //Reg 14
    assign PWM_EN0           = reg_rw_in[14 * 32 +  9];
    assign PWM_RST0          = reg_rw_in[14 * 32 +  8];
    assign PWM_INC0          = reg_rw_in[14 * 32 +  7];
    assign PWM_DEC0          = reg_rw_in[14 * 32 +  6];
    assign PWM_DUTY0[2:0]    = reg_rw_in[14 * 32 +  5 : 14 * 32 + 3];
    assign PWM_DIV0[2:0]     = reg_rw_in[14 * 32 +  2 : 14 * 32];
    
    //Reg 15
    assign PWM_EN1           = reg_rw_in[15 * 32 +  9];
    assign PWM_RST1          = reg_rw_in[15 * 32 +  8];
    assign PWM_INC1          = reg_rw_in[15 * 32 +  7];
    assign PWM_DEC1          = reg_rw_in[15 * 32 +  6];
    assign PWM_DUTY1[2:0]    = reg_rw_in[15 * 32 +  5 : 15 * 32 + 3];
    assign PWM_DIV1[2:0]     = reg_rw_in[15 * 32 +  2 : 15 * 32];
    
    //Reg 16
    assign PWM_EN2           = reg_rw_in[16 * 32 +  9];
    assign PWM_RST2          = reg_rw_in[16 * 32 +  8];
    assign PWM_INC2          = reg_rw_in[16 * 32 +  7];
    assign PWM_DEC2          = reg_rw_in[16 * 32 +  6];
    assign PWM_DUTY2[2:0]    = reg_rw_in[16 * 32 +  5 : 16 * 32 + 3];
    assign PWM_DIV2[2:0]     = reg_rw_in[16 * 32 +  2 : 16 * 32];
    
    //Reg 17
    assign PWM_EN3           = reg_rw_in[17 * 32 +  9];
    assign PWM_RST3          = reg_rw_in[17 * 32 +  8];
    assign PWM_INC3          = reg_rw_in[17 * 32 +  7];
    assign PWM_DEC3          = reg_rw_in[17 * 32 +  6];
    assign PWM_DUTY3[2:0]    = reg_rw_in[17 * 32 +  5 : 17 * 32 + 3];
    assign PWM_DIV3[2:0]     = reg_rw_in[17 * 32 +  2 : 17 * 32];
    
    //Reg 18
    assign PWM_EN4           = reg_rw_in[18 * 32 +  9];
    assign PWM_RST4          = reg_rw_in[18 * 32 +  8];
    assign PWM_INC4          = reg_rw_in[18 * 32 +  7];
    assign PWM_DEC4          = reg_rw_in[18 * 32 +  6];
    assign PWM_DUTY4[2:0]    = reg_rw_in[18 * 32 +  5 : 18 * 32 + 3];
    assign PWM_DIV4[2:0]     = reg_rw_in[18 * 32 +  2 : 18 * 32];
    
    //Reg 19
    assign PWM_EN5           = reg_rw_in[19 * 32 +  9];
    assign PWM_RST5          = reg_rw_in[19 * 32 +  8];
    assign PWM_INC5          = reg_rw_in[19 * 32 +  7];
    assign PWM_DEC5          = reg_rw_in[19 * 32 +  6];
    assign PWM_DUTY5[2:0]    = reg_rw_in[19 * 32 +  5 : 19 * 32 + 3];
    assign PWM_DIV5[2:0]     = reg_rw_in[19 * 32 +  2 : 19 * 32];
    
    // *** RO Register map ***

    
    // Reg 65, crate addres and WIB TX assert status;
    assign reg_ro_out [ 1 * 32 + 27 :  1 * 32 + 24] = timing_stat;
    assign reg_ro_out [ 1 * 32 + 28] = timing_lock;
    
    // Reg 66, power and temperature alerts
    assign reg_ro_out [ 2 * 32] = ~VP12_IV_ALERT; // low = alert
    assign reg_ro_out [ 2 * 32 +  8] = ~VP2V5_ALERT;                  // low = alert
    assign reg_ro_out [ 2 * 32 +  9] = ~VP3V3_ALERT;                  // low = alert
    
    
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
    

    //Enpoint Wrapper --NOTE: Will need to edit parameters as we figure out the hardware muxing situation
    pdts_endpoint_wrapper ts_ep_wrp
    (
        .addr       (16'h0000),
        .clk        (),
        .clk2x      (clk125_from_ts),
        .rdy        (),
        .rec_clk    (),
        .rec_d      (MUX_CLK),
        .rst        (),
        .sclk       (clk_axi),
        .srst       (ep_srst),
        .stat       (timing_stat),
        .sync       (),
        .sync_stb   (),
        .ts_clk_sel (ep_clk_sel),
        .tstamp     (),
        .tx_dis     (),
        .txd        (SYS_CMD)
    );
    
    
    //List of PWM Modules 0-5
    PWM pwm_inst0
    (
        .clk(clk_axi),
        .en(PWM_EN0),
        .rst(PWM_RST0),
        .duty_inc(PWM_INC0),
        .duty_dec(PWM_DEC0),
        .duty(PWM_DUTY0),
        .div(PWM_DIV0),
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
        .div(PWM_DIV1),
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
        .div(PWM_DIV2),
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
        .div(PWM_DIV3),
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
        .div(PWM_DIV4),
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
        .div(PWM_DIV5),
        .PWM_out(PWM5)
    );
    
    // *** Main code ***
    
    // Powerup
    // --1) Sequence 3.3V and 2.5V at same time
    // --2) 
    
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
    
        
endmodule
