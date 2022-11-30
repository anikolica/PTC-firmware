# ----------------------------------------------------------------------------------
# Copyright (c) 2021 by Enclustra GmbH, Switzerland.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this hardware, software, firmware, and associated documentation files (the
# "Product"), to deal in the Product without restriction, including without
# limitation the rights to use, copy, modify, merge, publish, distribute,
# sublicense, and/or sell copies of the Product, and to permit persons to whom the
# Product is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Product.
#
# THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# PRODUCT OR THE USE OR OTHER DEALINGS IN THE PRODUCT.
# ----------------------------------------------------------------------------------

set_property BITSTREAM.CONFIG.OVERTEMPSHUTDOWN ENABLE [current_design]
 
# ----------------------------------------------------------------------------------
# Important! Do not remove this constraint!
# This property ensures that all unused pins are set to high impedance.
# If the constraint is removed, all unused pins have to be set to HiZ in the top level file.
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design]
# ----------------------------------------------------------------------------------

## -------------------------------------------------------------------------------------------------
## I/Os available only on the XU5-2EG/3EG variants and on the XU5-4EG/5EG-G1 variants
##    bank 65 & 66
##    bank 26 (ZU2/3) or 46 (ZU4/5)
## -------------------------------------------------------------------------------------------------
#set_property -dict {PACKAGE_PIN U8 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L3_AD15_U8_P}]
#set_property -dict {PACKAGE_PIN V8 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L3_AD15_V8_N}]
#set_property -dict {PACKAGE_PIN R8 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L4_AD7_ALERT_R8_P}]
#set_property -dict {PACKAGE_PIN T8 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L4_AD7_T8_N}]
#set_property -dict {PACKAGE_PIN R7 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L5_AD14_R7_P}]
#set_property -dict {PACKAGE_PIN T7 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L5_AD14_T7_N}]
#set_property -dict {PACKAGE_PIN K3 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L11_GC_K3_N}]
#set_property -dict {PACKAGE_PIN K4 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L11_GC_K4_P}]
#set_property -dict {PACKAGE_PIN F1 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L1_F1_N}]
#set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L1_G1_P}]
#set_property -dict {PACKAGE_PIN D1 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L2_D1_N}]
#set_property -dict {PACKAGE_PIN E1 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L2_E1_P}]
#set_property -dict {PACKAGE_PIN E2 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L3_AD15_E2_N}]
#set_property -dict {PACKAGE_PIN F2 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L3_AD15_F2_P}]
#set_property -dict {PACKAGE_PIN F3 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L4_AD7_F3_N}]
#set_property -dict {PACKAGE_PIN G3 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L4_AD7_G3_P}]
#set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L5_AD14_E3_N}]
#set_property -dict {PACKAGE_PIN E4 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L5_AD14_E4_P}]
#set_property -dict {PACKAGE_PIN C4 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L11_GC_C4_N}]
#set_property -dict {PACKAGE_PIN D4 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L11_GC_D4_P}]

#set_property -dict {PACKAGE_PIN E15 IOSTANDARD LVCMOS33} [get_ports {IO_BF_L8_HDGC_AD4_E15_N}]
#set_property -dict {PACKAGE_PIN F15 IOSTANDARD LVCMOS33} [get_ports {IO_BF_L8_HDGC_AD4_F15_P}]

## -------------------------------------------------------------------------------------------------
## bank 65
## -------------------------------------------------------------------------------------------------
##set_property -dict {PACKAGE_PIN W8 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L1_W8}]
##set_property -dict {PACKAGE_PIN Y8 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L1_Y8}]
#set_property -dict {PACKAGE_PIN H3 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L10_AD4_H3_N}]
#set_property -dict {PACKAGE_PIN H4 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L10_AD4_H4_P}]
#set_property -dict {PACKAGE_PIN L2 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L12_GC_L2_N}]
#set_property -dict {PACKAGE_PIN L3 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L12_GC_L3_P}]
#set_property -dict {PACKAGE_PIN L6 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L13_GC_L6_N}]
#set_property -dict {PACKAGE_PIN L7 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L13_GC_L7_P}]
#set_property -dict {PACKAGE_PIN L5 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L14_GC_L5_N}]
#set_property -dict {PACKAGE_PIN M6 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L14_GC_M6_P}]
#set_property -dict {PACKAGE_PIN N6 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L15_AD11_N6_N}]
#set_property -dict {PACKAGE_PIN N7 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L15_AD11_N7_P}]
#set_property -dict {PACKAGE_PIN P6 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L16_AD3_P6_N}]
#set_property -dict {PACKAGE_PIN P7 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L16_AD3_P7_P}]
#set_property -dict {PACKAGE_PIN N8 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L17_AD10_N8_N}]
#set_property -dict {PACKAGE_PIN N9 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L17_AD10_N9_P}]
#set_property -dict {PACKAGE_PIN L8 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L18_AD2_L8_N}]
#set_property -dict {PACKAGE_PIN M8 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L18_AD2_M8_P}]
#set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L19_AD9_J4_N}]
#set_property -dict {PACKAGE_PIN J5 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L19_AD9_J5_P}]
##set_property -dict {PACKAGE_PIN U9 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L2_U9}]
##set_property -dict {PACKAGE_PIN V9 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L2_V9}]
#set_property -dict {PACKAGE_PIN H6 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L20_AD1_H6_N}]
#set_property -dict {PACKAGE_PIN J6 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L20_AD1_J6_P}]
#set_property -dict {PACKAGE_PIN H7 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L21_AD8_H7_N}]
#set_property -dict {PACKAGE_PIN J7 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L21_AD8_J7_P}]
#set_property -dict {PACKAGE_PIN K7 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L22_AD0_K7_N}]
#set_property -dict {PACKAGE_PIN K8 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L22_AD0_K8_P}]
#set_property -dict {PACKAGE_PIN J9 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L23_J9_N}]
#set_property -dict {PACKAGE_PIN K9 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L23_SCLK_K9_P}]
#set_property -dict {PACKAGE_PIN H8 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L24_PERSTN_H8_N}]
#set_property -dict {PACKAGE_PIN H9 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L24_SDA_H9_P}]
#set_property -dict {PACKAGE_PIN R6 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L6_AD6_R6_P}]
#set_property -dict {PACKAGE_PIN T6 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L6_AD6_T6_N}]
#set_property -dict {PACKAGE_PIN K1 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L7_AD13_K1_N}]
#set_property -dict {PACKAGE_PIN L1 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L7_AD13_L1_P}]
#set_property -dict {PACKAGE_PIN H1 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L8_AD5_H1_N}]
#set_property -dict {PACKAGE_PIN J1 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L8_AD5_J1_P}]
#set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L9_AD12_J2_N}]
#set_property -dict {PACKAGE_PIN K2 IOSTANDARD LVCMOS18} [get_ports {IO_B65_L9_AD12_K2_P}]

