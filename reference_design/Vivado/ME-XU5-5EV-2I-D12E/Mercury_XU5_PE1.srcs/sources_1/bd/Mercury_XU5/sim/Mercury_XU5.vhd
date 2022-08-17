--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
--Date        : Wed Aug 17 15:08:41 2022
--Host        : lxeng99 running 64-bit Ubuntu 16.04.6 LTS
--Command     : generate_target Mercury_XU5.bd
--Design      : Mercury_XU5
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Mercury_XU5 is
  port (
    C0_DDR4_act_n : out STD_LOGIC;
    C0_DDR4_adr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    C0_DDR4_ba : out STD_LOGIC_VECTOR ( 1 downto 0 );
    C0_DDR4_bg : out STD_LOGIC_VECTOR ( 0 to 0 );
    C0_DDR4_ck_c : out STD_LOGIC_VECTOR ( 0 to 0 );
    C0_DDR4_ck_t : out STD_LOGIC_VECTOR ( 0 to 0 );
    C0_DDR4_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    C0_DDR4_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    C0_DDR4_dm_n : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    C0_DDR4_dq : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    C0_DDR4_dqs_c : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    C0_DDR4_dqs_t : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    C0_DDR4_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    C0_DDR4_reset_n : out STD_LOGIC;
    C0_SYS_CLK_clk_n : in STD_LOGIC;
    C0_SYS_CLK_clk_p : in STD_LOGIC;
    Clk100 : out STD_LOGIC;
    Clk50 : out STD_LOGIC;
    ETH_CLK10 : out STD_LOGIC;
    ETH_CLK125 : out STD_LOGIC;
    ETH_CLK125_90 : out STD_LOGIC;
    ETH_CLK25 : out STD_LOGIC;
    ETH_resetn : out STD_LOGIC;
    GMII_col : in STD_LOGIC;
    GMII_crs : in STD_LOGIC;
    GMII_rx_clk : in STD_LOGIC;
    GMII_rx_dv : in STD_LOGIC;
    GMII_rx_er : in STD_LOGIC;
    GMII_rxd : in STD_LOGIC_VECTOR ( 7 downto 0 );
    GMII_speed_mode : out STD_LOGIC_VECTOR ( 2 downto 0 );
    GMII_tx_clk : in STD_LOGIC;
    GMII_tx_en : out STD_LOGIC;
    GMII_tx_er : out STD_LOGIC;
    GMII_txd : out STD_LOGIC_VECTOR ( 7 downto 0 );
    LED_N : out STD_LOGIC_VECTOR ( 1 downto 0 );
    MDIO_mdc : out STD_LOGIC;
    MDIO_mdio_i : in STD_LOGIC;
    MDIO_mdio_o : out STD_LOGIC;
    MDIO_mdio_t : out STD_LOGIC;
    Rst_N : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of Mercury_XU5 : entity is "Mercury_XU5,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=Mercury_XU5,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=9,numReposBlks=9,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of Mercury_XU5 : entity is "Mercury_XU5.hwdef";
end Mercury_XU5;

architecture STRUCTURE of Mercury_XU5 is
  component Mercury_XU5_zynq_ultra_ps_e_0 is
  port (
    maxihpm0_fpd_aclk : in STD_LOGIC;
    maxigp0_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    maxigp0_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    maxigp0_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp0_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp0_awlock : out STD_LOGIC;
    maxigp0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp0_awvalid : out STD_LOGIC;
    maxigp0_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_awready : in STD_LOGIC;
    maxigp0_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    maxigp0_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_wlast : out STD_LOGIC;
    maxigp0_wvalid : out STD_LOGIC;
    maxigp0_wready : in STD_LOGIC;
    maxigp0_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp0_bvalid : in STD_LOGIC;
    maxigp0_bready : out STD_LOGIC;
    maxigp0_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    maxigp0_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    maxigp0_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp0_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp0_arlock : out STD_LOGIC;
    maxigp0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp0_arvalid : out STD_LOGIC;
    maxigp0_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_arready : in STD_LOGIC;
    maxigp0_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    maxigp0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp0_rlast : in STD_LOGIC;
    maxigp0_rvalid : in STD_LOGIC;
    maxigp0_rready : out STD_LOGIC;
    maxigp0_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp0_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxihpm0_lpd_aclk : in STD_LOGIC;
    maxigp2_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp2_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    maxigp2_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    maxigp2_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp2_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp2_awlock : out STD_LOGIC;
    maxigp2_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp2_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp2_awvalid : out STD_LOGIC;
    maxigp2_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp2_awready : in STD_LOGIC;
    maxigp2_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    maxigp2_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp2_wlast : out STD_LOGIC;
    maxigp2_wvalid : out STD_LOGIC;
    maxigp2_wready : in STD_LOGIC;
    maxigp2_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp2_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp2_bvalid : in STD_LOGIC;
    maxigp2_bready : out STD_LOGIC;
    maxigp2_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp2_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    maxigp2_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    maxigp2_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp2_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp2_arlock : out STD_LOGIC;
    maxigp2_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp2_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp2_arvalid : out STD_LOGIC;
    maxigp2_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp2_arready : in STD_LOGIC;
    maxigp2_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp2_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    maxigp2_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp2_rlast : in STD_LOGIC;
    maxigp2_rvalid : in STD_LOGIC;
    maxigp2_rready : out STD_LOGIC;
    maxigp2_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp2_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    emio_enet1_gmii_rx_clk : in STD_LOGIC;
    emio_enet1_speed_mode : out STD_LOGIC_VECTOR ( 2 downto 0 );
    emio_enet1_gmii_crs : in STD_LOGIC;
    emio_enet1_gmii_col : in STD_LOGIC;
    emio_enet1_gmii_rxd : in STD_LOGIC_VECTOR ( 7 downto 0 );
    emio_enet1_gmii_rx_er : in STD_LOGIC;
    emio_enet1_gmii_rx_dv : in STD_LOGIC;
    emio_enet1_gmii_tx_clk : in STD_LOGIC;
    emio_enet1_gmii_txd : out STD_LOGIC_VECTOR ( 7 downto 0 );
    emio_enet1_gmii_tx_en : out STD_LOGIC;
    emio_enet1_gmii_tx_er : out STD_LOGIC;
    emio_enet1_mdio_mdc : out STD_LOGIC;
    emio_enet1_mdio_i : in STD_LOGIC;
    emio_enet1_mdio_o : out STD_LOGIC;
    emio_enet1_mdio_t : out STD_LOGIC;
    emio_enet1_tsu_inc_ctrl : in STD_LOGIC_VECTOR ( 1 downto 0 );
    emio_enet1_tsu_timer_cmp_val : out STD_LOGIC;
    emio_enet0_enet_tsu_timer_cnt : out STD_LOGIC_VECTOR ( 93 downto 0 );
    emio_enet1_ext_int_in : in STD_LOGIC;
    emio_enet1_dma_bus_width : out STD_LOGIC_VECTOR ( 1 downto 0 );
    pl_resetn0 : out STD_LOGIC;
    pl_clk0 : out STD_LOGIC;
    pl_clk1 : out STD_LOGIC
  );
  end component Mercury_XU5_zynq_ultra_ps_e_0;
  component Mercury_XU5_system_management_wiz_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    ip2intc_irpt : out STD_LOGIC;
    user_temp_alarm_out : out STD_LOGIC;
    vccint_alarm_out : out STD_LOGIC;
    vccpsintlp_alarm_out : out STD_LOGIC;
    vccpsintfp_alarm_out : out STD_LOGIC;
    vccpsaux_alarm_out : out STD_LOGIC;
    vccaux_alarm_out : out STD_LOGIC;
    ot_out : out STD_LOGIC;
    channel_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    eoc_out : out STD_LOGIC;
    alarm_out : out STD_LOGIC;
    eos_out : out STD_LOGIC;
    busy_out : out STD_LOGIC
  );
  end component Mercury_XU5_system_management_wiz_0;
  component Mercury_XU5_led_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    gpio_io_o : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component Mercury_XU5_led_0;
  component Mercury_XU5_ddr4_0 is
  port (
    c0_init_calib_complete : out STD_LOGIC;
    dbg_clk : out STD_LOGIC;
    c0_sys_clk_p : in STD_LOGIC;
    c0_sys_clk_n : in STD_LOGIC;
    dbg_bus : out STD_LOGIC_VECTOR ( 511 downto 0 );
    c0_ddr4_adr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    c0_ddr4_ba : out STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_dm_dbi_n : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_dq : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    c0_ddr4_dqs_c : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_dqs_t : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_bg : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_reset_n : out STD_LOGIC;
    c0_ddr4_act_n : out STD_LOGIC;
    c0_ddr4_ck_c : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_ck_t : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_ui_clk : out STD_LOGIC;
    c0_ddr4_ui_clk_sync_rst : out STD_LOGIC;
    c0_ddr4_aresetn : in STD_LOGIC;
    c0_ddr4_s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_s_axi_awaddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    c0_ddr4_s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    c0_ddr4_s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    c0_ddr4_s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    c0_ddr4_s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    c0_ddr4_s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    c0_ddr4_s_axi_awvalid : in STD_LOGIC;
    c0_ddr4_s_axi_awready : out STD_LOGIC;
    c0_ddr4_s_axi_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    c0_ddr4_s_axi_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    c0_ddr4_s_axi_wlast : in STD_LOGIC;
    c0_ddr4_s_axi_wvalid : in STD_LOGIC;
    c0_ddr4_s_axi_wready : out STD_LOGIC;
    c0_ddr4_s_axi_bready : in STD_LOGIC;
    c0_ddr4_s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_s_axi_bvalid : out STD_LOGIC;
    c0_ddr4_s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_s_axi_araddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    c0_ddr4_s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    c0_ddr4_s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    c0_ddr4_s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    c0_ddr4_s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    c0_ddr4_s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    c0_ddr4_s_axi_arvalid : in STD_LOGIC;
    c0_ddr4_s_axi_arready : out STD_LOGIC;
    c0_ddr4_s_axi_rready : in STD_LOGIC;
    c0_ddr4_s_axi_rlast : out STD_LOGIC;
    c0_ddr4_s_axi_rvalid : out STD_LOGIC;
    c0_ddr4_s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_s_axi_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    sys_rst : in STD_LOGIC
  );
  end component Mercury_XU5_ddr4_0;
  component Mercury_XU5_smartconnect_1_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    S00_AXI_awid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awuser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wvalid : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_bid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_arid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_aruser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_rid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 29 downto 0 );
    M00_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M00_AXI_wlast : out STD_LOGIC;
    M00_AXI_wvalid : out STD_LOGIC;
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 29 downto 0 );
    M00_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rlast : in STD_LOGIC;
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_rready : out STD_LOGIC
  );
  end component Mercury_XU5_smartconnect_1_0;
  component Mercury_XU5_clk_wiz_0_0 is
  port (
    resetn : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    clk_out3 : out STD_LOGIC;
    clk_out4 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component Mercury_XU5_clk_wiz_0_0;
  component Mercury_XU5_smartconnect_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    S00_AXI_awid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awuser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wvalid : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_bid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_arid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_aruser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_rid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 12 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 12 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_rready : out STD_LOGIC;
    M01_AXI_awaddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M01_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_awvalid : out STD_LOGIC;
    M01_AXI_awready : in STD_LOGIC;
    M01_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_wvalid : out STD_LOGIC;
    M01_AXI_wready : in STD_LOGIC;
    M01_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_bvalid : in STD_LOGIC;
    M01_AXI_bready : out STD_LOGIC;
    M01_AXI_araddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M01_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_arvalid : out STD_LOGIC;
    M01_AXI_arready : in STD_LOGIC;
    M01_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_rvalid : in STD_LOGIC;
    M01_AXI_rready : out STD_LOGIC
  );
  end component Mercury_XU5_smartconnect_0_0;
  component Mercury_XU5_ps_sys_rst_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component Mercury_XU5_ps_sys_rst_0;
  component Mercury_XU5_ddr4_sys_rst_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component Mercury_XU5_ddr4_sys_rst_0;
  signal C0_SYS_CLK_1_CLK_N : STD_LOGIC;
  signal C0_SYS_CLK_1_CLK_P : STD_LOGIC;
  signal CLK_ETH10 : STD_LOGIC;
  signal CLK_ETH125_90 : STD_LOGIC;
  signal CLK_ETH25 : STD_LOGIC;
  signal clk_wiz_0_locked : STD_LOGIC;
  signal ddr4_C0_DDR4_ACT_N : STD_LOGIC;
  signal ddr4_C0_DDR4_ADR : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal ddr4_C0_DDR4_BA : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ddr4_C0_DDR4_BG : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_C0_DDR4_CKE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_C0_DDR4_CK_C : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_C0_DDR4_CK_T : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_C0_DDR4_CS_N : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_C0_DDR4_DM_N : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ddr4_C0_DDR4_DQ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ddr4_C0_DDR4_DQS_C : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ddr4_C0_DDR4_DQS_T : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ddr4_C0_DDR4_ODT : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_C0_DDR4_RESET_N : STD_LOGIC;
  signal ddr4_c0_ddr4_ui_clk : STD_LOGIC;
  signal ddr4_sys_rst_interconnect_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_sys_rst_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_sys_rst_peripheral_reset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal led_gpio_io_o : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps_sys_rst_interconnect_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ps_sys_rst_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal smartconnect_0_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal smartconnect_0_M00_AXI_ARREADY : STD_LOGIC;
  signal smartconnect_0_M00_AXI_ARVALID : STD_LOGIC;
  signal smartconnect_0_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal smartconnect_0_M00_AXI_AWREADY : STD_LOGIC;
  signal smartconnect_0_M00_AXI_AWVALID : STD_LOGIC;
  signal smartconnect_0_M00_AXI_BREADY : STD_LOGIC;
  signal smartconnect_0_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_0_M00_AXI_BVALID : STD_LOGIC;
  signal smartconnect_0_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_0_M00_AXI_RREADY : STD_LOGIC;
  signal smartconnect_0_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_0_M00_AXI_RVALID : STD_LOGIC;
  signal smartconnect_0_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_0_M00_AXI_WREADY : STD_LOGIC;
  signal smartconnect_0_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_0_M00_AXI_WVALID : STD_LOGIC;
  signal smartconnect_0_M01_AXI_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal smartconnect_0_M01_AXI_ARREADY : STD_LOGIC;
  signal smartconnect_0_M01_AXI_ARVALID : STD_LOGIC;
  signal smartconnect_0_M01_AXI_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal smartconnect_0_M01_AXI_AWREADY : STD_LOGIC;
  signal smartconnect_0_M01_AXI_AWVALID : STD_LOGIC;
  signal smartconnect_0_M01_AXI_BREADY : STD_LOGIC;
  signal smartconnect_0_M01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_0_M01_AXI_BVALID : STD_LOGIC;
  signal smartconnect_0_M01_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_0_M01_AXI_RREADY : STD_LOGIC;
  signal smartconnect_0_M01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_0_M01_AXI_RVALID : STD_LOGIC;
  signal smartconnect_0_M01_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal smartconnect_0_M01_AXI_WREADY : STD_LOGIC;
  signal smartconnect_0_M01_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_0_M01_AXI_WVALID : STD_LOGIC;
  signal smartconnect_1_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal smartconnect_1_M00_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M00_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M00_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal smartconnect_1_M00_AXI_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal smartconnect_1_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M00_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M00_AXI_ARREADY : STD_LOGIC;
  signal smartconnect_1_M00_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M00_AXI_ARVALID : STD_LOGIC;
  signal smartconnect_1_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal smartconnect_1_M00_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M00_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M00_AXI_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal smartconnect_1_M00_AXI_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal smartconnect_1_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M00_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal smartconnect_1_M00_AXI_AWREADY : STD_LOGIC;
  signal smartconnect_1_M00_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal smartconnect_1_M00_AXI_AWVALID : STD_LOGIC;
  signal smartconnect_1_M00_AXI_BREADY : STD_LOGIC;
  signal smartconnect_1_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M00_AXI_BVALID : STD_LOGIC;
  signal smartconnect_1_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal smartconnect_1_M00_AXI_RLAST : STD_LOGIC;
  signal smartconnect_1_M00_AXI_RREADY : STD_LOGIC;
  signal smartconnect_1_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smartconnect_1_M00_AXI_RVALID : STD_LOGIC;
  signal smartconnect_1_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal smartconnect_1_M00_AXI_WLAST : STD_LOGIC;
  signal smartconnect_1_M00_AXI_WREADY : STD_LOGIC;
  signal smartconnect_1_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal smartconnect_1_M00_AXI_WVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_GMII_ENET1_COL : STD_LOGIC;
  signal zynq_ultra_ps_e_GMII_ENET1_CRS : STD_LOGIC;
  signal zynq_ultra_ps_e_GMII_ENET1_RXD : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal zynq_ultra_ps_e_GMII_ENET1_RX_CLK : STD_LOGIC;
  signal zynq_ultra_ps_e_GMII_ENET1_RX_DV : STD_LOGIC;
  signal zynq_ultra_ps_e_GMII_ENET1_RX_ER : STD_LOGIC;
  signal zynq_ultra_ps_e_GMII_ENET1_SPEED_MODE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_GMII_ENET1_TXD : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal zynq_ultra_ps_e_GMII_ENET1_TX_CLK : STD_LOGIC;
  signal zynq_ultra_ps_e_GMII_ENET1_TX_EN : STD_LOGIC;
  signal zynq_ultra_ps_e_GMII_ENET1_TX_ER : STD_LOGIC;
  signal zynq_ultra_ps_e_MDIO_ENET1_MDC : STD_LOGIC;
  signal zynq_ultra_ps_e_MDIO_ENET1_MDIO_I : STD_LOGIC;
  signal zynq_ultra_ps_e_MDIO_ENET1_MDIO_O : STD_LOGIC;
  signal zynq_ultra_ps_e_MDIO_ENET1_MDIO_T : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARLOCK : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARUSER : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWLOCK : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWUSER : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_BREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_BVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_RDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_RLAST : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_RREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_RVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_WDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_WLAST : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_WREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_WSTRB : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_FPD_WVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARLOCK : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARUSER : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWLOCK : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWUSER : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_BREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_BVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_RLAST : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_RREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_RVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_WLAST : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_WREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_M_AXI_HPM0_LPD_WVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_pl_clk0 : STD_LOGIC;
  signal zynq_ultra_ps_e_pl_clk1 : STD_LOGIC;
  signal zynq_ultra_ps_e_pl_resetn0 : STD_LOGIC;
  signal NLW_ddr4_c0_ddr4_ui_clk_sync_rst_UNCONNECTED : STD_LOGIC;
  signal NLW_ddr4_c0_init_calib_complete_UNCONNECTED : STD_LOGIC;
  signal NLW_ddr4_dbg_clk_UNCONNECTED : STD_LOGIC;
  signal NLW_ddr4_c0_ddr4_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_ddr4_c0_ddr4_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_ddr4_dbg_bus_UNCONNECTED : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal NLW_ddr4_sys_rst_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_ddr4_sys_rst_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_ps_sys_rst_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_ps_sys_rst_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_ps_sys_rst_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_smartconnect_0_M00_AXI_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_smartconnect_0_M00_AXI_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_smartconnect_0_M01_AXI_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_smartconnect_0_M01_AXI_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_smartconnect_1_M00_AXI_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_smartconnect_1_M00_AXI_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_system_management_wiz_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_busy_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_eoc_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_eos_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_ip2intc_irpt_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_ot_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_user_temp_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_vccaux_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_vccint_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_vccpsaux_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_vccpsintfp_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_vccpsintlp_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_system_management_wiz_channel_out_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_zynq_ultra_ps_e_emio_enet1_tsu_timer_cmp_val_UNCONNECTED : STD_LOGIC;
  signal NLW_zynq_ultra_ps_e_emio_enet0_enet_tsu_timer_cnt_UNCONNECTED : STD_LOGIC_VECTOR ( 93 downto 0 );
  signal NLW_zynq_ultra_ps_e_emio_enet1_dma_bus_width_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of C0_DDR4_act_n : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 ACT_N";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of C0_DDR4_act_n : signal is "XIL_INTERFACENAME C0_DDR4, AXI_ARBITRATION_SCHEME RD_PRI_REG, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 17, CAS_WRITE_LATENCY 12, CS_ENABLED true, CUSTOM_PARTS no_file_loaded, DATA_MASK_ENABLED DM_NO_DBI, DATA_WIDTH 16, MEMORY_PART MT40A512M16HA-083E, MEMORY_TYPE Components, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 833";
  attribute X_INTERFACE_INFO of C0_DDR4_reset_n : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 RESET_N";
  attribute X_INTERFACE_INFO of C0_SYS_CLK_clk_n : signal is "xilinx.com:interface:diff_clock:1.0 C0_SYS_CLK CLK_N";
  attribute X_INTERFACE_PARAMETER of C0_SYS_CLK_clk_n : signal is "XIL_INTERFACENAME C0_SYS_CLK, CAN_DEBUG false, FREQ_HZ 100000000";
  attribute X_INTERFACE_INFO of C0_SYS_CLK_clk_p : signal is "xilinx.com:interface:diff_clock:1.0 C0_SYS_CLK CLK_P";
  attribute X_INTERFACE_INFO of Clk100 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK100 CLK";
  attribute X_INTERFACE_PARAMETER of Clk100 : signal is "XIL_INTERFACENAME CLK.CLK100, CLK_DOMAIN Mercury_XU5_zynq_ultra_ps_e_0_pl_clk0, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of Clk50 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK50 CLK";
  attribute X_INTERFACE_PARAMETER of Clk50 : signal is "XIL_INTERFACENAME CLK.CLK50, CLK_DOMAIN Mercury_XU5_zynq_ultra_ps_e_0_pl_clk1, FREQ_HZ 49999500, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of ETH_CLK10 : signal is "xilinx.com:signal:clock:1.0 CLK.ETH_CLK10 CLK";
  attribute X_INTERFACE_PARAMETER of ETH_CLK10 : signal is "XIL_INTERFACENAME CLK.ETH_CLK10, CLK_DOMAIN Mercury_XU5_clk_wiz_0_0_clk_out1, FREQ_HZ 9999900, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of ETH_CLK125 : signal is "xilinx.com:signal:clock:1.0 CLK.ETH_CLK125 CLK";
  attribute X_INTERFACE_PARAMETER of ETH_CLK125 : signal is "XIL_INTERFACENAME CLK.ETH_CLK125, CLK_DOMAIN Mercury_XU5_clk_wiz_0_0_clk_out1, FREQ_HZ 124998750, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of ETH_CLK125_90 : signal is "xilinx.com:signal:clock:1.0 CLK.ETH_CLK125_90 CLK";
  attribute X_INTERFACE_PARAMETER of ETH_CLK125_90 : signal is "XIL_INTERFACENAME CLK.ETH_CLK125_90, CLK_DOMAIN Mercury_XU5_clk_wiz_0_0_clk_out1, FREQ_HZ 124998750, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 90.0";
  attribute X_INTERFACE_INFO of ETH_CLK25 : signal is "xilinx.com:signal:clock:1.0 CLK.ETH_CLK25 CLK";
  attribute X_INTERFACE_PARAMETER of ETH_CLK25 : signal is "XIL_INTERFACENAME CLK.ETH_CLK25, CLK_DOMAIN Mercury_XU5_clk_wiz_0_0_clk_out1, FREQ_HZ 24999750, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of GMII_col : signal is "xilinx.com:interface:gmii:1.0 GMII COL";
  attribute X_INTERFACE_INFO of GMII_crs : signal is "xilinx.com:interface:gmii:1.0 GMII CRS";
  attribute X_INTERFACE_INFO of GMII_rx_clk : signal is "xilinx.com:interface:gmii:1.0 GMII RX_CLK";
  attribute X_INTERFACE_INFO of GMII_rx_dv : signal is "xilinx.com:interface:gmii:1.0 GMII RX_DV";
  attribute X_INTERFACE_INFO of GMII_rx_er : signal is "xilinx.com:interface:gmii:1.0 GMII RX_ER";
  attribute X_INTERFACE_INFO of GMII_tx_clk : signal is "xilinx.com:interface:gmii:1.0 GMII TX_CLK";
  attribute X_INTERFACE_INFO of GMII_tx_en : signal is "xilinx.com:interface:gmii:1.0 GMII TX_EN";
  attribute X_INTERFACE_INFO of GMII_tx_er : signal is "xilinx.com:interface:gmii:1.0 GMII TX_ER";
  attribute X_INTERFACE_INFO of MDIO_mdc : signal is "xilinx.com:interface:mdio:1.0 MDIO MDC";
  attribute X_INTERFACE_PARAMETER of MDIO_mdc : signal is "XIL_INTERFACENAME MDIO, CAN_DEBUG false";
  attribute X_INTERFACE_INFO of MDIO_mdio_i : signal is "xilinx.com:interface:mdio:1.0 MDIO MDIO_I";
  attribute X_INTERFACE_INFO of MDIO_mdio_o : signal is "xilinx.com:interface:mdio:1.0 MDIO MDIO_O";
  attribute X_INTERFACE_INFO of MDIO_mdio_t : signal is "xilinx.com:interface:mdio:1.0 MDIO MDIO_T";
  attribute X_INTERFACE_INFO of Rst_N : signal is "xilinx.com:signal:reset:1.0 RST.RST_N RST";
  attribute X_INTERFACE_PARAMETER of Rst_N : signal is "XIL_INTERFACENAME RST.RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of C0_DDR4_adr : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 ADR";
  attribute X_INTERFACE_INFO of C0_DDR4_ba : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 BA";
  attribute X_INTERFACE_INFO of C0_DDR4_bg : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 BG";
  attribute X_INTERFACE_INFO of C0_DDR4_ck_c : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 CK_C";
  attribute X_INTERFACE_INFO of C0_DDR4_ck_t : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 CK_T";
  attribute X_INTERFACE_INFO of C0_DDR4_cke : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 CKE";
  attribute X_INTERFACE_INFO of C0_DDR4_cs_n : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 CS_N";
  attribute X_INTERFACE_INFO of C0_DDR4_dm_n : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 DM_N";
  attribute X_INTERFACE_INFO of C0_DDR4_dq : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 DQ";
  attribute X_INTERFACE_INFO of C0_DDR4_dqs_c : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 DQS_C";
  attribute X_INTERFACE_INFO of C0_DDR4_dqs_t : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 DQS_T";
  attribute X_INTERFACE_INFO of C0_DDR4_odt : signal is "xilinx.com:interface:ddr4:1.0 C0_DDR4 ODT";
  attribute X_INTERFACE_INFO of GMII_rxd : signal is "xilinx.com:interface:gmii:1.0 GMII RXD";
  attribute X_INTERFACE_INFO of GMII_speed_mode : signal is "xilinx.com:interface:gmii:1.0 GMII SPEED_MODE";
  attribute X_INTERFACE_INFO of GMII_txd : signal is "xilinx.com:interface:gmii:1.0 GMII TXD";
