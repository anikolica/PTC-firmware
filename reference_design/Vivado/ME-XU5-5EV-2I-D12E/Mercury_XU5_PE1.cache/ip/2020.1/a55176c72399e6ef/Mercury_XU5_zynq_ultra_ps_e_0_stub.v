// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Wed Aug 17 15:12:17 2022
// Host        : lxeng99 running 64-bit Ubuntu 16.04.6 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Mercury_XU5_zynq_ultra_ps_e_0_stub.v
// Design      : Mercury_XU5_zynq_ultra_ps_e_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu5ev-sfvc784-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "zynq_ultra_ps_e_v3_3_2_zynq_ultra_ps_e,Vivado 2020.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(maxihpm0_fpd_aclk, maxigp0_awid, 
  maxigp0_awaddr, maxigp0_awlen, maxigp0_awsize, maxigp0_awburst, maxigp0_awlock, 
  maxigp0_awcache, maxigp0_awprot, maxigp0_awvalid, maxigp0_awuser, maxigp0_awready, 
  maxigp0_wdata, maxigp0_wstrb, maxigp0_wlast, maxigp0_wvalid, maxigp0_wready, maxigp0_bid, 
  maxigp0_bresp, maxigp0_bvalid, maxigp0_bready, maxigp0_arid, maxigp0_araddr, maxigp0_arlen, 
  maxigp0_arsize, maxigp0_arburst, maxigp0_arlock, maxigp0_arcache, maxigp0_arprot, 
  maxigp0_arvalid, maxigp0_aruser, maxigp0_arready, maxigp0_rid, maxigp0_rdata, 
  maxigp0_rresp, maxigp0_rlast, maxigp0_rvalid, maxigp0_rready, maxigp0_awqos, maxigp0_arqos, 
  maxihpm0_lpd_aclk, maxigp2_awid, maxigp2_awaddr, maxigp2_awlen, maxigp2_awsize, 
  maxigp2_awburst, maxigp2_awlock, maxigp2_awcache, maxigp2_awprot, maxigp2_awvalid, 
  maxigp2_awuser, maxigp2_awready, maxigp2_wdata, maxigp2_wstrb, maxigp2_wlast, 
  maxigp2_wvalid, maxigp2_wready, maxigp2_bid, maxigp2_bresp, maxigp2_bvalid, maxigp2_bready, 
  maxigp2_arid, maxigp2_araddr, maxigp2_arlen, maxigp2_arsize, maxigp2_arburst, 
  maxigp2_arlock, maxigp2_arcache, maxigp2_arprot, maxigp2_arvalid, maxigp2_aruser, 
  maxigp2_arready, maxigp2_rid, maxigp2_rdata, maxigp2_rresp, maxigp2_rlast, maxigp2_rvalid, 
  maxigp2_rready, maxigp2_awqos, maxigp2_arqos, emio_enet1_gmii_rx_clk, 
  emio_enet1_speed_mode, emio_enet1_gmii_crs, emio_enet1_gmii_col, emio_enet1_gmii_rxd, 
  emio_enet1_gmii_rx_er, emio_enet1_gmii_rx_dv, emio_enet1_gmii_tx_clk, 
  emio_enet1_gmii_txd, emio_enet1_gmii_tx_en, emio_enet1_gmii_tx_er, emio_enet1_mdio_mdc, 
  emio_enet1_mdio_i, emio_enet1_mdio_o, emio_enet1_mdio_t, emio_enet1_tsu_inc_ctrl, 
  emio_enet1_tsu_timer_cmp_val, emio_enet0_enet_tsu_timer_cnt, emio_enet1_ext_int_in, 
  emio_enet1_dma_bus_width, pl_resetn0, pl_clk0, pl_clk1)
