// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Wed Aug 17 15:16:11 2022
// Host        : lxeng99 running 64-bit Ubuntu 16.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/lxeng99/PTC/ptc-firmware/reference_design/Vivado/ME-XU5-5EV-2I-D12E/Mercury_XU5_PE1.srcs/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_clk_wiz_0_0/Mercury_XU5_clk_wiz_0_0_stub.v
// Design      : Mercury_XU5_clk_wiz_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu5ev-sfvc784-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module Mercury_XU5_clk_wiz_0_0(clk_out1, clk_out2, clk_out3, clk_out4, resetn, 
  locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,clk_out2,clk_out3,clk_out4,resetn,locked,clk_in1" */;
  output clk_out1;
  output clk_out2;
  output clk_out3;
  output clk_out4;
  input resetn;
  output locked;
  input clk_in1;
endmodule