## -------------------------------------------------------------------------------------------------
## bank 66
## -------------------------------------------------------------------------------------------------
#set_property -dict {PACKAGE_PIN F5 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L6_AD6_F5_N}]
#set_property -dict {PACKAGE_PIN G5 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L6_AD6_G5_P}]
#set_property -dict {PACKAGE_PIN B1 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L7_AD13_B1_N}]
#set_property -dict {PACKAGE_PIN C1 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L7_AD13_C1_P}]
#set_property -dict {PACKAGE_PIN A1 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L8_AD5_A1_N}]
#set_property -dict {PACKAGE_PIN A2 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L8_AD5_A2_P}]
#set_property -dict {PACKAGE_PIN A3 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L9_AD12_A3_N}]
#set_property -dict {PACKAGE_PIN B3 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L9_AD12_B3_P}]
#set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L10_AD4_A4_N}]
#set_property -dict {PACKAGE_PIN B4 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L10_AD4_B4_P}]
#set_property -dict {PACKAGE_PIN C2 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L12_GC_C2_N}]
#set_property -dict {PACKAGE_PIN C3 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L12_GC_C3_P}]
#set_property -dict {PACKAGE_PIN D6 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L13_GC_D6_N}]
#set_property -dict {PACKAGE_PIN D7 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L13_GC_D7_P}]
#set_property -dict {PACKAGE_PIN D5 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L14_GC_D5_N}]
#set_property -dict {PACKAGE_PIN E5 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L14_GC_E5_P}]
#set_property -dict {PACKAGE_PIN F6 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L15_AD11_F6_N}]
#set_property -dict {PACKAGE_PIN G6 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L15_AD11_G6_P}]
#set_property -dict {PACKAGE_PIN F7 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L16_AD3_F7_N}]
#set_property -dict {PACKAGE_PIN G8 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L16_AD3_G8_P}]
#set_property -dict {PACKAGE_PIN E8 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L17_AD10_E8_N}]
#set_property -dict {PACKAGE_PIN F8 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L17_AD10_F8_P}]
#set_property -dict {PACKAGE_PIN D9 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L18_AD2_D9_N}]
#set_property -dict {PACKAGE_PIN E9 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L18_AD2_E9_P}]
#set_property -dict {PACKAGE_PIN A5 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L19_AD9_A5_N}]
#set_property -dict {PACKAGE_PIN B5 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L19_AD9_B5_P}]
#set_property -dict {PACKAGE_PIN B6 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L20_AD1_B6_N}]
#set_property -dict {PACKAGE_PIN C6 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L20_AD1_C6_P}]
#set_property -dict {PACKAGE_PIN A6 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L21_AD8_A6_N}]
#set_property -dict {PACKAGE_PIN A7 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L21_AD8_A7_P}]
#set_property -dict {PACKAGE_PIN B8 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L22_AD0_B8_N}]
#set_property -dict {PACKAGE_PIN C8 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L22_AD0_C8_P}]
#set_property -dict {PACKAGE_PIN A8 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L23_A8_N}]
#set_property -dict {PACKAGE_PIN A9 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L23_A9_P}]
#set_property -dict {PACKAGE_PIN B9 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L24_B9_N}]
#set_property -dict {PACKAGE_PIN C9 IOSTANDARD LVCMOS18} [get_ports {IO_B66_L24_C9_P}]