begin
  C0_DDR4_act_n <= ddr4_C0_DDR4_ACT_N;
  C0_DDR4_adr(16 downto 0) <= ddr4_C0_DDR4_ADR(16 downto 0);
  C0_DDR4_ba(1 downto 0) <= ddr4_C0_DDR4_BA(1 downto 0);
  C0_DDR4_bg(0) <= ddr4_C0_DDR4_BG(0);
  C0_DDR4_ck_c(0) <= ddr4_C0_DDR4_CK_C(0);
  C0_DDR4_ck_t(0) <= ddr4_C0_DDR4_CK_T(0);
  C0_DDR4_cke(0) <= ddr4_C0_DDR4_CKE(0);
  C0_DDR4_cs_n(0) <= ddr4_C0_DDR4_CS_N(0);
  C0_DDR4_odt(0) <= ddr4_C0_DDR4_ODT(0);
  C0_DDR4_reset_n <= ddr4_C0_DDR4_RESET_N;
  C0_SYS_CLK_1_CLK_N <= C0_SYS_CLK_clk_n;
  C0_SYS_CLK_1_CLK_P <= C0_SYS_CLK_clk_p;
  Clk100 <= zynq_ultra_ps_e_pl_clk0;
  Clk50 <= zynq_ultra_ps_e_pl_clk1;
  ETH_CLK10 <= CLK_ETH10;
  ETH_CLK125_90 <= CLK_ETH125_90;
  ETH_CLK25 <= CLK_ETH25;
  ETH_resetn <= clk_wiz_0_locked;
  GMII_speed_mode(2 downto 0) <= zynq_ultra_ps_e_GMII_ENET1_SPEED_MODE(2 downto 0);
  GMII_tx_en <= zynq_ultra_ps_e_GMII_ENET1_TX_EN;
  GMII_tx_er <= zynq_ultra_ps_e_GMII_ENET1_TX_ER;
  GMII_txd(7 downto 0) <= zynq_ultra_ps_e_GMII_ENET1_TXD(7 downto 0);
  LED_N(1 downto 0) <= led_gpio_io_o(1 downto 0);
  MDIO_mdc <= zynq_ultra_ps_e_MDIO_ENET1_MDC;
  MDIO_mdio_o <= zynq_ultra_ps_e_MDIO_ENET1_MDIO_O;
  MDIO_mdio_t <= zynq_ultra_ps_e_MDIO_ENET1_MDIO_T;
  Rst_N <= zynq_ultra_ps_e_pl_resetn0;
  zynq_ultra_ps_e_GMII_ENET1_COL <= GMII_col;
  zynq_ultra_ps_e_GMII_ENET1_CRS <= GMII_crs;
  zynq_ultra_ps_e_GMII_ENET1_RXD(7 downto 0) <= GMII_rxd(7 downto 0);
  zynq_ultra_ps_e_GMII_ENET1_RX_CLK <= GMII_rx_clk;
  zynq_ultra_ps_e_GMII_ENET1_RX_DV <= GMII_rx_dv;
  zynq_ultra_ps_e_GMII_ENET1_RX_ER <= GMII_rx_er;
  zynq_ultra_ps_e_GMII_ENET1_TX_CLK <= GMII_tx_clk;
  zynq_ultra_ps_e_MDIO_ENET1_MDIO_I <= MDIO_mdio_i;
