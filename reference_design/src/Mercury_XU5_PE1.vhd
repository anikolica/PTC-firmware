---------------------------------------------------------------------------------------------------
-- Copyright (c) 2021 by Enclustra GmbH, Switzerland.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of
-- this hardware, software, firmware, and associated documentation files (the
-- "Product"), to deal in the Product without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute,
-- sublicense, and/or sell copies of the Product, and to permit persons to whom the
-- Product is furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Product.
--
-- THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
-- INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
-- PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
-- HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-- OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- PRODUCT OR THE USE OR OTHER DEALINGS IN THE PRODUCT.
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- libraries
---------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Library UNISIM;
use UNISIM.vcomponents.all;
---------------------------------------------------------------------------------------------------
-- entity declaration
---------------------------------------------------------------------------------------------------
entity Mercury_XU5_PE1 is
  generic (
    BG_WIDTH : natural
  );
  
  port (
    XMC_JTAG_TMS                    : out   std_logic;
    XMC_JTAG_TCK                    : out   std_logic;
    XMC_JTAG_TDI                    : out   std_logic;
    XMC_JTAG_TDO                    : in    std_logic;
    XMC_JTAG_RST                    : out   std_logic;
    OVER_TEMP_LED                   : out   std_logic;
    ECAT_UART_TX                    : out   std_logic;
    ECAT_UART_RX                    : in    std_logic;
    DEBUG_UART_TX                   : out   std_logic;
    DEBUG_UART_RX                   : in    std_logic;
    VP12_EN3                        : out   std_logic;
    VP12_EN2                        : out   std_logic;
    VP12_SYNC0                      : out   std_logic;
    VP12_SYNC1                      : out   std_logic;
    VP12_SYNC2                      : out   std_logic;
    VP12_SYNC3                      : out   std_logic;
    VP12_SYNC4                      : out   std_logic;
    VP12_SYNC5                      : out   std_logic;
    VP12_SYNC6                      : out   std_logic;
    OVER_TEMP0                      : in    std_logic;
    OVER_TEMP1                      : in    std_logic;
    OVER_TEMP2                      : in    std_logic;
    VP2V5_ALERT                     : in    std_logic;
    VP3V3_ALERT                     : in    std_logic;
    VP12_IV_ALERT0                  : in    std_logic;
    VP12_IV_ALERT1                  : in    std_logic;
    WIB_PE_SEL                      : out   std_logic;
    LV_SYNC                         : out   std_logic;
    VP12_EN1                        : out   std_logic;
    VP12_EN0                        : out   std_logic;
    SFP2_LOS                        : in    std_logic;
    SFP2_PRESENT                    : in    std_logic;
    WIB_RX_SEL0                     : out   std_logic;
    WIB_RX_SEL1                     : out   std_logic;
    WIB_RX_SEL2                     : out   std_logic;
    SFP0_LOS                        : in    std_logic;
    SFP0_TX_FAULT                   : in    std_logic;
    SFP0_PRESENT                    : in    std_logic;
    SFP0_SPARE_LED                  : out   std_logic;
    VP12_IV_ALERT2                  : in    std_logic;
    VP12_IV_ALERT3                  : in    std_logic;
    VP12_IV_ALERT4                  : in    std_logic;
    VP12_IV_ALERT5                  : in    std_logic;
    VP12_IV_ALERT6                  : in    std_logic;
    VP48_IV_ALERT                   : in    std_logic;
    SOC_I2C_SW_RST                  : out   std_logic;
    SFP1_TX_FAULT                   : in    std_logic;
    SFP2_TX_FAULT                   : in    std_logic;
    SFP2_TX_DISABLE                 : out   std_logic;
    SFP1_LOS                        : in    std_logic;
    SFP1_PRESENT                    : in    std_logic;
    VP12_EN4                        : out   std_logic;
    VP12_EN5                        : out   std_logic;
    WIB_SCL                         : inout   std_logic;
    WIB_SDA                         : inout   std_logic;
    WIB_I2C_OE                      : out   std_logic;
    MCU_I2C_OE                      : out   std_logic;
    WIB_CLK_SEL                     : out   std_logic;
    SYS_CMD_P                       : out   std_logic;
    SYS_CMD_N                       : out   std_logic;
    SOC_AUX_CLK_P                   : out   std_logic;
    SOC_AUX_CLK_N                   : out   std_logic;
    BP_IO0                          : in    std_logic;
    BP_IO1                          : in    std_logic;
    BP_IO2                          : in    std_logic;
    BP_IO3                          : in    std_logic;
    BP_IO4                          : in    std_logic;
    BP_IO5                          : in    std_logic;
    BP_IO_OE                        : out   std_logic;
    TIMING_GOOD                     : out   std_logic;
    EN_3V3                          : out   std_logic;
    EN_2V5                          : out   std_logic;
    SYS_CLK_P                       : in    std_logic;
    SYS_CLK_N                       : in    std_logic;
    CRATE_ADDR_OE                   : out   std_logic;
    CRATE_ADDR0                     : in    std_logic;
    CRATE_ADDR1                     : in    std_logic;
    CRATE_ADDR2                     : in    std_logic;
    CRATE_ADDR3                     : in    std_logic;
    CRATE_ADDR4                     : in    std_logic;
    CRATE_ADDR5                     : in    std_logic;
    CRATE_ADDR6                     : in    std_logic;
    CRATE_ADDR7                     : in    std_logic;
    
--    -- Anios_A
--    IOA_D0_P                       : inout   std_logic;
--    IOA_D1_N                       : inout   std_logic;
--    IOA_D2_P                       : inout   std_logic;
--    IOA_D3_N                       : inout   std_logic;
--    IOA_D4_P                       : inout   std_logic;
--    IOA_D5_N                       : inout   std_logic;
--    IOA_D6_P                       : inout   std_logic;
--    IOA_D7_N                       : inout   std_logic;
--    IOA_D8_P                       : inout   std_logic;
--    IOA_D9_N                       : inout   std_logic;
--    IOA_D10_P                      : inout   std_logic;
--    IOA_D11_N                      : inout   std_logic;
--    IOA_D12_P                      : inout   std_logic;
--    IOA_D13_N                      : inout   std_logic;
--    IOA_D14_P                      : inout   std_logic;
--    IOA_D15_N                      : inout   std_logic;
--    IOA_D16_P                      : inout   std_logic;
--    IOA_D17_N                      : inout   std_logic;
--    IOA_D18_P                      : inout   std_logic;
--    IOA_D19_N                      : inout   std_logic;
--    IOA_D20_P                      : inout   std_logic;
--    IOA_D21_N                      : inout   std_logic;
--    IOA_D22_P                      : inout   std_logic;
--    IOA_D23_N                      : inout   std_logic;
--    IOA_CLK1_N                     : inout   std_logic;
--    IOA_CLK0_P                     : inout   std_logic;
    
--    -- Anios_B
--    IOB_D0_P                       : inout   std_logic;
--    IOB_D1_N                       : inout   std_logic;
--    IOB_D2_P                       : inout   std_logic;
--    IOB_D3_N                       : inout   std_logic;
--    IOB_D4_P                       : inout   std_logic;
--    IOB_D5_N                       : inout   std_logic;
--    IOB_D6_P                       : inout   std_logic;
--    IOB_D7_N                       : inout   std_logic;
--    IOB_D8_P                       : inout   std_logic;
--    IOB_D9_N                       : inout   std_logic;
--    IOB_D10_P                      : inout   std_logic;
--    IOB_D11_N                      : inout   std_logic;
--    IOB_D12_P                      : inout   std_logic;
--    IOB_D13_N                      : inout   std_logic;
--    IOB_D14_P                      : inout   std_logic;
--    IOB_D15_N                      : inout   std_logic;
--    IOB_D16_SC0_DIP1_N             : inout   std_logic;
--    IOB_D17_SC1_DIP2_N             : inout   std_logic;
--    IOB_D18_SC2_DIP3_N             : inout   std_logic; -- Only available on G1 modules
--    IOB_D19_SC3_DIP4_N             : inout   std_logic; -- Only available on G1 modules
--    IOB_D20_SC4_BTN0_N             : inout   std_logic;
--    IOB_D21_SC5_BTN1_N             : inout   std_logic;
--    IOB_D22_SC6_BTN2_N             : inout   std_logic;
--    IOB_D23_SC7_BTN3_N             : inout   std_logic;
--    IOB_CLK1_N                     : inout   std_logic;
--    IOB_CLK0_P                     : inout   std_logic;
    
--    -- FMC0
--    FMC_LA02_N                     : inout   std_logic;
--    FMC_LA02_P                     : inout   std_logic;
--    FMC_LA03_N                     : inout   std_logic;
--    FMC_LA03_P                     : inout   std_logic;
--    FMC_LA04_N                     : inout   std_logic;
--    FMC_LA04_P                     : inout   std_logic;
--    FMC_LA05_N                     : inout   std_logic;
--    FMC_LA05_P                     : inout   std_logic;
--    FMC_LA06_N                     : inout   std_logic;
--    FMC_LA06_P                     : inout   std_logic;
--    FMC_LA07_N                     : inout   std_logic;
--    FMC_LA07_P                     : inout   std_logic;
--    FMC_LA08_N                     : inout   std_logic;
--    FMC_LA08_P                     : inout   std_logic;
--    FMC_LA09_N                     : inout   std_logic;
--    FMC_LA09_P                     : inout   std_logic;
--    FMC_LA10_N                     : inout   std_logic;
--    FMC_LA10_P                     : inout   std_logic;
--    FMC_LA11_N                     : inout   std_logic;
--    FMC_LA11_P                     : inout   std_logic;
--    FMC_LA12_N                     : inout   std_logic;
--    FMC_LA12_P                     : inout   std_logic;
--    FMC_LA13_N                     : inout   std_logic;
--    FMC_LA13_P                     : inout   std_logic;
--    FMC_LA14_N                     : inout   std_logic;
--    FMC_LA14_P                     : inout   std_logic;
--    FMC_LA15_N                     : inout   std_logic;
--    FMC_LA15_P                     : inout   std_logic;
--    FMC_LA16_N                     : inout   std_logic;
--    FMC_LA16_P                     : inout   std_logic;
--    FMC_LA19_N                     : inout   std_logic;
--    FMC_LA19_P                     : inout   std_logic;
--    FMC_LA20_N                     : inout   std_logic;
--    FMC_LA20_P                     : inout   std_logic;
--    FMC_LA21_N                     : inout   std_logic;
--    FMC_LA21_P                     : inout   std_logic;
--    FMC_LA22_N                     : inout   std_logic;
--    FMC_LA22_P                     : inout   std_logic;
--    FMC_LA23_N                     : inout   std_logic;
--    FMC_LA23_P                     : inout   std_logic;
--    FMC_LA24_N                     : inout   std_logic;
--    FMC_LA24_P                     : inout   std_logic;
--    FMC_LA25_N                     : inout   std_logic;
--    FMC_LA25_P                     : inout   std_logic;
--    FMC_LA26_N                     : inout   std_logic;
--    FMC_LA26_P                     : inout   std_logic;
--    FMC_LA27_N                     : inout   std_logic;
--    FMC_LA27_P                     : inout   std_logic;
--    FMC_LA28_N                     : inout   std_logic;
--    FMC_LA28_P                     : inout   std_logic;
--    FMC_LA29_N                     : inout   std_logic;
--    FMC_LA29_P                     : inout   std_logic;
--    FMC_LA30_N                     : inout   std_logic;
--    FMC_LA30_P                     : inout   std_logic;
--    FMC_LA31_N                     : inout   std_logic;
--    FMC_LA31_P                     : inout   std_logic;
--    FMC_LA32_N                     : inout   std_logic;
--    FMC_LA32_P                     : inout   std_logic;
--    FMC_LA33_N                     : inout   std_logic;
--    FMC_LA33_P                     : inout   std_logic;
--    FMC_LA00_CC_N                  : inout   std_logic;
--    FMC_LA00_CC_P                  : inout   std_logic;
--    FMC_LA01_CC_N                  : inout   std_logic;
--    FMC_LA01_CC_P                  : inout   std_logic;
--    FMC_LA17_CC_N                  : inout   std_logic;
--    FMC_LA17_CC_P                  : inout   std_logic;
--    FMC_LA18_CC_N                  : inout   std_logic;
--    FMC_LA18_CC_P                  : inout   std_logic;
--    FMC_CLK0_M2C_N                 : inout   std_logic;
--    FMC_CLK0_M2C_P                 : inout   std_logic;
--    FMC_CLK1_M2C_N                 : inout   std_logic;
--    FMC_CLK1_M2C_P                 : inout   std_logic;
    
    -- I2C_PL
    SOC_I2C_SCL                     : inout   std_logic;
    SOC_I2C_SDA                     : inout   std_logic;
    
--    -- IOC
--    IOC_D0_P                       : inout   std_logic; -- Only available on G1 modules
--    IOC_D1_N                       : inout   std_logic; -- Only available on G1 modules
--    IOC_D2_P                       : inout   std_logic; -- Only available on G1 modules
--    IOC_D3_N                       : inout   std_logic; -- Only available on G1 modules
--    IOC_D4_P                       : inout   std_logic; -- Only available on G1 modules
--    IOC_D5_N                       : inout   std_logic; -- Only available on G1 modules
--    IOC_D6_P                       : inout   std_logic; -- Only available on G1 modules
--    IOC_D7_N                       : inout   std_logic; -- Only available on G1 modules
    
--    -- IOD
--    IOD_D0_P                       : inout   std_logic; -- Only available on G1 modules
--    IOD_D1_N                       : inout   std_logic; -- Only available on G1 modules
--    IOD_D2_P                       : inout   std_logic; -- Only available on G1 modules
--    IOD_D3_N                       : inout   std_logic; -- Only available on G1 modules
--    IOD_D4_P                       : inout   std_logic; -- Only available on G1 modules
--    IOD_D5_N                       : inout   std_logic; -- Only available on G1 modules
--    IOD_D6_P                       : inout   std_logic; -- Only available on G1 modules
--    IOD_D7_N                       : inout   std_logic; -- Only available on G1 modules
    
--    -- IOE
--    IOE_D0_LED0_N                  : inout   std_logic; -- Only available on G1 modules
--    IOE_D1_LED1_N                  : inout   std_logic; -- Only available on G1 modules
--    IOE_D2_LED2_N                  : inout   std_logic; -- Only available on G1 modules
--    IOE_D3_LED3_N                  : inout   std_logic; -- Only available on G1 modules
    
    -- LED
    LED1_N                         : out     std_logic;
    LED2_N                         : out     std_logic;
    LED3_N                         : out     std_logic;
    
    -- PL_100_MHz_Oscillator
    CLK100_PL_N                    : in      std_logic;
    CLK100_PL_P                    : in      std_logic;
    
    -- PL_DDR4_Memory
    DDR4PL_ACT_N                   : out     std_logic;
    DDR4PL_RST_N                   : out     std_logic;
    DDR4PL_BA                      : out     std_logic_vector(1 downto 0);
    DDR4PL_BG                      : out     std_logic_vector(1 downto 0);
    DDR4PL_CKE                     : out     std_logic_vector(0 downto 0);
    DDR4PL_DQ                      : inout   std_logic_vector(15 downto 0);
    DDR4PL_ODT                     : out     std_logic_vector(0 downto 0);
    DDR4PL_A                       : out     std_logic_vector(16 downto 0);
    DDR4PL_CK_N                    : out     std_logic_vector(0 downto 0);
    DDR4PL_CK_P                    : out     std_logic_vector(0 downto 0);
    DDR4PL_CS_N                    : out     std_logic_vector(0 downto 0);
    DDR4PL_DM                      : inout   std_logic_vector(1 downto 0);
    DDR4PL_DQS_N                   : inout   std_logic_vector(1 downto 0);
    DDR4PL_DQS_P                   : inout   std_logic_vector(1 downto 0)
    
    -- PL_Gigabit_Ethernet
--    ETH1_MDC                       : out     std_logic;
--    ETH1_RXCLK                     : in      std_logic;
--    ETH1_TXCLK                     : out     std_logic;
--    ETH1_MDIO                      : inout   std_logic;
--    ETH1_INT_N                     : in      std_logic;
--    ETH1_RESET_N                   : out     std_logic;
--    ETH1_RXCTL                     : in      std_logic;
--    ETH1_TXCTL                     : out     std_logic;
--    ETH1_RXD                       : in      std_logic_vector(3 downto 0);
--    ETH1_TXD                       : out     std_logic_vector(3 downto 0)
  );