## -------------------------------------------------------------------------------------------------
## bank N - 24 (ZU2/3) or 44 (ZU4/5)
## -------------------------------------------------------------------------------------------------
#set_property -dict {PACKAGE_PIN AE14 IOSTANDARD LVCMOS33} [get_ports {IO_BN_L1_AD15_AE14_N}]
#set_property -dict {PACKAGE_PIN AE15 IOSTANDARD LVCMOS33} [get_ports {IO_BN_L1_AD15_AE15_P}]
#set_property -dict {PACKAGE_PIN Y13  IOSTANDARD LVCMOS33} [get_ports {IO_BN_L10_AD10_Y13_N}]
#set_property -dict {PACKAGE_PIN Y14  IOSTANDARD LVCMOS33} [get_ports {IO_BN_L10_AD10_Y14_P}]
#set_property -dict {PACKAGE_PIN W11  IOSTANDARD LVCMOS33} [get_ports {IO_BN_L11_AD9_W11_N}]
#set_property -dict {PACKAGE_PIN W12  IOSTANDARD LVCMOS33} [get_ports {IO_BN_L11_AD9_W12_P}]
#set_property -dict {PACKAGE_PIN AA12 IOSTANDARD LVCMOS33} [get_ports {IO_BN_L12_AD8_AA12_N}]
#set_property -dict {PACKAGE_PIN Y12  IOSTANDARD LVCMOS33} [get_ports {IO_BN_L12_AD8_Y12_P}]
#set_property -dict {PACKAGE_PIN AG14 IOSTANDARD LVCMOS33} [get_ports {IO_BN_L2_AD14_AG14_P}]
#set_property -dict {PACKAGE_PIN AH14 IOSTANDARD LVCMOS33} [get_ports {IO_BN_L2_AD14_AH14_N}]
#set_property -dict {PACKAGE_PIN AG13 IOSTANDARD LVCMOS33} [get_ports {IO_BN_L3_AD13_AG13_P}]
#set_property -dict {PACKAGE_PIN AH13 IOSTANDARD LVCMOS33} [get_ports {IO_BN_L3_AD13_AH13_N}]
#set_property -dict {PACKAGE_PIN AE13 IOSTANDARD LVCMOS33} [get_ports {IO_BN_L4_AD12_AE13_P}]
#set_property -dict {PACKAGE_PIN AF13 IOSTANDARD LVCMOS33} [get_ports {IO_BN_L4_AD12_AF13_N}]
#set_property -dict {PACKAGE_PIN AD14 IOSTANDARD LVCMOS33} [get_ports {IO_BN_L5_HDGC_AD14_N}]
#set_property -dict {PACKAGE_PIN AD15 IOSTANDARD LVCMOS33} [get_ports {IO_BN_L5_HDGC_AD15_P}]
#set_property -dict {PACKAGE_PIN AC13 IOSTANDARD LVCMOS33} [get_ports {IO_BN_L6_HDGC_AC13_N}]
#set_property -dict {PACKAGE_PIN AC14 IOSTANDARD LVCMOS33} [get_ports {IO_BN_L6_HDGC_AC14_P}]
#set_property -dict {PACKAGE_PIN AA13 IOSTANDARD LVCMOS33} [get_ports {IO_BN_L7_HDGC_AA13_P}]
#set_property -dict {PACKAGE_PIN AB13 IOSTANDARD LVCMOS33} [get_ports {IO_BN_L7_HDGC_AB13_N}]
#set_property -dict {PACKAGE_PIN AB14 IOSTANDARD LVCMOS33} [get_ports {IO_BN_L8_HDGC_AB14_N}]
#set_property -dict {PACKAGE_PIN AB15 IOSTANDARD LVCMOS33} [get_ports {IO_BN_L8_HDGC_AB15_P}]
#set_property -dict {PACKAGE_PIN W13  IOSTANDARD LVCMOS33} [get_ports {IO_BN_L9_AD11_W13_N}]
#set_property -dict {PACKAGE_PIN W14  IOSTANDARD LVCMOS33} [get_ports {IO_BN_L9_AD11_W14_P}]

## -------------------------------------------------------------------------------------------------
## bank O - 44 (ZU2/3) or 43 (ZU4/5)
## -------------------------------------------------------------------------------------------------
#set_property -dict {PACKAGE_PIN AG10 IOSTANDARD LVCMOS33} [get_ports {IO_BO_L1_AD11_AG10_P}]
#set_property -dict {PACKAGE_PIN AH10 IOSTANDARD LVCMOS33} [get_ports {IO_BO_L1_AD11_AH10_N}]
#set_property -dict {PACKAGE_PIN W10  IOSTANDARD LVCMOS33} [get_ports {IO_BO_L10_AD2_W10_P}]
#set_property -dict {PACKAGE_PIN Y10  IOSTANDARD LVCMOS33} [get_ports {IO_BO_L10_AD2_Y10_N}]
#set_property -dict {PACKAGE_PIN AA8  IOSTANDARD LVCMOS33} [get_ports {IO_BO_L11_AD1_AA8_N}]
#set_property -dict {PACKAGE_PIN Y9   IOSTANDARD LVCMOS33} [get_ports {IO_BO_L11_AD1_Y9_P}]
#set_property -dict {PACKAGE_PIN AB10 IOSTANDARD LVCMOS33} [get_ports {IO_BO_L12_AD0_AB10_P}]
#set_property -dict {PACKAGE_PIN AB9  IOSTANDARD LVCMOS33} [get_ports {IO_BO_L12_AD0_AB9_N}]
#set_property -dict {PACKAGE_PIN AF11 IOSTANDARD LVCMOS33} [get_ports {IO_BO_L2_AD10_AF11_P}]
#set_property -dict {PACKAGE_PIN AG11 IOSTANDARD LVCMOS33} [get_ports {IO_BO_L2_AD10_AG11_N}]
#set_property -dict {PACKAGE_PIN AH11 IOSTANDARD LVCMOS33} [get_ports {IO_BO_L3_AD9_AH11_N}]
#set_property -dict {PACKAGE_PIN AH12 IOSTANDARD LVCMOS33} [get_ports {IO_BO_L3_AD9_AH12_P}]
#set_property -dict {PACKAGE_PIN AE10 IOSTANDARD LVCMOS33} [get_ports {IO_BO_L4_AD8_AE10_P}]
#set_property -dict {PACKAGE_PIN AF10 IOSTANDARD LVCMOS33} [get_ports {IO_BO_L4_AD8_AF10_N}]
#set_property -dict {PACKAGE_PIN AE12 IOSTANDARD LVCMOS33} [get_ports {IO_BO_L5_HDGC_AD7_AE12_P}]
#set_property -dict {PACKAGE_PIN AF12 IOSTANDARD LVCMOS33} [get_ports {IO_BO_L5_HDGC_AD7_AF12_N}]
#set_property -dict {PACKAGE_PIN AC12 IOSTANDARD LVCMOS33} [get_ports {IO_BO_L6_HDGC_AD6_AC12_P}]
#set_property -dict {PACKAGE_PIN AD12 IOSTANDARD LVCMOS33} [get_ports {IO_BO_L6_HDGC_AD6_AD12_N}]
#set_property -dict {PACKAGE_PIN AD10 IOSTANDARD LVCMOS33} [get_ports {IO_BO_L7_HDGC_AD5_AD10_N}]
#set_property -dict {PACKAGE_PIN AD11 IOSTANDARD LVCMOS33} [get_ports {IO_BO_L7_HDGC_AD5_AD11_P}]
#set_property -dict {PACKAGE_PIN AB11 IOSTANDARD LVCMOS33} [get_ports {IO_BO_L8_HDGC_AD4_AB11_P}]
#set_property -dict {PACKAGE_PIN AC11 IOSTANDARD LVCMOS33} [get_ports {IO_BO_L8_HDGC_AD4_AC11_N}]
#set_property -dict {PACKAGE_PIN AA10 IOSTANDARD LVCMOS33} [get_ports {IO_BO_L9_AD3_AA10_N}]
#set_property -dict {PACKAGE_PIN AA11 IOSTANDARD LVCMOS33} [get_ports {IO_BO_L9_AD3_AA11_P}]