clk_wiz_0: component Mercury_XU5_clk_wiz_0_0
     port map (
      clk_in1 => zynq_ultra_ps_e_pl_clk1,
      clk_out1 => ETH_CLK125,
      clk_out2 => CLK_ETH125_90,
      clk_out3 => CLK_ETH25,
      clk_out4 => CLK_ETH10,
      locked => clk_wiz_0_locked,
      resetn => zynq_ultra_ps_e_pl_resetn0
    );
ddr4: component Mercury_XU5_ddr4_0
     port map (
      c0_ddr4_act_n => ddr4_C0_DDR4_ACT_N,
      c0_ddr4_adr(16 downto 0) => ddr4_C0_DDR4_ADR(16 downto 0),
      c0_ddr4_aresetn => ddr4_sys_rst_peripheral_aresetn(0),
      c0_ddr4_ba(1 downto 0) => ddr4_C0_DDR4_BA(1 downto 0),
      c0_ddr4_bg(0) => ddr4_C0_DDR4_BG(0),
      c0_ddr4_ck_c(0) => ddr4_C0_DDR4_CK_C(0),
      c0_ddr4_ck_t(0) => ddr4_C0_DDR4_CK_T(0),
      c0_ddr4_cke(0) => ddr4_C0_DDR4_CKE(0),
      c0_ddr4_cs_n(0) => ddr4_C0_DDR4_CS_N(0),
      c0_ddr4_dm_dbi_n(1 downto 0) => C0_DDR4_dm_n(1 downto 0),
      c0_ddr4_dq(15 downto 0) => C0_DDR4_dq(15 downto 0),
      c0_ddr4_dqs_c(1 downto 0) => C0_DDR4_dqs_c(1 downto 0),
      c0_ddr4_dqs_t(1 downto 0) => C0_DDR4_dqs_t(1 downto 0),
      c0_ddr4_odt(0) => ddr4_C0_DDR4_ODT(0),
      c0_ddr4_reset_n => ddr4_C0_DDR4_RESET_N,
      c0_ddr4_s_axi_araddr(29 downto 0) => smartconnect_1_M00_AXI_ARADDR(29 downto 0),
      c0_ddr4_s_axi_arburst(1 downto 0) => smartconnect_1_M00_AXI_ARBURST(1 downto 0),
      c0_ddr4_s_axi_arcache(3 downto 0) => smartconnect_1_M00_AXI_ARCACHE(3 downto 0),
      c0_ddr4_s_axi_arid(0) => '0',
      c0_ddr4_s_axi_arlen(7 downto 0) => smartconnect_1_M00_AXI_ARLEN(7 downto 0),
      c0_ddr4_s_axi_arlock(0) => smartconnect_1_M00_AXI_ARLOCK(0),
      c0_ddr4_s_axi_arprot(2 downto 0) => smartconnect_1_M00_AXI_ARPROT(2 downto 0),
      c0_ddr4_s_axi_arqos(3 downto 0) => smartconnect_1_M00_AXI_ARQOS(3 downto 0),
      c0_ddr4_s_axi_arready => smartconnect_1_M00_AXI_ARREADY,
      c0_ddr4_s_axi_arsize(2 downto 0) => smartconnect_1_M00_AXI_ARSIZE(2 downto 0),
      c0_ddr4_s_axi_arvalid => smartconnect_1_M00_AXI_ARVALID,
      c0_ddr4_s_axi_awaddr(29 downto 0) => smartconnect_1_M00_AXI_AWADDR(29 downto 0),
      c0_ddr4_s_axi_awburst(1 downto 0) => smartconnect_1_M00_AXI_AWBURST(1 downto 0),
      c0_ddr4_s_axi_awcache(3 downto 0) => smartconnect_1_M00_AXI_AWCACHE(3 downto 0),
      c0_ddr4_s_axi_awid(0) => '0',
      c0_ddr4_s_axi_awlen(7 downto 0) => smartconnect_1_M00_AXI_AWLEN(7 downto 0),
      c0_ddr4_s_axi_awlock(0) => smartconnect_1_M00_AXI_AWLOCK(0),
      c0_ddr4_s_axi_awprot(2 downto 0) => smartconnect_1_M00_AXI_AWPROT(2 downto 0),
      c0_ddr4_s_axi_awqos(3 downto 0) => smartconnect_1_M00_AXI_AWQOS(3 downto 0),
      c0_ddr4_s_axi_awready => smartconnect_1_M00_AXI_AWREADY,
      c0_ddr4_s_axi_awsize(2 downto 0) => smartconnect_1_M00_AXI_AWSIZE(2 downto 0),
      c0_ddr4_s_axi_awvalid => smartconnect_1_M00_AXI_AWVALID,
      c0_ddr4_s_axi_bid(0) => NLW_ddr4_c0_ddr4_s_axi_bid_UNCONNECTED(0),
      c0_ddr4_s_axi_bready => smartconnect_1_M00_AXI_BREADY,
      c0_ddr4_s_axi_bresp(1 downto 0) => smartconnect_1_M00_AXI_BRESP(1 downto 0),
      c0_ddr4_s_axi_bvalid => smartconnect_1_M00_AXI_BVALID,
      c0_ddr4_s_axi_rdata(127 downto 0) => smartconnect_1_M00_AXI_RDATA(127 downto 0),
      c0_ddr4_s_axi_rid(0) => NLW_ddr4_c0_ddr4_s_axi_rid_UNCONNECTED(0),
      c0_ddr4_s_axi_rlast => smartconnect_1_M00_AXI_RLAST,
      c0_ddr4_s_axi_rready => smartconnect_1_M00_AXI_RREADY,
      c0_ddr4_s_axi_rresp(1 downto 0) => smartconnect_1_M00_AXI_RRESP(1 downto 0),
      c0_ddr4_s_axi_rvalid => smartconnect_1_M00_AXI_RVALID,
      c0_ddr4_s_axi_wdata(127 downto 0) => smartconnect_1_M00_AXI_WDATA(127 downto 0),
      c0_ddr4_s_axi_wlast => smartconnect_1_M00_AXI_WLAST,
      c0_ddr4_s_axi_wready => smartconnect_1_M00_AXI_WREADY,
      c0_ddr4_s_axi_wstrb(15 downto 0) => smartconnect_1_M00_AXI_WSTRB(15 downto 0),
      c0_ddr4_s_axi_wvalid => smartconnect_1_M00_AXI_WVALID,
      c0_ddr4_ui_clk => ddr4_c0_ddr4_ui_clk,
      c0_ddr4_ui_clk_sync_rst => NLW_ddr4_c0_ddr4_ui_clk_sync_rst_UNCONNECTED,
      c0_init_calib_complete => NLW_ddr4_c0_init_calib_complete_UNCONNECTED,
      c0_sys_clk_n => C0_SYS_CLK_1_CLK_N,
      c0_sys_clk_p => C0_SYS_CLK_1_CLK_P,
      dbg_bus(511 downto 0) => NLW_ddr4_dbg_bus_UNCONNECTED(511 downto 0),
      dbg_clk => NLW_ddr4_dbg_clk_UNCONNECTED,
      sys_rst => ddr4_sys_rst_peripheral_reset(0)
    );