end Mercury_XU5_PE1;

architecture rtl of Mercury_XU5_PE1 is

  ---------------------------------------------------------------------------------------------------
  -- component declarations
  ---------------------------------------------------------------------------------------------------
  component Mercury_XU5 is
    port (
      Clk100              : out    std_logic;
      Clk50               : out    std_logic;
      Rst_N               : out    std_logic;
      LED_N               : out    std_logic_vector(1 downto 0);
      C0_SYS_CLK_clk_n    : in     std_logic;
      C0_SYS_CLK_clk_p    : in     std_logic;
      C0_DDR4_act_n       : out    std_logic;
      C0_DDR4_reset_n     : out    std_logic;
      C0_DDR4_ba          : out    std_logic_vector(1 downto 0);
      C0_DDR4_bg          : out    std_logic_vector(BG_WIDTH-1 downto 0);
      C0_DDR4_cke         : out    std_logic_vector(0 downto 0);
      C0_DDR4_dq          : inout  std_logic_vector(15 downto 0);
      C0_DDR4_odt         : out    std_logic_vector(0 downto 0);
      C0_DDR4_adr         : out    std_logic_vector(16 downto 0);
      C0_DDR4_ck_c        : out    std_logic_vector(0 downto 0);
      C0_DDR4_ck_t        : out    std_logic_vector(0 downto 0);
      C0_DDR4_cs_n        : out    std_logic_vector(0 downto 0);
      C0_DDR4_dm_n        : inout  std_logic_vector(1 downto 0);
      C0_DDR4_dqs_c       : inout  std_logic_vector(1 downto 0);
      C0_DDR4_dqs_t       : inout  std_logic_vector(1 downto 0);
      iic_ptc_scl_i       : in     std_logic;
      iic_ptc_scl_o       : out    std_logic;
      iic_ptc_scl_t       : out    std_logic;
      iic_ptc_sda_i       : in     std_logic;
      iic_ptc_sda_o       : out    std_logic;
      iic_ptc_sda_t       : out    std_logic;
      iic_wib_scl_i       : in     std_logic;
      iic_wib_scl_o       : out    std_logic;
      iic_wib_scl_t       : out    std_logic;
      iic_wib_sda_i       : in     std_logic;
      iic_wib_sda_o       : out    std_logic;
      iic_wib_sda_t       : out    std_logic;
      ECAT_UART_txd       : out    std_logic;
      ECAT_UART_rxd       : in     std_logic;
      DEBUG_UART_txd      : out    std_logic;
      DEBUG_UART_rxd      : in     std_logic;
      reg_ro              : in     std_logic_vector(2047 downto 0);
      reg_rw              : out    std_logic_vector(2047 downto 0)
--      MDIO_mdc            : out    std_logic;
--      MDIO_mdio_i         : in     std_logic;
--      MDIO_mdio_o         : out    std_logic;
--      MDIO_mdio_t         : out    std_logic;
--      ETH_CLK125          : out    std_logic;
--      ETH_CLK125_90       : out    std_logic;
--      ETH_CLK25           : out    std_logic;
--      ETH_CLK10           : out    std_logic;
--      ETH_resetn          : out    std_logic;
--      GMII_col            : in     std_logic;
--      GMII_crs            : in     std_logic;
--      GMII_rx_clk         : in     std_logic;
--      GMII_rx_dv          : in     std_logic;
--      GMII_rx_er          : in     std_logic;
--      GMII_rxd            : in     std_logic_vector(7 downto 0);
--      GMII_speed_mode     : out    std_logic_vector(2 downto 0);
--      GMII_tx_clk         : in     std_logic;
--      GMII_tx_en          : out    std_logic;
--      GMII_tx_er          : out    std_logic;
--      GMII_txd            : out    std_logic_vector(7 downto 0)
    );
    
  end component Mercury_XU5;