## -------------------------------------------------------------------------------------------------
## Bank E - User I/Os
## bank 25 (ZU2/3) or 45 (ZU4/5)
## -------------------------------------------------------------------------------------------------

#set_property -dict {PACKAGE_PIN D11 IOSTANDARD LVCMOS33} [get_ports {IO_BE_L8_HDGC_D11_N}]
#set_property -dict {PACKAGE_PIN E12 IOSTANDARD LVCMOS33} [get_ports {IO_BE_L8_HDGC_E12_P}]
#set_property -dict {PACKAGE_PIN D10 IOSTANDARD LVCMOS33} [get_ports {IO_BE_L7_HDGC_D10_N}]
#set_property -dict {PACKAGE_PIN E10 IOSTANDARD LVCMOS33} [get_ports {IO_BE_L7_HDGC_E10_P}]

## -------------------------------------------------------------------------------------------------
## PS banks defined in the block design
## -------------------------------------------------------------------------------------------------

## RIXU - Gigabit transceivers
## Gets error  [Vivado 12-1815] Setting property 'IOSTANDARD' is not allowed for GT terminals. 

#set_property -dict {PACKAGE_PIN W3 IOSTANDARD LVCMOS18} [get_ports {B224_TXN_W3}]
#set_property -dict {PACKAGE_PIN W4 IOSTANDARD LVCMOS18} [get_ports {B224_TXP_W4}]
#set_property -dict {PACKAGE_PIN Y1 IOSTANDARD LVCMOS18} [get_ports {B224_RXN_Y1}]
#set_property -dict {PACKAGE_PIN Y2 IOSTANDARD LVCMOS18} [get_ports {B224_RXP_Y2}]
## END RIXU


# Anios_A
set_property -dict {PACKAGE_PIN W12   IOSTANDARD LVCMOS33  } [get_ports {XMC_JTAG_TMS}]
set_property -dict {PACKAGE_PIN W11   IOSTANDARD LVCMOS33  } [get_ports {XMC_JTAG_TCK}]
set_property -dict {PACKAGE_PIN AE15  IOSTANDARD LVCMOS33  } [get_ports {XMC_JTAG_TDO}]
set_property -dict {PACKAGE_PIN AE14  IOSTANDARD LVCMOS33  } [get_ports {XMC_JTAG_RST}]
set_property -dict {PACKAGE_PIN AE13  IOSTANDARD LVCMOS33  } [get_ports {OVER_TEMP_LED}]
#set_property -dict {PACKAGE_PIN AF13  IOSTANDARD LVCMOS33  } [get_ports {IOA_D5_N}]
set_property -dict {PACKAGE_PIN AG13  IOSTANDARD LVCMOS33  } [get_ports {VP2V5_PG}]
set_property -dict {PACKAGE_PIN AH13  IOSTANDARD LVCMOS33  } [get_ports {VP3V3_PG}]
set_property -dict {PACKAGE_PIN AB11  IOSTANDARD LVCMOS33  } [get_ports {VP12_EN3}]
set_property -dict {PACKAGE_PIN AC11  IOSTANDARD LVCMOS33  } [get_ports {VP12_EN2}]
set_property -dict {PACKAGE_PIN W14   IOSTANDARD LVCMOS33  } [get_ports {VP12_SYNC0}]
set_property -dict {PACKAGE_PIN W13   IOSTANDARD LVCMOS33  } [get_ports {VP12_SYNC1}]
set_property -dict {PACKAGE_PIN Y14   IOSTANDARD LVCMOS33  } [get_ports {VP12_SYNC2}]
set_property -dict {PACKAGE_PIN Y13   IOSTANDARD LVCMOS33  } [get_ports {VP12_SYNC3}]
set_property -dict {PACKAGE_PIN Y12   IOSTANDARD LVCMOS33  } [get_ports {VP12_SYNC4}]
set_property -dict {PACKAGE_PIN AA12  IOSTANDARD LVCMOS33  } [get_ports {VP12_SYNC5}]
set_property -dict {PACKAGE_PIN AG14  IOSTANDARD LVCMOS33  } [get_ports {VP12_SYNC6}]
set_property -dict {PACKAGE_PIN AH14  IOSTANDARD LVCMOS33  } [get_ports {OVER_TEMP0}]
set_property -dict {PACKAGE_PIN AA13  IOSTANDARD LVCMOS33  } [get_ports {OVER_TEMP1}]
set_property -dict {PACKAGE_PIN AB13  IOSTANDARD LVCMOS33  } [get_ports {OVER_TEMP2}]
set_property -dict {PACKAGE_PIN AD15  IOSTANDARD LVCMOS33  } [get_ports {VP2V5_ALERT}]
set_property -dict {PACKAGE_PIN AD14  IOSTANDARD LVCMOS33  } [get_ports {VP3V3_ALERT}]
set_property -dict {PACKAGE_PIN AD11  IOSTANDARD LVCMOS33  } [get_ports {VP12_IV_ALERT0}]
set_property -dict {PACKAGE_PIN AD10  IOSTANDARD LVCMOS33  } [get_ports {VP12_IV_ALERT1}]
set_property -dict {PACKAGE_PIN AB14  IOSTANDARD LVCMOS33  } [get_ports {WIB_PE_SEL}]
set_property -dict {PACKAGE_PIN AB15  IOSTANDARD LVCMOS33  } [get_ports {LV_SYNC}]