ddr4_sys_rst: component Mercury_XU5_ddr4_sys_rst_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_ddr4_sys_rst_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => zynq_ultra_ps_e_pl_resetn0,
      interconnect_aresetn(0) => ddr4_sys_rst_interconnect_aresetn(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_ddr4_sys_rst_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => ddr4_sys_rst_peripheral_aresetn(0),
      peripheral_reset(0) => ddr4_sys_rst_peripheral_reset(0),
      slowest_sync_clk => ddr4_c0_ddr4_ui_clk
    );
led: component Mercury_XU5_led_0
     port map (
      gpio_io_o(1 downto 0) => led_gpio_io_o(1 downto 0),
      s_axi_aclk => zynq_ultra_ps_e_pl_clk0,
      s_axi_araddr(8 downto 0) => smartconnect_0_M01_AXI_ARADDR(8 downto 0),
      s_axi_aresetn => ps_sys_rst_peripheral_aresetn(0),
      s_axi_arready => smartconnect_0_M01_AXI_ARREADY,
      s_axi_arvalid => smartconnect_0_M01_AXI_ARVALID,
      s_axi_awaddr(8 downto 0) => smartconnect_0_M01_AXI_AWADDR(8 downto 0),
      s_axi_awready => smartconnect_0_M01_AXI_AWREADY,
      s_axi_awvalid => smartconnect_0_M01_AXI_AWVALID,
      s_axi_bready => smartconnect_0_M01_AXI_BREADY,
      s_axi_bresp(1 downto 0) => smartconnect_0_M01_AXI_BRESP(1 downto 0),
      s_axi_bvalid => smartconnect_0_M01_AXI_BVALID,
      s_axi_rdata(31 downto 0) => smartconnect_0_M01_AXI_RDATA(31 downto 0),
      s_axi_rready => smartconnect_0_M01_AXI_RREADY,
      s_axi_rresp(1 downto 0) => smartconnect_0_M01_AXI_RRESP(1 downto 0),
      s_axi_rvalid => smartconnect_0_M01_AXI_RVALID,
      s_axi_wdata(31 downto 0) => smartconnect_0_M01_AXI_WDATA(31 downto 0),
      s_axi_wready => smartconnect_0_M01_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => smartconnect_0_M01_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => smartconnect_0_M01_AXI_WVALID
    );