--  component IOBUF is
--  port (
--    I : in STD_LOGIC;
--    O : out STD_LOGIC;
--    T : in STD_LOGIC;
--    IO : inout STD_LOGIC
--  );
--  end component IOBUF;
  
--  component Mercury_XU5_GMII2RGMII is
--  port (
--    Clk125          : in  std_logic;
--    Clk125_90       : in  std_logic;
--    Clk25           : in  std_logic;
--    Clk10           : in  std_logic;
--    Resetn          : in  std_logic;
  
--    GMII_col        : out std_logic;
--    GMII_crs        : out std_logic;
--    GMII_rx_clk     : out std_logic;
--    GMII_rx_dv      : out std_logic;
--    GMII_rx_er      : out std_logic;
--    GMII_rxd        : out std_logic_vector(7 downto 0);
--    GMII_speed_mode : in  std_logic_vector(2 downto 0);
--    GMII_tx_clk     : out std_logic;
--    GMII_tx_en      : in  std_logic;
--    GMII_tx_er      : in  std_logic;
--    GMII_txd        : in  std_logic_vector(7 downto 0);
  
--    RGMII_rxd       : in  std_logic_vector(3 downto 0);
--    RGMII_rxclk     : in  std_logic;
--    RGMII_rxctl     : in  std_logic;
--    RGMII_txd       : out std_logic_vector(3 downto 0);
--    RGMII_txclk     : out std_logic;
--    RGMII_txctl     : out std_logic;
  
--    Speed1000En     : out std_logic;
--    Speed100En      : out std_logic;
--    Speed10En       : out std_logic
--  );
--  end component Mercury_XU5_GMII2RGMII;


  component top_RTL is
    port (
      clk_axi             : in    std_logic;
      reg_rw_in           : in    std_logic_vector(2047 downto 0);
      
      XMC_JTAG_TMS        : out   std_logic;
      XMC_JTAG_TCK        : out   std_logic;
      XMC_JTAG_TDO        : in    std_logic;
      XMC_JTAG_TDI        : out   std_logic;
      XMC_JTAG_RST        : out   std_logic;
      --DEBUG_UART_TX       : out   std_logic;
      --DEBUG_UART_RX       : in    std_logic;
      --ECAT_UART_TX        : out   std_logic;
      --ECAT_UART_RX        : in    std_logic;
      OVER_TEMP_LED       : out   std_logic;
      VP12_EN             : out   std_logic_vector(5 downto 0);
      VP12_SYNC           : out   std_logic_vector(6 downto 0);
      OVER_TEMP           : in    std_logic_vector(2 downto 0);
      VP2V5_ALERT         : in    std_logic;
      VP3V3_ALERT         : in    std_logic;
      VP12_IV_ALERT       : in    std_logic_vector(6 downto 0);
      WIB_PE_SEL          : out   std_logic;
      LV_SYNC             : out   std_logic;
      SFP2_LOS            : in    std_logic;
      SFP2_PRESENT        : in    std_logic;
      WIB_RX_SEL          : out   std_logic_vector(2 downto 0);
      SFP0_LOS            : in    std_logic;
      SFP0_PRESENT        : in    std_logic;
      SFP0_TX_FAULT       : in    std_logic;
      SFP0_SPARE_LED      : out   std_logic;
      VP48_IV_ALERT       : in    std_logic;
      SOC_I2C_SW_RST      : out   std_logic;
      SFP1_TX_FAULT       : in    std_logic;
      SFP2_TX_FAULT       : in    std_logic;
      SFP2_TX_DISABLE     : out   std_logic;
      SFP1_LOS            : in    std_logic;
      SFP1_PRESENT        : in    std_logic;
      --WIB_SCL             : inout   std_logic;
      --WIB_SDA             : inout   std_logic;
      WIB_I2C_OE          : out   std_logic;
      MCU_I2C_OE          : out   std_logic;
      WIB_CLK_SEL         : out   std_logic;
      SYS_CMD             : out   std_logic;
      SOC_AUX_CLK         : out   std_logic;
      SYS_CLK             : in    std_logic;
      BP_IO               : in    std_logic_vector(5 downto 0);
      BP_IO_OE            : out   std_logic;
      TIMING_GOOD         : out   std_logic;
      EN_3V3              : out   std_logic;
      EN_2V5              : out   std_logic;
      CRATE_ADDR_OE       : out   std_logic;
      CRATE_ADDR          : in    std_logic_vector(7 downto 0);
      --SOC_I2C_SCL         :inout    std_logic;
      --SOC_I2C_SDA         :inout    std_logic;

      reg_ro_out          : out    std_logic_vector(2047 downto 0)
    );
    end component top_RTL;
    
  ---------------------------------------------------------------------------------------------------
  -- signal declarations
  ---------------------------------------------------------------------------------------------------
  signal Clk100           : std_logic;
  signal Clk50            : std_logic;
  --signal CLK100_PL_SE     : std_logic;
  signal Rst_N            : std_logic;
  signal LED_N            : std_logic_vector(1 downto 0);
  signal reg_ro           : std_logic_vector(2047 downto 0);
  signal reg_rw           : std_logic_vector(2047 downto 0);
  signal SYS_CLK          : std_logic;
  signal SYS_CMD          : std_logic;
  signal SOC_AUX_CLK      : std_logic;
  signal iic_ptc_scl_i    : std_logic;
  signal iic_ptc_scl_o    : std_logic;
  signal iic_ptc_scl_t    : std_logic;
  signal iic_ptc_sda_i    : std_logic;
  signal iic_ptc_sda_o    : std_logic;
  signal iic_ptc_sda_t    : std_logic;
  signal iic_wib_scl_i    : std_logic;
  signal iic_wib_scl_o    : std_logic;
  signal iic_wib_scl_t    : std_logic;
  signal iic_wib_sda_i    : std_logic;
  signal iic_wib_sda_o    : std_logic;
  signal iic_wib_sda_t    : std_logic;