# Anios_B
set_property -dict {PACKAGE_PIN AA11  IOSTANDARD LVCMOS33  } [get_ports {VP12_EN1}]
set_property -dict {PACKAGE_PIN AA10  IOSTANDARD LVCMOS33  } [get_ports {VP12_EN0}]
set_property -dict {PACKAGE_PIN Y9    IOSTANDARD LVCMOS33  } [get_ports {SFP2_LOS}]
set_property -dict {PACKAGE_PIN AA8   IOSTANDARD LVCMOS33  } [get_ports {WIB_RX_SEL0}]
set_property -dict {PACKAGE_PIN W10   IOSTANDARD LVCMOS33  } [get_ports {WIB_RX_SEL1}]
set_property -dict {PACKAGE_PIN Y10   IOSTANDARD LVCMOS33  } [get_ports {WIB_RX_SEL2}]
set_property -dict {PACKAGE_PIN AC12  IOSTANDARD LVCMOS33  } [get_ports {SFP0_LOS}]
set_property -dict {PACKAGE_PIN AD12  IOSTANDARD LVCMOS33  } [get_ports {SFP0_TX_FAULT}]
set_property -dict {PACKAGE_PIN AG10  IOSTANDARD LVCMOS33  } [get_ports {VP12_IV_ALERT2}]
set_property -dict {PACKAGE_PIN AH10  IOSTANDARD LVCMOS33  } [get_ports {VP12_IV_ALERT3}]
set_property -dict {PACKAGE_PIN AE10  IOSTANDARD LVCMOS33  } [get_ports {VP12_IV_ALERT4}]
set_property -dict {PACKAGE_PIN AF10  IOSTANDARD LVCMOS33  } [get_ports {VP12_IV_ALERT5}]
set_property -dict {PACKAGE_PIN AH12  IOSTANDARD LVCMOS33  } [get_ports {VP12_IV_ALERT6}]
#set_property -dict {PACKAGE_PIN AH11  IOSTANDARD LVCMOS33  } [get_ports {IOB_D13_N}]
#set_property -dict {PACKAGE_PIN AF11  IOSTANDARD LVCMOS33  } [get_ports {IOB_D14_P}]
#set_property -dict {PACKAGE_PIN AG11  IOSTANDARD LVCMOS33  } [get_ports {IOB_D15_N}]
set_property -dict {PACKAGE_PIN AB10  IOSTANDARD LVCMOS33  } [get_ports {SOC_I2C_SW_RST}]
#set_property -dict {PACKAGE_PIN AB9   IOSTANDARD LVCMOS33  } [get_ports {IOB_D17_SC1_DIP2_N}]
set_property -dict {PACKAGE_PIN E10   IOSTANDARD LVCMOS33  } [get_ports {SFP1_TX_FAULT}]
set_property -dict {PACKAGE_PIN D10   IOSTANDARD LVCMOS33  } [get_ports {SFP2_TX_FAULT}]
set_property -dict {PACKAGE_PIN E12   IOSTANDARD LVCMOS33  } [get_ports {SFP2_TX_DISABLE}]
set_property -dict {PACKAGE_PIN D11   IOSTANDARD LVCMOS33  } [get_ports {SFP1_LOS}]
set_property -dict {PACKAGE_PIN AC13  IOSTANDARD LVCMOS33  } [get_ports {VP12_EN4}]
set_property -dict {PACKAGE_PIN AC14  IOSTANDARD LVCMOS33  } [get_ports {VP12_EN5}]
#if {$MGT_routing == "G1"} {
#  set_property -dict {PACKAGE_PIN F15   IOSTANDARD LVCMOS33  } [get_ports {IOB_D18_SC2_DIP3_N}]
#  set_property -dict {PACKAGE_PIN E15   IOSTANDARD LVCMOS33  } [get_ports {IOB_D19_SC3_DIP4_N}]
#}
# These pins are MIO40/41 on the XU5

