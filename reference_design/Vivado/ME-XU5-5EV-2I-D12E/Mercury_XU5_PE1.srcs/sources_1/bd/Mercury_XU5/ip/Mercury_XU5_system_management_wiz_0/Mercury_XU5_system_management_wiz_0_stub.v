// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Wed Aug 17 15:12:03 2022
// Host        : lxeng99 running 64-bit Ubuntu 16.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/lxeng99/PTC/ptc-firmware/reference_design/Vivado/ME-XU5-5EV-2I-D12E/Mercury_XU5_PE1.srcs/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_system_management_wiz_0/Mercury_XU5_system_management_wiz_0_stub.v
// Design      : Mercury_XU5_system_management_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu5ev-sfvc784-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module Mercury_XU5_system_management_wiz_0(s_axi_aclk, s_axi_aresetn, s_axi_awaddr, 
  s_axi_awvalid, s_axi_awready, s_axi_wdata, s_axi_wstrb, s_axi_wvalid, s_axi_wready, 
  s_axi_bresp, s_axi_bvalid, s_axi_bready, s_axi_araddr, s_axi_arvalid, s_axi_arready, 
  s_axi_rdata, s_axi_rresp, s_axi_rvalid, s_axi_rready, ip2intc_irpt, busy_out, channel_out, 
  eoc_out, eos_out, ot_out, vccpsaux_alarm_out, vccpsintlp_alarm_out, vccpsintfp_alarm_out, 
  vccaux_alarm_out, vccint_alarm_out, user_temp_alarm_out, alarm_out)
/* synthesis syn_black_box black_box_pad_pin="s_axi_aclk,s_axi_aresetn,s_axi_awaddr[12:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wvalid,s_axi_wready,s_axi_bresp[1:0],s_axi_bvalid,s_axi_bready,s_axi_araddr[12:0],s_axi_arvalid,s_axi_arready,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rvalid,s_axi_rready,ip2intc_irpt,busy_out,channel_out[5:0],eoc_out,eos_out,ot_out,vccpsaux_alarm_out,vccpsintlp_alarm_out,vccpsintfp_alarm_out,vccaux_alarm_out,vccint_alarm_out,user_temp_alarm_out,alarm_out" */;
  input s_axi_aclk;
  input s_axi_aresetn;
  input [12:0]s_axi_awaddr;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [12:0]s_axi_araddr;
  input s_axi_arvalid;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input s_axi_rready;
  output ip2intc_irpt;
  output busy_out;
  output [5:0]channel_out;
  output eoc_out;
  output eos_out;
  output ot_out;
  output vccpsaux_alarm_out;
  output vccpsintlp_alarm_out;
  output vccpsintfp_alarm_out;
  output vccaux_alarm_out;
  output vccint_alarm_out;
  output user_temp_alarm_out;
  output alarm_out;
endmodule