ps_sys_rst: component Mercury_XU5_ps_sys_rst_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_ps_sys_rst_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => zynq_ultra_ps_e_pl_resetn0,
      interconnect_aresetn(0) => ps_sys_rst_interconnect_aresetn(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_ps_sys_rst_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => ps_sys_rst_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_ps_sys_rst_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => zynq_ultra_ps_e_pl_clk0
    );
smartconnect_0: component Mercury_XU5_smartconnect_0_0
     port map (
      M00_AXI_araddr(12 downto 0) => smartconnect_0_M00_AXI_ARADDR(12 downto 0),
      M00_AXI_arprot(2 downto 0) => NLW_smartconnect_0_M00_AXI_arprot_UNCONNECTED(2 downto 0),
      M00_AXI_arready => smartconnect_0_M00_AXI_ARREADY,
      M00_AXI_arvalid => smartconnect_0_M00_AXI_ARVALID,
      M00_AXI_awaddr(12 downto 0) => smartconnect_0_M00_AXI_AWADDR(12 downto 0),
      M00_AXI_awprot(2 downto 0) => NLW_smartconnect_0_M00_AXI_awprot_UNCONNECTED(2 downto 0),
      M00_AXI_awready => smartconnect_0_M00_AXI_AWREADY,
      M00_AXI_awvalid => smartconnect_0_M00_AXI_AWVALID,
      M00_AXI_bready => smartconnect_0_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => smartconnect_0_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => smartconnect_0_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => smartconnect_0_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rready => smartconnect_0_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => smartconnect_0_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => smartconnect_0_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => smartconnect_0_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wready => smartconnect_0_M00_AXI_WREADY,
      M00_AXI_wstrb(3 downto 0) => smartconnect_0_M00_AXI_WSTRB(3 downto 0),
      M00_AXI_wvalid => smartconnect_0_M00_AXI_WVALID,
      M01_AXI_araddr(8 downto 0) => smartconnect_0_M01_AXI_ARADDR(8 downto 0),
      M01_AXI_arprot(2 downto 0) => NLW_smartconnect_0_M01_AXI_arprot_UNCONNECTED(2 downto 0),
      M01_AXI_arready => smartconnect_0_M01_AXI_ARREADY,
      M01_AXI_arvalid => smartconnect_0_M01_AXI_ARVALID,
      M01_AXI_awaddr(8 downto 0) => smartconnect_0_M01_AXI_AWADDR(8 downto 0),
      M01_AXI_awprot(2 downto 0) => NLW_smartconnect_0_M01_AXI_awprot_UNCONNECTED(2 downto 0),
      M01_AXI_awready => smartconnect_0_M01_AXI_AWREADY,
      M01_AXI_awvalid => smartconnect_0_M01_AXI_AWVALID,
      M01_AXI_bready => smartconnect_0_M01_AXI_BREADY,
      M01_AXI_bresp(1 downto 0) => smartconnect_0_M01_AXI_BRESP(1 downto 0),
      M01_AXI_bvalid => smartconnect_0_M01_AXI_BVALID,
      M01_AXI_rdata(31 downto 0) => smartconnect_0_M01_AXI_RDATA(31 downto 0),
      M01_AXI_rready => smartconnect_0_M01_AXI_RREADY,
      M01_AXI_rresp(1 downto 0) => smartconnect_0_M01_AXI_RRESP(1 downto 0),
      M01_AXI_rvalid => smartconnect_0_M01_AXI_RVALID,
      M01_AXI_wdata(31 downto 0) => smartconnect_0_M01_AXI_WDATA(31 downto 0),
      M01_AXI_wready => smartconnect_0_M01_AXI_WREADY,
      M01_AXI_wstrb(3 downto 0) => smartconnect_0_M01_AXI_WSTRB(3 downto 0),
      M01_AXI_wvalid => smartconnect_0_M01_AXI_WVALID,
      S00_AXI_araddr(39 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARADDR(39 downto 0),
      S00_AXI_arburst(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARCACHE(3 downto 0),
      S00_AXI_arid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARID(15 downto 0),
      S00_AXI_arlen(7 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARLEN(7 downto 0),
      S00_AXI_arlock(0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARLOCK,
      S00_AXI_arprot(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARQOS(3 downto 0),
      S00_AXI_arready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARREADY,
      S00_AXI_arsize(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARSIZE(2 downto 0),
      S00_AXI_aruser(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARUSER(15 downto 0),
      S00_AXI_arvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARVALID,
      S00_AXI_awaddr(39 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWADDR(39 downto 0),
      S00_AXI_awburst(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWCACHE(3 downto 0),
      S00_AXI_awid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWID(15 downto 0),
      S00_AXI_awlen(7 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWLEN(7 downto 0),
      S00_AXI_awlock(0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWLOCK,
      S00_AXI_awprot(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWQOS(3 downto 0),
      S00_AXI_awready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWREADY,
      S00_AXI_awsize(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWSIZE(2 downto 0),
      S00_AXI_awuser(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWUSER(15 downto 0),
      S00_AXI_awvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWVALID,
      S00_AXI_bid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_BID(15 downto 0),
      S00_AXI_bready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_BREADY,
      S00_AXI_bresp(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_BRESP(1 downto 0),
      S00_AXI_bvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_BVALID,
      S00_AXI_rdata(31 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RDATA(31 downto 0),
      S00_AXI_rid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RID(15 downto 0),
      S00_AXI_rlast => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RLAST,
      S00_AXI_rready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RREADY,
      S00_AXI_rresp(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RRESP(1 downto 0),
      S00_AXI_rvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RVALID,
      S00_AXI_wdata(31 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WDATA(31 downto 0),
      S00_AXI_wlast => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WLAST,
      S00_AXI_wready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WREADY,
      S00_AXI_wstrb(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WSTRB(3 downto 0),
      S00_AXI_wvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WVALID,
      aclk => zynq_ultra_ps_e_pl_clk0,
      aresetn => ps_sys_rst_interconnect_aresetn(0)
    );
smartconnect_1: component Mercury_XU5_smartconnect_1_0
     port map (
      M00_AXI_araddr(29 downto 0) => smartconnect_1_M00_AXI_ARADDR(29 downto 0),
      M00_AXI_arburst(1 downto 0) => smartconnect_1_M00_AXI_ARBURST(1 downto 0),
      M00_AXI_arcache(3 downto 0) => smartconnect_1_M00_AXI_ARCACHE(3 downto 0),
      M00_AXI_arlen(7 downto 0) => smartconnect_1_M00_AXI_ARLEN(7 downto 0),
      M00_AXI_arlock(0) => smartconnect_1_M00_AXI_ARLOCK(0),
      M00_AXI_arprot(2 downto 0) => smartconnect_1_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arqos(3 downto 0) => smartconnect_1_M00_AXI_ARQOS(3 downto 0),
      M00_AXI_arready => smartconnect_1_M00_AXI_ARREADY,
      M00_AXI_arsize(2 downto 0) => smartconnect_1_M00_AXI_ARSIZE(2 downto 0),
      M00_AXI_aruser(15 downto 0) => NLW_smartconnect_1_M00_AXI_aruser_UNCONNECTED(15 downto 0),
      M00_AXI_arvalid => smartconnect_1_M00_AXI_ARVALID,
      M00_AXI_awaddr(29 downto 0) => smartconnect_1_M00_AXI_AWADDR(29 downto 0),
      M00_AXI_awburst(1 downto 0) => smartconnect_1_M00_AXI_AWBURST(1 downto 0),
      M00_AXI_awcache(3 downto 0) => smartconnect_1_M00_AXI_AWCACHE(3 downto 0),
      M00_AXI_awlen(7 downto 0) => smartconnect_1_M00_AXI_AWLEN(7 downto 0),
      M00_AXI_awlock(0) => smartconnect_1_M00_AXI_AWLOCK(0),
      M00_AXI_awprot(2 downto 0) => smartconnect_1_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awqos(3 downto 0) => smartconnect_1_M00_AXI_AWQOS(3 downto 0),
      M00_AXI_awready => smartconnect_1_M00_AXI_AWREADY,
      M00_AXI_awsize(2 downto 0) => smartconnect_1_M00_AXI_AWSIZE(2 downto 0),
      M00_AXI_awuser(15 downto 0) => NLW_smartconnect_1_M00_AXI_awuser_UNCONNECTED(15 downto 0),
      M00_AXI_awvalid => smartconnect_1_M00_AXI_AWVALID,
      M00_AXI_bready => smartconnect_1_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => smartconnect_1_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => smartconnect_1_M00_AXI_BVALID,
      M00_AXI_rdata(127 downto 0) => smartconnect_1_M00_AXI_RDATA(127 downto 0),
      M00_AXI_rlast => smartconnect_1_M00_AXI_RLAST,
      M00_AXI_rready => smartconnect_1_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => smartconnect_1_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => smartconnect_1_M00_AXI_RVALID,
      M00_AXI_wdata(127 downto 0) => smartconnect_1_M00_AXI_WDATA(127 downto 0),
      M00_AXI_wlast => smartconnect_1_M00_AXI_WLAST,
      M00_AXI_wready => smartconnect_1_M00_AXI_WREADY,
      M00_AXI_wstrb(15 downto 0) => smartconnect_1_M00_AXI_WSTRB(15 downto 0),
      M00_AXI_wvalid => smartconnect_1_M00_AXI_WVALID,
      S00_AXI_araddr(39 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARADDR(39 downto 0),
      S00_AXI_arburst(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARCACHE(3 downto 0),
      S00_AXI_arid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARID(15 downto 0),
      S00_AXI_arlen(7 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARLEN(7 downto 0),
      S00_AXI_arlock(0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARLOCK,
      S00_AXI_arprot(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARQOS(3 downto 0),
      S00_AXI_arready => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARREADY,
      S00_AXI_arsize(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARSIZE(2 downto 0),
      S00_AXI_aruser(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARUSER(15 downto 0),
      S00_AXI_arvalid => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARVALID,
      S00_AXI_awaddr(39 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWADDR(39 downto 0),
      S00_AXI_awburst(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWCACHE(3 downto 0),
      S00_AXI_awid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWID(15 downto 0),
      S00_AXI_awlen(7 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWLEN(7 downto 0),
      S00_AXI_awlock(0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWLOCK,
      S00_AXI_awprot(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWQOS(3 downto 0),
      S00_AXI_awready => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWREADY,
      S00_AXI_awsize(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWSIZE(2 downto 0),
      S00_AXI_awuser(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWUSER(15 downto 0),
      S00_AXI_awvalid => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWVALID,
      S00_AXI_bid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_BID(15 downto 0),
      S00_AXI_bready => zynq_ultra_ps_e_M_AXI_HPM0_FPD_BREADY,
      S00_AXI_bresp(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_BRESP(1 downto 0),
      S00_AXI_bvalid => zynq_ultra_ps_e_M_AXI_HPM0_FPD_BVALID,
      S00_AXI_rdata(127 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_RDATA(127 downto 0),
      S00_AXI_rid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_RID(15 downto 0),
      S00_AXI_rlast => zynq_ultra_ps_e_M_AXI_HPM0_FPD_RLAST,
      S00_AXI_rready => zynq_ultra_ps_e_M_AXI_HPM0_FPD_RREADY,
      S00_AXI_rresp(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_RRESP(1 downto 0),
      S00_AXI_rvalid => zynq_ultra_ps_e_M_AXI_HPM0_FPD_RVALID,
      S00_AXI_wdata(127 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_WDATA(127 downto 0),
      S00_AXI_wlast => zynq_ultra_ps_e_M_AXI_HPM0_FPD_WLAST,
      S00_AXI_wready => zynq_ultra_ps_e_M_AXI_HPM0_FPD_WREADY,
      S00_AXI_wstrb(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_WSTRB(15 downto 0),
      S00_AXI_wvalid => zynq_ultra_ps_e_M_AXI_HPM0_FPD_WVALID,
      aclk => ddr4_c0_ddr4_ui_clk,
      aresetn => ddr4_sys_rst_interconnect_aresetn(0)
    );
system_management_wiz: component Mercury_XU5_system_management_wiz_0
     port map (
      alarm_out => NLW_system_management_wiz_alarm_out_UNCONNECTED,
      busy_out => NLW_system_management_wiz_busy_out_UNCONNECTED,
      channel_out(5 downto 0) => NLW_system_management_wiz_channel_out_UNCONNECTED(5 downto 0),
      eoc_out => NLW_system_management_wiz_eoc_out_UNCONNECTED,
      eos_out => NLW_system_management_wiz_eos_out_UNCONNECTED,
      ip2intc_irpt => NLW_system_management_wiz_ip2intc_irpt_UNCONNECTED,
      ot_out => NLW_system_management_wiz_ot_out_UNCONNECTED,
      s_axi_aclk => zynq_ultra_ps_e_pl_clk0,
      s_axi_araddr(12 downto 0) => smartconnect_0_M00_AXI_ARADDR(12 downto 0),
      s_axi_aresetn => ps_sys_rst_peripheral_aresetn(0),
      s_axi_arready => smartconnect_0_M00_AXI_ARREADY,
      s_axi_arvalid => smartconnect_0_M00_AXI_ARVALID,
      s_axi_awaddr(12 downto 0) => smartconnect_0_M00_AXI_AWADDR(12 downto 0),
      s_axi_awready => smartconnect_0_M00_AXI_AWREADY,
      s_axi_awvalid => smartconnect_0_M00_AXI_AWVALID,
      s_axi_bready => smartconnect_0_M00_AXI_BREADY,
      s_axi_bresp(1 downto 0) => smartconnect_0_M00_AXI_BRESP(1 downto 0),
      s_axi_bvalid => smartconnect_0_M00_AXI_BVALID,
      s_axi_rdata(31 downto 0) => smartconnect_0_M00_AXI_RDATA(31 downto 0),
      s_axi_rready => smartconnect_0_M00_AXI_RREADY,
      s_axi_rresp(1 downto 0) => smartconnect_0_M00_AXI_RRESP(1 downto 0),
      s_axi_rvalid => smartconnect_0_M00_AXI_RVALID,
      s_axi_wdata(31 downto 0) => smartconnect_0_M00_AXI_WDATA(31 downto 0),
      s_axi_wready => smartconnect_0_M00_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => smartconnect_0_M00_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => smartconnect_0_M00_AXI_WVALID,
      user_temp_alarm_out => NLW_system_management_wiz_user_temp_alarm_out_UNCONNECTED,
      vccaux_alarm_out => NLW_system_management_wiz_vccaux_alarm_out_UNCONNECTED,
      vccint_alarm_out => NLW_system_management_wiz_vccint_alarm_out_UNCONNECTED,
      vccpsaux_alarm_out => NLW_system_management_wiz_vccpsaux_alarm_out_UNCONNECTED,
      vccpsintfp_alarm_out => NLW_system_management_wiz_vccpsintfp_alarm_out_UNCONNECTED,
      vccpsintlp_alarm_out => NLW_system_management_wiz_vccpsintlp_alarm_out_UNCONNECTED
    );
zynq_ultra_ps_e: component Mercury_XU5_zynq_ultra_ps_e_0
     port map (
      emio_enet0_enet_tsu_timer_cnt(93 downto 0) => NLW_zynq_ultra_ps_e_emio_enet0_enet_tsu_timer_cnt_UNCONNECTED(93 downto 0),
      emio_enet1_dma_bus_width(1 downto 0) => NLW_zynq_ultra_ps_e_emio_enet1_dma_bus_width_UNCONNECTED(1 downto 0),
      emio_enet1_ext_int_in => '0',
      emio_enet1_gmii_col => zynq_ultra_ps_e_GMII_ENET1_COL,
      emio_enet1_gmii_crs => zynq_ultra_ps_e_GMII_ENET1_CRS,
      emio_enet1_gmii_rx_clk => zynq_ultra_ps_e_GMII_ENET1_RX_CLK,
      emio_enet1_gmii_rx_dv => zynq_ultra_ps_e_GMII_ENET1_RX_DV,
      emio_enet1_gmii_rx_er => zynq_ultra_ps_e_GMII_ENET1_RX_ER,
      emio_enet1_gmii_rxd(7 downto 0) => zynq_ultra_ps_e_GMII_ENET1_RXD(7 downto 0),
      emio_enet1_gmii_tx_clk => zynq_ultra_ps_e_GMII_ENET1_TX_CLK,
      emio_enet1_gmii_tx_en => zynq_ultra_ps_e_GMII_ENET1_TX_EN,
      emio_enet1_gmii_tx_er => zynq_ultra_ps_e_GMII_ENET1_TX_ER,
      emio_enet1_gmii_txd(7 downto 0) => zynq_ultra_ps_e_GMII_ENET1_TXD(7 downto 0),
      emio_enet1_mdio_i => zynq_ultra_ps_e_MDIO_ENET1_MDIO_I,
      emio_enet1_mdio_mdc => zynq_ultra_ps_e_MDIO_ENET1_MDC,
      emio_enet1_mdio_o => zynq_ultra_ps_e_MDIO_ENET1_MDIO_O,
      emio_enet1_mdio_t => zynq_ultra_ps_e_MDIO_ENET1_MDIO_T,
      emio_enet1_speed_mode(2 downto 0) => zynq_ultra_ps_e_GMII_ENET1_SPEED_MODE(2 downto 0),
      emio_enet1_tsu_inc_ctrl(1 downto 0) => B"00",
      emio_enet1_tsu_timer_cmp_val => NLW_zynq_ultra_ps_e_emio_enet1_tsu_timer_cmp_val_UNCONNECTED,
      maxigp0_araddr(39 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARADDR(39 downto 0),
      maxigp0_arburst(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARBURST(1 downto 0),
      maxigp0_arcache(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARCACHE(3 downto 0),
      maxigp0_arid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARID(15 downto 0),
      maxigp0_arlen(7 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARLEN(7 downto 0),
      maxigp0_arlock => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARLOCK,
      maxigp0_arprot(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARPROT(2 downto 0),
      maxigp0_arqos(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARQOS(3 downto 0),
      maxigp0_arready => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARREADY,
      maxigp0_arsize(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARSIZE(2 downto 0),
      maxigp0_aruser(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARUSER(15 downto 0),
      maxigp0_arvalid => zynq_ultra_ps_e_M_AXI_HPM0_FPD_ARVALID,
      maxigp0_awaddr(39 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWADDR(39 downto 0),
      maxigp0_awburst(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWBURST(1 downto 0),
      maxigp0_awcache(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWCACHE(3 downto 0),
      maxigp0_awid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWID(15 downto 0),
      maxigp0_awlen(7 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWLEN(7 downto 0),
      maxigp0_awlock => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWLOCK,
      maxigp0_awprot(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWPROT(2 downto 0),
      maxigp0_awqos(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWQOS(3 downto 0),
      maxigp0_awready => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWREADY,
      maxigp0_awsize(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWSIZE(2 downto 0),
      maxigp0_awuser(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWUSER(15 downto 0),
      maxigp0_awvalid => zynq_ultra_ps_e_M_AXI_HPM0_FPD_AWVALID,
      maxigp0_bid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_BID(15 downto 0),
      maxigp0_bready => zynq_ultra_ps_e_M_AXI_HPM0_FPD_BREADY,
      maxigp0_bresp(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_BRESP(1 downto 0),
      maxigp0_bvalid => zynq_ultra_ps_e_M_AXI_HPM0_FPD_BVALID,
      maxigp0_rdata(127 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_RDATA(127 downto 0),
      maxigp0_rid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_RID(15 downto 0),
      maxigp0_rlast => zynq_ultra_ps_e_M_AXI_HPM0_FPD_RLAST,
      maxigp0_rready => zynq_ultra_ps_e_M_AXI_HPM0_FPD_RREADY,
      maxigp0_rresp(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_RRESP(1 downto 0),
      maxigp0_rvalid => zynq_ultra_ps_e_M_AXI_HPM0_FPD_RVALID,
      maxigp0_wdata(127 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_WDATA(127 downto 0),
      maxigp0_wlast => zynq_ultra_ps_e_M_AXI_HPM0_FPD_WLAST,
      maxigp0_wready => zynq_ultra_ps_e_M_AXI_HPM0_FPD_WREADY,
      maxigp0_wstrb(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_FPD_WSTRB(15 downto 0),
      maxigp0_wvalid => zynq_ultra_ps_e_M_AXI_HPM0_FPD_WVALID,
      maxigp2_araddr(39 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARADDR(39 downto 0),
      maxigp2_arburst(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARBURST(1 downto 0),
      maxigp2_arcache(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARCACHE(3 downto 0),
      maxigp2_arid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARID(15 downto 0),
      maxigp2_arlen(7 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARLEN(7 downto 0),
      maxigp2_arlock => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARLOCK,
      maxigp2_arprot(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARPROT(2 downto 0),
      maxigp2_arqos(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARQOS(3 downto 0),
      maxigp2_arready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARREADY,
      maxigp2_arsize(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARSIZE(2 downto 0),
      maxigp2_aruser(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARUSER(15 downto 0),
      maxigp2_arvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_ARVALID,
      maxigp2_awaddr(39 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWADDR(39 downto 0),
      maxigp2_awburst(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWBURST(1 downto 0),
      maxigp2_awcache(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWCACHE(3 downto 0),
      maxigp2_awid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWID(15 downto 0),
      maxigp2_awlen(7 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWLEN(7 downto 0),
      maxigp2_awlock => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWLOCK,
      maxigp2_awprot(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWPROT(2 downto 0),
      maxigp2_awqos(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWQOS(3 downto 0),
      maxigp2_awready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWREADY,
      maxigp2_awsize(2 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWSIZE(2 downto 0),
      maxigp2_awuser(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWUSER(15 downto 0),
      maxigp2_awvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_AWVALID,
      maxigp2_bid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_BID(15 downto 0),
      maxigp2_bready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_BREADY,
      maxigp2_bresp(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_BRESP(1 downto 0),
      maxigp2_bvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_BVALID,
      maxigp2_rdata(31 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RDATA(31 downto 0),
      maxigp2_rid(15 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RID(15 downto 0),
      maxigp2_rlast => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RLAST,
      maxigp2_rready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RREADY,
      maxigp2_rresp(1 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RRESP(1 downto 0),
      maxigp2_rvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_RVALID,
      maxigp2_wdata(31 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WDATA(31 downto 0),
      maxigp2_wlast => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WLAST,
      maxigp2_wready => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WREADY,
      maxigp2_wstrb(3 downto 0) => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WSTRB(3 downto 0),
      maxigp2_wvalid => zynq_ultra_ps_e_M_AXI_HPM0_LPD_WVALID,
      maxihpm0_fpd_aclk => ddr4_c0_ddr4_ui_clk,
      maxihpm0_lpd_aclk => zynq_ultra_ps_e_pl_clk0,
      pl_clk0 => zynq_ultra_ps_e_pl_clk0,
      pl_clk1 => zynq_ultra_ps_e_pl_clk1,
      pl_resetn0 => zynq_ultra_ps_e_pl_resetn0
    );
end STRUCTURE;