/* synthesis syn_black_box black_box_pad_pin="maxihpm0_fpd_aclk,maxigp0_awid[15:0],maxigp0_awaddr[39:0],maxigp0_awlen[7:0],maxigp0_awsize[2:0],maxigp0_awburst[1:0],maxigp0_awlock,maxigp0_awcache[3:0],maxigp0_awprot[2:0],maxigp0_awvalid,maxigp0_awuser[15:0],maxigp0_awready,maxigp0_wdata[127:0],maxigp0_wstrb[15:0],maxigp0_wlast,maxigp0_wvalid,maxigp0_wready,maxigp0_bid[15:0],maxigp0_bresp[1:0],maxigp0_bvalid,maxigp0_bready,maxigp0_arid[15:0],maxigp0_araddr[39:0],maxigp0_arlen[7:0],maxigp0_arsize[2:0],maxigp0_arburst[1:0],maxigp0_arlock,maxigp0_arcache[3:0],maxigp0_arprot[2:0],maxigp0_arvalid,maxigp0_aruser[15:0],maxigp0_arready,maxigp0_rid[15:0],maxigp0_rdata[127:0],maxigp0_rresp[1:0],maxigp0_rlast,maxigp0_rvalid,maxigp0_rready,maxigp0_awqos[3:0],maxigp0_arqos[3:0],maxihpm0_lpd_aclk,maxigp2_awid[15:0],maxigp2_awaddr[39:0],maxigp2_awlen[7:0],maxigp2_awsize[2:0],maxigp2_awburst[1:0],maxigp2_awlock,maxigp2_awcache[3:0],maxigp2_awprot[2:0],maxigp2_awvalid,maxigp2_awuser[15:0],maxigp2_awready,maxigp2_wdata[31:0],maxigp2_wstrb[3:0],maxigp2_wlast,maxigp2_wvalid,maxigp2_wready,maxigp2_bid[15:0],maxigp2_bresp[1:0],maxigp2_bvalid,maxigp2_bready,maxigp2_arid[15:0],maxigp2_araddr[39:0],maxigp2_arlen[7:0],maxigp2_arsize[2:0],maxigp2_arburst[1:0],maxigp2_arlock,maxigp2_arcache[3:0],maxigp2_arprot[2:0],maxigp2_arvalid,maxigp2_aruser[15:0],maxigp2_arready,maxigp2_rid[15:0],maxigp2_rdata[31:0],maxigp2_rresp[1:0],maxigp2_rlast,maxigp2_rvalid,maxigp2_rready,maxigp2_awqos[3:0],maxigp2_arqos[3:0],emio_enet1_gmii_rx_clk,emio_enet1_speed_mode[2:0],emio_enet1_gmii_crs,emio_enet1_gmii_col,emio_enet1_gmii_rxd[7:0],emio_enet1_gmii_rx_er,emio_enet1_gmii_rx_dv,emio_enet1_gmii_tx_clk,emio_enet1_gmii_txd[7:0],emio_enet1_gmii_tx_en,emio_enet1_gmii_tx_er,emio_enet1_mdio_mdc,emio_enet1_mdio_i,emio_enet1_mdio_o,emio_enet1_mdio_t,emio_enet1_tsu_inc_ctrl[1:0],emio_enet1_tsu_timer_cmp_val,emio_enet0_enet_tsu_timer_cnt[93:0],emio_enet1_ext_int_in,emio_enet1_dma_bus_width[1:0],pl_resetn0,pl_clk0,pl_clk1" */;
  input maxihpm0_fpd_aclk;
  output [15:0]maxigp0_awid;
  output [39:0]maxigp0_awaddr;
  output [7:0]maxigp0_awlen;
  output [2:0]maxigp0_awsize;
  output [1:0]maxigp0_awburst;
  output maxigp0_awlock;
  output [3:0]maxigp0_awcache;
  output [2:0]maxigp0_awprot;
  output maxigp0_awvalid;
  output [15:0]maxigp0_awuser;
  input maxigp0_awready;
  output [127:0]maxigp0_wdata;
  output [15:0]maxigp0_wstrb;
  output maxigp0_wlast;
  output maxigp0_wvalid;
  input maxigp0_wready;
  input [15:0]maxigp0_bid;
  input [1:0]maxigp0_bresp;
  input maxigp0_bvalid;
  output maxigp0_bready;
  output [15:0]maxigp0_arid;
  output [39:0]maxigp0_araddr;
  output [7:0]maxigp0_arlen;
  output [2:0]maxigp0_arsize;
  output [1:0]maxigp0_arburst;
  output maxigp0_arlock;
  output [3:0]maxigp0_arcache;
  output [2:0]maxigp0_arprot;
  output maxigp0_arvalid;
  output [15:0]maxigp0_aruser;
  input maxigp0_arready;
  input [15:0]maxigp0_rid;
  input [127:0]maxigp0_rdata;
  input [1:0]maxigp0_rresp;
  input maxigp0_rlast;
  input maxigp0_rvalid;
  output maxigp0_rready;
  output [3:0]maxigp0_awqos;
  output [3:0]maxigp0_arqos;
  input maxihpm0_lpd_aclk;
  output [15:0]maxigp2_awid;
  output [39:0]maxigp2_awaddr;
  output [7:0]maxigp2_awlen;
  output [2:0]maxigp2_awsize;
  output [1:0]maxigp2_awburst;
  output maxigp2_awlock;
  output [3:0]maxigp2_awcache;
  output [2:0]maxigp2_awprot;
  output maxigp2_awvalid;
  output [15:0]maxigp2_awuser;
  input maxigp2_awready;
  output [31:0]maxigp2_wdata;
  output [3:0]maxigp2_wstrb;
  output maxigp2_wlast;
  output maxigp2_wvalid;
  input maxigp2_wready;
  input [15:0]maxigp2_bid;
  input [1:0]maxigp2_bresp;
  input maxigp2_bvalid;
  output maxigp2_bready;
  output [15:0]maxigp2_arid;
  output [39:0]maxigp2_araddr;
  output [7:0]maxigp2_arlen;
  output [2:0]maxigp2_arsize;
  output [1:0]maxigp2_arburst;
  output maxigp2_arlock;
  output [3:0]maxigp2_arcache;
  output [2:0]maxigp2_arprot;
  output maxigp2_arvalid;
  output [15:0]maxigp2_aruser;
  input maxigp2_arready;
  input [15:0]maxigp2_rid;
  input [31:0]maxigp2_rdata;
  input [1:0]maxigp2_rresp;
  input maxigp2_rlast;
  input maxigp2_rvalid;
  output maxigp2_rready;
  output [3:0]maxigp2_awqos;
  output [3:0]maxigp2_arqos;
  input emio_enet1_gmii_rx_clk;
  output [2:0]emio_enet1_speed_mode;
  input emio_enet1_gmii_crs;
  input emio_enet1_gmii_col;
  input [7:0]emio_enet1_gmii_rxd;
  input emio_enet1_gmii_rx_er;
  input emio_enet1_gmii_rx_dv;
  input emio_enet1_gmii_tx_clk;
  output [7:0]emio_enet1_gmii_txd;
  output emio_enet1_gmii_tx_en;
  output emio_enet1_gmii_tx_er;
  output emio_enet1_mdio_mdc;
  input emio_enet1_mdio_i;
  output emio_enet1_mdio_o;
  output emio_enet1_mdio_t;
  input [1:0]emio_enet1_tsu_inc_ctrl;
  output emio_enet1_tsu_timer_cmp_val;
  output [93:0]emio_enet0_enet_tsu_timer_cnt;
  input emio_enet1_ext_int_in;
  output [1:0]emio_enet1_dma_bus_width;
  output pl_resetn0;
  output pl_clk0;
  output pl_clk1;
endmodule