# FMC0
#set_property -dict {PACKAGE_PIN N8    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA02_N}]
#set_property -dict {PACKAGE_PIN N9    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA02_P}]
#set_property -dict {PACKAGE_PIN N6    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA03_N}]
#set_property -dict {PACKAGE_PIN N7    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA03_P}]
#set_property -dict {PACKAGE_PIN L8    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA04_N}]
#set_property -dict {PACKAGE_PIN M8    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA04_P}]
#set_property -dict {PACKAGE_PIN J9    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA05_N}]
#set_property -dict {PACKAGE_PIN K9    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA05_P}]
#set_property -dict {PACKAGE_PIN K7    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA06_N}]
#set_property -dict {PACKAGE_PIN K8    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA06_P}]
#set_property -dict {PACKAGE_PIN H8    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA07_N}]
#set_property -dict {PACKAGE_PIN H9    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA07_P}]
set_property -dict {PACKAGE_PIN H7    IOSTANDARD LVCMOS18  } [get_ports {WIB_SCL}]
set_property -dict {PACKAGE_PIN J7    IOSTANDARD LVCMOS18  } [get_ports {WIB_SDA}]
#set_property -dict {PACKAGE_PIN H6    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA09_N}]
#set_property -dict {PACKAGE_PIN J6    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA09_P}]
set_property -dict {PACKAGE_PIN J4    IOSTANDARD LVCMOS18  } [get_ports {WIB_CLK_SEL}]
#set_property -dict {PACKAGE_PIN J5    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA10_P}]
set_property -dict {PACKAGE_PIN H3    IOSTANDARD LVDS      } [get_ports {SYS_CMD_N}]
set_property -dict {PACKAGE_PIN H4    IOSTANDARD LVDS      } [get_ports {SYS_CMD_P}]
set_property -dict {DIFF_TERM_ADV     TERM_100             } [get_ports {SYS_CMD_P}]
#set_property -dict {PACKAGE_PIN P6    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA12_N}]
#set_property -dict {PACKAGE_PIN P7    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA12_P}]
set_property -dict {PACKAGE_PIN J2    IOSTANDARD LVCMOS18  } [get_ports {BP_IO0}]
set_property -dict {PACKAGE_PIN K2    IOSTANDARD LVCMOS18  } [get_ports {BP_IO1}]
set_property -dict {PACKAGE_PIN H1    IOSTANDARD LVCMOS18  } [get_ports {BP_IO2}]
set_property -dict {PACKAGE_PIN J1    IOSTANDARD LVCMOS18  } [get_ports {BP_IO3}]
set_property -dict {PACKAGE_PIN K1    IOSTANDARD LVCMOS18  } [get_ports {BP_IO4}]
set_property -dict {PACKAGE_PIN L1    IOSTANDARD LVCMOS18  } [get_ports {BP_IO5}]
set_property -dict {PACKAGE_PIN T6    IOSTANDARD LVCMOS18  } [get_ports {BP_IO_OE}]
#set_property -dict {PACKAGE_PIN R6    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA16_P}]
#set_property -dict {PACKAGE_PIN F6    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA19_N}]
#set_property -dict {PACKAGE_PIN G6    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA19_P}]
#set_property -dict {PACKAGE_PIN F7    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA20_N}]
#set_property -dict {PACKAGE_PIN G8    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA20_P}]
#set_property -dict {PACKAGE_PIN E8    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA21_N}]
#set_property -dict {PACKAGE_PIN F8    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA21_P}]
#set_property -dict {PACKAGE_PIN D9    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA22_N}]
#set_property -dict {PACKAGE_PIN E9    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA22_P}]
#set_property -dict {PACKAGE_PIN B9    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA23_N}]
#set_property -dict {PACKAGE_PIN C9    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA23_P}]
#set_property -dict {PACKAGE_PIN B8    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA24_N}]
#set_property -dict {PACKAGE_PIN C8    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA24_P}]
#set_property -dict {PACKAGE_PIN A8    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA25_N}]
#set_property -dict {PACKAGE_PIN A9    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA25_P}]
#set_property -dict {PACKAGE_PIN A6    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA26_N}]
#set_property -dict {PACKAGE_PIN A7    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA26_P}]
#set_property -dict {PACKAGE_PIN B6    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA27_N}]
#set_property -dict {PACKAGE_PIN C6    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA27_P}]
#set_property -dict {PACKAGE_PIN A5    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA28_N}]
#set_property -dict {PACKAGE_PIN B5    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA28_P}]
#set_property -dict {PACKAGE_PIN A4    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA29_N}]
#set_property -dict {PACKAGE_PIN B4    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA29_P}]
#set_property -dict {PACKAGE_PIN A3    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA30_N}]
#set_property -dict {PACKAGE_PIN B3    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA30_P}]
#set_property -dict {PACKAGE_PIN A1    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA31_N}]
set_property -dict {PACKAGE_PIN A2    IOSTANDARD LVCMOS18  } [get_ports {WIB_TX_BACK}]
#set_property -dict {PACKAGE_PIN F5    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA32_N}]
#set_property -dict {PACKAGE_PIN G5    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA32_P}]
set_property -dict {PACKAGE_PIN B1    IOSTANDARD LVCMOS18  } [get_ports {EN_3V3}]
set_property -dict {PACKAGE_PIN C1    IOSTANDARD LVCMOS18  } [get_ports {EN_2V5}]
set_property -dict {PACKAGE_PIN L5    IOSTANDARD LVDS      } [get_ports {SYS_CLK_N}]
set_property -dict {PACKAGE_PIN M6    IOSTANDARD LVDS      } [get_ports {SYS_CLK_P}]
set_property -dict {DIFF_TERM_ADV     TERM_100             } [get_ports {SYS_CLK_P}]
#set_property -dict {PACKAGE_PIN L6    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA01_CC_N}]
#set_property -dict {PACKAGE_PIN L7    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA01_CC_P}]
#set_property -dict {PACKAGE_PIN D5    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA17_CC_N}]
#set_property -dict {PACKAGE_PIN E5    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA17_CC_P}]
#set_property -dict {PACKAGE_PIN D6    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA18_CC_N}]
#set_property -dict {PACKAGE_PIN D7    IOSTANDARD LVCMOS18  } [get_ports {FMC_LA18_CC_P}]
#set_property -dict {PACKAGE_PIN L2    IOSTANDARD LVCMOS18  } [get_ports {FMC_CLK0_M2C_N}]
#set_property -dict {PACKAGE_PIN L3    IOSTANDARD LVCMOS18  } [get_ports {FMC_CLK0_M2C_P}]
#set_property -dict {PACKAGE_PIN C2    IOSTANDARD LVCMOS18  } [get_ports {FMC_CLK1_M2C_N}]
#set_property -dict {PACKAGE_PIN C3    IOSTANDARD LVCMOS18  } [get_ports {FMC_CLK1_M2C_P}]

# I2C_PL
set_property -dict {PACKAGE_PIN D12   IOSTANDARD LVCMOS33  } [get_ports {I2C_SCL_PL}]
set_property -dict {PACKAGE_PIN C12   IOSTANDARD LVCMOS33  } [get_ports {I2C_SDA_PL}]

## IOC
#if {$MGT_routing == "G1"} {
#  set_property -dict {PACKAGE_PIN E1    IOSTANDARD LVCMOS18  } [get_ports {IOC_D0_P}]
#  set_property -dict {PACKAGE_PIN D1    IOSTANDARD LVCMOS18  } [get_ports {IOC_D1_N}]
#  set_property -dict {PACKAGE_PIN K4    IOSTANDARD LVCMOS18  } [get_ports {IOC_D2_P}]
#  set_property -dict {PACKAGE_PIN K3    IOSTANDARD LVCMOS18  } [get_ports {IOC_D3_N}]
#  set_property -dict {PACKAGE_PIN F2    IOSTANDARD LVCMOS18  } [get_ports {IOC_D4_P}]
#  set_property -dict {PACKAGE_PIN E2    IOSTANDARD LVCMOS18  } [get_ports {IOC_D5_N}]
#  set_property -dict {PACKAGE_PIN U8    IOSTANDARD LVCMOS18  } [get_ports {IOC_D6_P}]
#  set_property -dict {PACKAGE_PIN V8    IOSTANDARD LVCMOS18  } [get_ports {IOC_D7_N}]
#}

