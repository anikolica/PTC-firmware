-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Wed Aug 17 15:16:11 2022
-- Host        : lxeng99 running 64-bit Ubuntu 16.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/lxeng99/PTC/ptc-firmware/reference_design/Vivado/ME-XU5-5EV-2I-D12E/Mercury_XU5_PE1.srcs/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_clk_wiz_0_0/Mercury_XU5_clk_wiz_0_0_stub.vhdl
-- Design      : Mercury_XU5_clk_wiz_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu5ev-sfvc784-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mercury_XU5_clk_wiz_0_0 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    clk_out3 : out STD_LOGIC;
    clk_out4 : out STD_LOGIC;
    resetn : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end Mercury_XU5_clk_wiz_0_0;

architecture stub of Mercury_XU5_clk_wiz_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,clk_out2,clk_out3,clk_out4,resetn,locked,clk_in1";
begin
end;