--  signal MDIO_mdio_i      : std_logic;
--  signal MDIO_mdio_o      : std_logic;
--  signal MDIO_mdio_t      : std_logic;
--  signal ETH_CLK125       : std_logic;
--  signal ETH_CLK125_90    : std_logic;
--  signal ETH_CLK25        : std_logic;
--  signal ETH_CLK10        : std_logic;
--  signal ETH_resetn       : std_logic;
--  signal GMII_col         : std_logic;
--  signal GMII_crs         : std_logic;
--  signal GMII_rx_clk      : std_logic;
--  signal GMII_rx_dv       : std_logic;
--  signal GMII_rx_er       : std_logic;
--  signal GMII_rxd         : std_logic_vector(7 downto 0);
--  signal GMII_speed_mode  : std_logic_vector(2 downto 0);
--  signal GMII_tx_clk      : std_logic;
--  signal GMII_tx_en       : std_logic;
--  signal GMII_tx_er       : std_logic;
--  signal GMII_txd         : std_logic_vector(7 downto 0);
  signal LedCount         : unsigned(23 downto 0);

begin
  
  ---------------------------------------------------------------------------------------------------
  -- processor system instance
  ---------------------------------------------------------------------------------------------------
  Mercury_XU5_i: component Mercury_XU5
    port map (
      Clk100               => Clk100,
      Clk50                => Clk50,
      Rst_N                => Rst_N,
      LED_N                => LED_N,
      C0_SYS_CLK_clk_n     => CLK100_PL_N,
      C0_SYS_CLK_clk_p     => CLK100_PL_P,
      C0_DDR4_act_n        => DDR4PL_ACT_N,
      C0_DDR4_reset_n      => DDR4PL_RST_N,
      C0_DDR4_ba           => DDR4PL_BA,
      C0_DDR4_bg           => DDR4PL_BG (BG_WIDTH-1 downto 0),
      C0_DDR4_cke          => DDR4PL_CKE,
      C0_DDR4_dq           => DDR4PL_DQ,
      C0_DDR4_odt          => DDR4PL_ODT,
      C0_DDR4_adr          => DDR4PL_A,
      C0_DDR4_ck_c         => DDR4PL_CK_N,
      C0_DDR4_ck_t         => DDR4PL_CK_P,
      C0_DDR4_cs_n         => DDR4PL_CS_N,
      C0_DDR4_dm_n         => DDR4PL_DM,
      C0_DDR4_dqs_c        => DDR4PL_DQS_N,
      C0_DDR4_dqs_t        => DDR4PL_DQS_P,
      iic_ptc_scl_i        => iic_ptc_scl_i,
      iic_ptc_scl_o        => iic_ptc_scl_o,
      iic_ptc_scl_t        => iic_ptc_scl_t,
      iic_ptc_sda_i        => iic_ptc_sda_i,
      iic_ptc_sda_o        => iic_ptc_sda_o,
      iic_ptc_sda_t        => iic_ptc_sda_t,
      iic_wib_scl_i        => iic_wib_scl_i,
      iic_wib_scl_o        => iic_wib_scl_o,
      iic_wib_scl_t        => iic_wib_scl_t,
      iic_wib_sda_i        => iic_wib_sda_i,
      iic_wib_sda_o        => iic_wib_sda_o,
      iic_wib_sda_t        => iic_wib_sda_t,
      ECAT_UART_txd        => ECAT_UART_TX,
      ECAT_UART_rxd        => ECAT_UART_RX,
      DEBUG_UART_txd       => DEBUG_UART_TX,
      DEBUG_UART_rxd       => DEBUG_UART_RX,
      reg_ro               => reg_ro,
      reg_rw               => reg_rw
--      MDIO_mdc             => ETH1_MDC,
--      MDIO_mdio_i          => MDIO_mdio_i,
--      MDIO_mdio_o          => MDIO_mdio_o,
--      MDIO_mdio_t          => MDIO_mdio_t,
--      ETH_CLK125           => ETH_CLK125,
--      ETH_CLK125_90        => ETH_CLK125_90,
--      ETH_CLK25            => ETH_CLK25,
--      ETH_CLK10            => ETH_CLK10,
--      ETH_resetn           => ETH_resetn,
--      GMII_col             => GMII_col,
--      GMII_crs             => GMII_crs,
--      GMII_rx_clk          => GMII_rx_clk,
--      GMII_rx_dv           => GMII_rx_dv,
--      GMII_rx_er           => GMII_rx_er,
--      GMII_rxd             => GMII_rxd,
--      GMII_speed_mode      => GMII_speed_mode,
--      GMII_tx_clk          => GMII_tx_clk,
--      GMII_tx_en           => GMII_tx_en,
--      GMII_tx_er           => GMII_tx_er,
--      GMII_txd             => GMII_txd
    );
  
  process (Clk50)
  begin
    if rising_edge (Clk50) then
      if Rst_N = '0' then
        LedCount    <= (others => '0');
      else
        LedCount    <= LedCount + 1;
      end if;
    end if;
  end process;
  Led1_N <= '0' when LedCount(LedCount'high) = '0' else 'Z';
  Led2_N <= '0' when LED_N(0) = '0' else 'Z';
  Led3_N <= '0' when LED_N(1) = '0' else 'Z';
--  MDIO_mdio_iobuf: component IOBUF
--    port map (
--      I => MDIO_mdio_o,
--      IO => ETH1_MDIO,
--      O => MDIO_mdio_i,
--      T => MDIO_mdio_t
--    );
  
--  i_gmii2rgmii : Mercury_XU5_GMII2RGMII
--    port map (
--      Clk125          => ETH_CLK125,
--      Clk125_90       => ETH_CLK125_90,
--      Clk25           => ETH_Clk25,
--      Clk10           => ETH_Clk10,
--      Resetn          => ETH_resetn,
  
--      GMII_col        => GMII_col,
--      GMII_crs        => GMII_crs,
--      GMII_rx_clk     => GMII_rx_clk,
--      GMII_rx_dv      => GMII_rx_dv,
--      GMII_rx_er      => GMII_rx_er,
--      GMII_rxd        => GMII_rxd,
--      GMII_speed_mode => GMII_speed_mode,
--      GMII_tx_clk     => GMII_tx_clk,
--      GMII_tx_en      => GMII_tx_en,
--      GMII_tx_er      => GMII_tx_er,
--      GMII_txd        => GMII_txd,
  
--      RGMII_rxd       => ETH1_RXD,
--      RGMII_rxclk     => ETH1_RXCLK,
--      RGMII_rxctl     => ETH1_RXCTL,
--      RGMII_txd       => ETH1_TXD,
--      RGMII_txclk     => ETH1_TXCLK,
--      RGMII_txctl     => ETH1_TXCTL,
  
--      Speed1000En     => open,
--      Speed100En      => open,
--      Speed10En       => open
--    );
  
--  ETH1_RESET_N        <= ETH_resetn;

  ---------------------------------------------------------------------------------------------------
  -- main top level code instance
  ---------------------------------------------------------------------------------------------------

   OBUFDS_cmd : OBUFDS
   port map (
      O => SYS_CMD_P,
      OB => SYS_CMD_N,
      I => SYS_CMD
   );
   
   OBUFDS_socclk : OBUFDS
   port map (
      O => SOC_AUX_CLK_P,
      OB => SOC_AUX_CLK_N,
      I => SOC_AUX_CLK
   );  
   
   IBUFDS_clk : IBUFDS
   port map (
      O => SYS_CLK,
      I => SYS_CLK_P,
      IB => SYS_CLK_N
   );   
   
  -- IBUFDS_clk_pl : IBUFDS
  -- port map (
  --    O => CLK100_PL_SE,
  --    I => CLK100_PL_P,
  --    IB => CLK100_PL_N
  -- );    

  top: component top_RTL
    port map (
    clk_axi             => Clk100,
    reg_rw_in           => reg_rw,
    
    XMC_JTAG_TMS        => XMC_JTAG_TMS,
    XMC_JTAG_TCK        => XMC_JTAG_TCK,
    XMC_JTAG_TDO        => XMC_JTAG_TDO,
    XMC_JTAG_TDI        => XMC_JTAG_TDI,
    XMC_JTAG_RST        => XMC_JTAG_RST,
    OVER_TEMP_LED       => OVER_TEMP_LED,
    --ECAT_UART_RX        => ECAT_UART_TX,
    --ECAT_UART_RX        => ECAT_UART_RX,
    --DEBUG_UART_TX       => DEBUG_UART_TX,
    --DEBUG_UART_RX       => DEBUG_UART_RX,
    LV_SYNC             => LV_SYNC,
    VP12_EN(0)          => VP12_EN0,
    VP12_EN(1)          => VP12_EN1,
    VP12_EN(2)          => VP12_EN2,
    VP12_EN(3)          => VP12_EN3,
    VP12_EN(4)          => VP12_EN4,
    VP12_EN(5)          => VP12_EN5,
    VP12_SYNC(0)        => VP12_SYNC0,
    VP12_SYNC(1)        => VP12_SYNC1,
    VP12_SYNC(2)        => VP12_SYNC2,
    VP12_SYNC(3)        => VP12_SYNC3,
    VP12_SYNC(4)        => VP12_SYNC4,
    VP12_SYNC(5)        => VP12_SYNC5,
    VP12_SYNC(6)        => VP12_SYNC6,
    OVER_TEMP(0)        => OVER_TEMP0,
    OVER_TEMP(1)        => OVER_TEMP1,
    OVER_TEMP(2)        => OVER_TEMP2,
    VP2V5_ALERT         => VP2V5_ALERT,
    VP3V3_ALERT         => VP3V3_ALERT,
    VP12_IV_ALERT(0)    => VP12_IV_ALERT0,
    VP12_IV_ALERT(1)    => VP12_IV_ALERT1,
    VP12_IV_ALERT(2)    => VP12_IV_ALERT2,
    VP12_IV_ALERT(3)    => VP12_IV_ALERT3,
    VP12_IV_ALERT(4)    => VP12_IV_ALERT4,
    VP12_IV_ALERT(5)    => VP12_IV_ALERT5,
    VP12_IV_ALERT(6)    => VP12_IV_ALERT6,
    WIB_PE_SEL          => WIB_PE_SEL,
    SFP2_LOS            => SFP2_LOS,
    SFP2_PRESENT        => SFP2_PRESENT,
    WIB_RX_SEL(0)       => WIB_RX_SEL0,
    WIB_RX_SEL(1)       => WIB_RX_SEL1,
    WIB_RX_SEL(2)       => WIB_RX_SEL2,
    SFP0_LOS            => SFP0_LOS,
    SFP0_TX_FAULT       => SFP0_TX_FAULT,
    SFP0_PRESENT        => SFP0_PRESENT,
    VP48_IV_ALERT       => VP48_IV_ALERT,
    SOC_I2C_SW_RST      => SOC_I2C_SW_RST,
    SFP1_TX_FAULT       => SFP1_TX_FAULT,
    SFP2_TX_FAULT       => SFP2_TX_FAULT,
    SFP2_TX_DISABLE     => SFP2_TX_DISABLE,
    SFP1_LOS            => SFP1_LOS,
    SFP1_PRESENT        => SFP1_PRESENT,
    --WIB_SCL             => WIB_SCL,
    --WIB_SDA             => WIB_SDA,
    WIB_I2C_OE          => WIB_I2C_OE,
    MCU_I2C_OE          => MCU_I2C_OE,
    WIB_CLK_SEL         => WIB_CLK_SEL,
    SYS_CMD             => SYS_CMD,
    SOC_AUX_CLK         => SOC_AUX_CLK,
    SYS_CLK             => SYS_CLK,
    BP_IO(0)            => BP_IO0,
    BP_IO(1)            => BP_IO1,
    BP_IO(2)            => BP_IO2,
    BP_IO(3)            => BP_IO3,
    BP_IO(4)            => BP_IO4,
    BP_IO(5)            => BP_IO5,
    BP_IO_OE            => BP_IO_OE,
    TIMING_GOOD         => TIMING_GOOD,
    EN_3V3              => EN_3V3,
    EN_2V5              => EN_2V5,
    CRATE_ADDR_OE       => CRATE_ADDR_OE,
    CRATE_ADDR(0)       => CRATE_ADDR0,
    CRATE_ADDR(1)       => CRATE_ADDR1,
    CRATE_ADDR(2)       => CRATE_ADDR2,
    CRATE_ADDR(3)       => CRATE_ADDR3,
    CRATE_ADDR(4)       => CRATE_ADDR4,
    CRATE_ADDR(5)       => CRATE_ADDR5,
    CRATE_ADDR(6)       => CRATE_ADDR6,
    CRATE_ADDR(7)       => CRATE_ADDR7,
        
    reg_ro_out          => reg_ro
    );
    
  ---------------------------------------------------------------------------------------------------
  -- I2C passthtough for PL side I2C
  ---------------------------------------------------------------------------------------------------
   IOBUF_ptc_scl : IOBUF
   port map (
      O => iic_ptc_scl_i,
      I => iic_ptc_scl_o,
      IO => SOC_I2C_SCL,
      T => iic_ptc_scl_t
   );

   IOBUF_ptc_sda : IOBUF
   port map (
      O => iic_ptc_sda_i,
      I => iic_ptc_sda_o,
      IO => SOC_I2C_SDA,
      T => iic_ptc_sda_t
   );

   IOBUF_wib_scl : IOBUF
   port map (
      O => iic_wib_scl_i,
      I => iic_wib_scl_o,
      IO => WIB_SCL,
      T => iic_wib_scl_t
   );

   IOBUF_wib_sda : IOBUF
   port map (
      O => iic_wib_sda_i,
      I => iic_wib_sda_o,
      IO => WIB_SDA,
      T => iic_wib_sda_t
   );

end rtl;