## IOD
#if {$MGT_routing == "G1"} {
#  set_property -dict {PACKAGE_PIN G3    IOSTANDARD LVCMOS18  } [get_ports {IOD_D0_P}]
#  set_property -dict {PACKAGE_PIN F3    IOSTANDARD LVCMOS18  } [get_ports {IOD_D1_N}]
#  set_property -dict {PACKAGE_PIN R8    IOSTANDARD LVCMOS18  } [get_ports {IOD_D2_P}]
#  set_property -dict {PACKAGE_PIN T8    IOSTANDARD LVCMOS18  } [get_ports {IOD_D3_N}]
#  set_property -dict {PACKAGE_PIN E4    IOSTANDARD LVCMOS18  } [get_ports {IOD_D4_P}]
#  set_property -dict {PACKAGE_PIN E3    IOSTANDARD LVCMOS18  } [get_ports {IOD_D5_N}]
#  set_property -dict {PACKAGE_PIN R7    IOSTANDARD LVCMOS18  } [get_ports {IOD_D6_P}]
#  set_property -dict {PACKAGE_PIN T7    IOSTANDARD LVCMOS18  } [get_ports {IOD_D7_N}]
#}

## IOE
#if {$MGT_routing == "G1"} {
#  set_property -dict {PACKAGE_PIN D4    IOSTANDARD LVCMOS18  } [get_ports {IOE_D0_LED0_N}]
#  set_property -dict {PACKAGE_PIN C4    IOSTANDARD LVCMOS18  } [get_ports {IOE_D1_LED1_N}]
#  set_property -dict {PACKAGE_PIN G1    IOSTANDARD LVCMOS18  } [get_ports {IOE_D2_LED2_N}]
#  set_property -dict {PACKAGE_PIN F1    IOSTANDARD LVCMOS18  } [get_ports {IOE_D3_LED3_N}]
#}

# LED
set_property -dict {PACKAGE_PIN H2    IOSTANDARD LVCMOS18  } [get_ports {LED1_N}]
set_property -dict {PACKAGE_PIN P9    IOSTANDARD LVCMOS18  } [get_ports {LED2_N}]
set_property -dict {PACKAGE_PIN K5    IOSTANDARD LVCMOS18  } [get_ports {LED3_N}]

# PL_100_MHz_Oscillator
set_property -dict {PACKAGE_PIN AD4   IOSTANDARD DIFF_SSTL12_DCI} [get_ports {CLK100_PL_N}]
set_property -dict {PACKAGE_PIN AD5   IOSTANDARD DIFF_SSTL12_DCI} [get_ports {CLK100_PL_P}]

# PL_DDR4_Memory
set_property INTERNAL_VREF 0.600 [get_iobanks 64]
set_property -dict {PACKAGE_PIN AH1   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_BA[0]}]
set_property -dict {PACKAGE_PIN AF1   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_BA[1]}]
set_property -dict {PACKAGE_PIN AG1   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_BG[0]}]
set_property -dict {PACKAGE_PIN AD9   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_BG[1]}]
set_property -dict {PACKAGE_PIN AH6   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_CKE[0]}]
set_property -dict {PACKAGE_PIN AB6   IOSTANDARD POD12_DCI } [get_ports {DDR4PL_DQ[0]}]
set_property -dict {PACKAGE_PIN AC6   IOSTANDARD POD12_DCI } [get_ports {DDR4PL_DQ[1]}]
set_property -dict {PACKAGE_PIN AE9   IOSTANDARD POD12_DCI } [get_ports {DDR4PL_DQ[2]}]
set_property -dict {PACKAGE_PIN AE8   IOSTANDARD POD12_DCI } [get_ports {DDR4PL_DQ[3]}]
set_property -dict {PACKAGE_PIN AB8   IOSTANDARD POD12_DCI } [get_ports {DDR4PL_DQ[4]}]
set_property -dict {PACKAGE_PIN AC8   IOSTANDARD POD12_DCI } [get_ports {DDR4PL_DQ[5]}]
set_property -dict {PACKAGE_PIN AB7   IOSTANDARD POD12_DCI } [get_ports {DDR4PL_DQ[6]}]
set_property -dict {PACKAGE_PIN AC7   IOSTANDARD POD12_DCI } [get_ports {DDR4PL_DQ[7]}]
set_property -dict {PACKAGE_PIN AE5   IOSTANDARD POD12_DCI } [get_ports {DDR4PL_DQ[8]}]
set_property -dict {PACKAGE_PIN AF5   IOSTANDARD POD12_DCI } [get_ports {DDR4PL_DQ[9]}]
set_property -dict {PACKAGE_PIN AE4   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_ODT[0]}]
set_property -dict {PACKAGE_PIN AC4   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_A[0]}]
set_property -dict {PACKAGE_PIN AC3   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_A[1]}]
set_property -dict {PACKAGE_PIN AB4   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_A[2]}]
set_property -dict {PACKAGE_PIN AB3   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_A[3]}]
set_property -dict {PACKAGE_PIN AB2   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_A[4]}]
set_property -dict {PACKAGE_PIN AC2   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_A[5]}]
set_property -dict {PACKAGE_PIN AB1   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_A[6]}]
set_property -dict {PACKAGE_PIN AC1   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_A[7]}]
set_property -dict {PACKAGE_PIN AB5   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_A[8]}]
set_property -dict {PACKAGE_PIN AG4   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_A[9]}]
set_property -dict {PACKAGE_PIN AD1   IOSTANDARD DIFF_SSTL12_DCI} [get_ports {DDR4PL_CK_N[0]}]
set_property -dict {PACKAGE_PIN AD2   IOSTANDARD DIFF_SSTL12_DCI} [get_ports {DDR4PL_CK_P[0]}]
set_property -dict {PACKAGE_PIN AH9   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_CS_N[0]}]
set_property -dict {PACKAGE_PIN AF8   IOSTANDARD POD12_DCI } [get_ports {DDR4PL_DQ[10]}]
set_property -dict {PACKAGE_PIN AG8   IOSTANDARD POD12_DCI } [get_ports {DDR4PL_DQ[11]}]
set_property -dict {PACKAGE_PIN AH8   IOSTANDARD POD12_DCI } [get_ports {DDR4PL_DQ[12]}]
set_property -dict {PACKAGE_PIN AH7   IOSTANDARD POD12_DCI } [get_ports {DDR4PL_DQ[13]}]
set_property -dict {PACKAGE_PIN AF7   IOSTANDARD POD12_DCI } [get_ports {DDR4PL_DQ[14]}]
set_property -dict {PACKAGE_PIN AF6   IOSTANDARD POD12_DCI } [get_ports {DDR4PL_DQ[15]}]
set_property -dict {PACKAGE_PIN AH2   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_ACT_N}]
set_property -dict {PACKAGE_PIN AH4   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_A[10]}]
set_property -dict {PACKAGE_PIN AG3   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_A[11]}]
set_property -dict {PACKAGE_PIN AH3   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_A[12]}]
set_property -dict {PACKAGE_PIN AE3   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_A[13]}]
set_property -dict {PACKAGE_PIN AF3   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_A[14]}]
set_property -dict {PACKAGE_PIN AE2   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_A[15]}]
set_property -dict {PACKAGE_PIN AF2   IOSTANDARD SSTL12_DCI} [get_ports {DDR4PL_A[16]}]
set_property -dict {PACKAGE_PIN AC9   IOSTANDARD POD12_DCI } [get_ports {DDR4PL_DM[0]}]
set_property -dict {PACKAGE_PIN AG9   IOSTANDARD POD12_DCI } [get_ports {DDR4PL_DM[1]}]
set_property -dict {PACKAGE_PIN AE7   IOSTANDARD DIFF_POD12_DCI} [get_ports {DDR4PL_DQS_N[0]}]
set_property -dict {PACKAGE_PIN AG5   IOSTANDARD DIFF_POD12_DCI} [get_ports {DDR4PL_DQS_N[1]}]
set_property -dict {PACKAGE_PIN AD7   IOSTANDARD DIFF_POD12_DCI} [get_ports {DDR4PL_DQS_P[0]}]
set_property -dict {PACKAGE_PIN AG6   IOSTANDARD DIFF_POD12_DCI} [get_ports {DDR4PL_DQS_P[1]}]
set_property -dict {PACKAGE_PIN G4    IOSTANDARD LVCMOS18  } [get_ports {DDR4PL_RST_N}]

# PL_Gigabit_Ethernet
#set_property SLEW FAST [get_ports {ETH1_RXD[0]}]
#set_property SLEW FAST [get_ports {ETH1_RXD[1]}]
#set_property SLEW FAST [get_ports {ETH1_RXD[2]}]
#set_property SLEW FAST [get_ports {ETH1_RXD[3]}]
#set_property SLEW FAST [get_ports {ETH1_RXCTL}]
#set_property SLEW FAST [get_ports {ETH1_RXCLK}]
#set_property SLEW FAST [get_ports {ETH1_TXD[0]}]
#set_property SLEW FAST [get_ports {ETH1_TXD[1]}]
#set_property SLEW FAST [get_ports {ETH1_TXD[2]}]
#set_property SLEW FAST [get_ports {ETH1_TXD[3]}]
#set_property SLEW FAST [get_ports {ETH1_TXCTL}]
#set_property SLEW FAST [get_ports {ETH1_TXCLK}]
#set_property -dict {PACKAGE_PIN A10   IOSTANDARD LVCMOS33  } [get_ports {ETH1_MDC}]
#set_property -dict {PACKAGE_PIN J11   IOSTANDARD LVCMOS33  } [get_ports {ETH1_RXD[0]}]
#set_property -dict {PACKAGE_PIN J10   IOSTANDARD LVCMOS33  } [get_ports {ETH1_RXD[1]}]
#set_property -dict {PACKAGE_PIN K13   IOSTANDARD LVCMOS33  } [get_ports {ETH1_RXD[2]}]
#set_property -dict {PACKAGE_PIN K12   IOSTANDARD LVCMOS33  } [get_ports {ETH1_RXD[3]}]
#set_property -dict {PACKAGE_PIN G11   IOSTANDARD LVCMOS33  } [get_ports {ETH1_RXCLK}]
#set_property -dict {PACKAGE_PIN H11   IOSTANDARD LVCMOS33  } [get_ports {ETH1_TXD[0]}]
#set_property -dict {PACKAGE_PIN G10   IOSTANDARD LVCMOS33  } [get_ports {ETH1_TXD[1]}]
#set_property -dict {PACKAGE_PIN J12   IOSTANDARD LVCMOS33  } [get_ports {ETH1_TXD[2]}]
#set_property -dict {PACKAGE_PIN H12   IOSTANDARD LVCMOS33  } [get_ports {ETH1_TXD[3]}]
#set_property -dict {PACKAGE_PIN F12   IOSTANDARD LVCMOS33  } [get_ports {ETH1_TXCLK}]
#set_property -dict {PACKAGE_PIN B11   IOSTANDARD LVCMOS33  } [get_ports {ETH1_MDIO}]
#set_property -dict {PACKAGE_PIN C11   IOSTANDARD LVCMOS33  } [get_ports {ETH1_INT_N}]
#set_property -dict {PACKAGE_PIN B10   IOSTANDARD LVCMOS33  } [get_ports {ETH1_RESET_N}]
#set_property -dict {PACKAGE_PIN F10   IOSTANDARD LVCMOS33  } [get_ports {ETH1_RXCTL}]
#set_property -dict {PACKAGE_PIN F11   IOSTANDARD LVCMOS33  } [get_ports {ETH1_TXCTL}]
