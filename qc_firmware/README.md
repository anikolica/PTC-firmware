| reg no.         | bits    | name            | description                                              |            | bits req |
| --------------- | ------- | --------------- | -------------------------------------------------------- | ---------- | -------- |
| 0               | [0]     | SOC_I2C_SW_RST  |                                                          |            |          |
| 0               | [8]     | MCU_I2C_OE      |                                                          |            |          |
| 0               | [9]     | WIB_I2C_OE      |                                                          |            |          |
| 0               | [16]    | bp_io_en        |                                                          |            |          |
| 0               | [23]    | crate_addre_en  |                                                          |            |          |
| 0               | [31:24] | crate_addr_out  |                                                          |            |          |
|                 |         |                 |                                                          |            |          |
| 1               | [2:0]   | wib_rx_sel_out  |                                                          |            |          |
| 1               | [3]     | wip_pe_soc_en   |                                                          |            |          |
| 1               | [8]     | sfp2_tx_en_reg  |                                                          |            |          |
| 1               | [9]     | sfp2_tx_mux_ovr |                                                          |            |          |
| 1               | [10]    | ep_srst         |                                                          |            |          |
| 1               | [11]    | ep_clk_sel      |                                                          |            |          |
| 1               | [16]    | WIB_CLK_SEL     |                                                          |            |          |
| 1               | [17]    | mmcm0_rst_n     |                                                          |            |          |
|                 |         |                 |                                                          |            |          |
| 2               | [0]     | EN_3V3          |                                                          |            |          |
| 3               | [0]     | EN_2V5          |                                                          |            |          |
| 4               | [0]     | VP12_EN[0]      |                                                          |            |          |
| 5               | [0]     | VP12_EN[1]      |                                                          |            |          |
| 6               | [0]     | VP12_EN[2]      |                                                          |            |          |
| 7               | [0]     | VP12_EN[3]      |                                                          |            |          |
| 8               | [0]     | VP12_EN[4]      |                                                          |            |          |
| 9               | [0]     | VP12_EN[5]      |                                                          |            |          |
| 10              | [6:0]   | vp12_sync_en    |                                                          |            |          |
| 10              | [7]     | lvsync_en       |                                                          |            |          |
|                 |         |                 |                                                          |            |          |
| 11              | [0]     | xmc_jtag_en     |                                                          |            |          |
| 11              | [8]     | xmc_reset_n     |                                                          |            |          |
|                 |         |                 |                                                          |            |          |
| 12              | [0]     | SFP0_SPARE_LED  |                                                          |            |          |
| 12              | [1]     | OVER_TEMP_LED   |                                                          |            |          |
|                 |         |                 |                                                          |            |          |
| 13              | [9]     | PWM_EN0         | Allows the PWM module to produce an output               | enable     | 1        |
| 13              | [8]     | PWM_RST0        | Sets the duty cycle to what is set in bits 5:3           | rst        | 1        |
| 13              | [7]     | PWM_INC0        | Increases the duty cycle by 12.5%                        | inc        | 1        |
| 13              | [6]     | PWM_DEC0        | Decreases the duty cycle by 12.5%                        | dec        | 1        |
| 13              | [5:3]   | PWM_DUTY0       | Sets the duty cycle to this value when reset is asserted | duty cycle | 3        |
| 13              | [2:0]   | PWM_DIV0        | Clock divider value                                      | clk divide | 3        |
|                 |         |                 |                                                          |            |          |
| 15              | [9]     | PWM_EN1         | Allows the PWM module to produce an output               | enable     | 1        |
| 15              | [8]     | PWM_RST1        | Sets the duty cycle to what is set in bits 5:3           | rst        | 1        |
| 15              | [7]     | PWM_INC1        | Increases the duty cycle by 12.5%                        | inc        | 1        |
| 15              | [6]     | PWM_DEC1        | Decreases the duty cycle by 12.5%                        | dec        | 1        |
| 15              | [5:3]   | PWM_DUTY1       | Sets the duty cycle to this value when reset is asserted | duty cycle | 3        |
| 15              | [2:0]   | PWM_DIV1        | Clock divider value                                      | clk divide | 3        |
|                 |         |                 |                                                          |            |          |
| 16              | [9]     | PWM_EN2         | Allows the PWM module to produce an output               | enable     | 1        |
| 16              | [8]     | PWM_RST2        | Sets the duty cycle to what is set in bits 5:3           | rst        | 1        |
| 16              | [7]     | PWM_INC2        | Increases the duty cycle by 12.5%                        | inc        | 1        |
| 16              | [6]     | PWM_DEC2        | Decreases the duty cycle by 12.5%                        | dec        | 1        |
| 16              | [5:3]   | PWM_DUTY2       | Sets the duty cycle to this value when reset is asserted | duty cycle | 3        |
| 16              | [2:0]   | PWM_DIV2        | Clock divider value                                      | clk divide | 3        |
|                 |         |                 |                                                          |            |          |
| 17              | [9]     | PWM_EN3         | Allows the PWM module to produce an output               | enable     | 1        |
| 17              | [8]     | PWM_RST3        | Sets the duty cycle to what is set in bits 5:3           | rst        | 1        |
| 17              | [7]     | PWM_INC3        | Increases the duty cycle by 12.5%                        | inc        | 1        |
| 17              | [6]     | PWM_DEC3        | Decreases the duty cycle by 12.5%                        | dec        | 1        |
| 17              | [5:3]   | PWM_DUTY3       | Sets the duty cycle to this value when reset is asserted | duty cycle | 3        |
| 17              | [2:0]   | PWM_DIV3        | Clock divider value                                      | clk divide | 3        |
|                 |         |                 |                                                          |            |          |
| 18              | [9]     | PWM_EN4         | Allows the PWM module to produce an output               | enable     | 1        |
| 18              | [8]     | PWM_RST4        | Sets the duty cycle to what is set in bits 5:3           | rst        | 1        |
| 18              | [7]     | PWM_INC4        | Increases the duty cycle by 12.5%                        | inc        | 1        |
| 18              | [6]     | PWM_DEC4        | Decreases the duty cycle by 12.5%                        | dec        | 1        |
| 18              | [5:3]   | PWM_DUTY4       | Sets the duty cycle to this value when reset is asserted | duty cycle | 3        |
| 18              | [2:0]   | PWM_DIV4        | Clock divider value                                      | clk divide | 3        |
|                 |         |                 |                                                          |            |          |
| 19              | [9]     | PWM_EN5         | Allows the PWM module to produce an output               | enable     | 1        |
| 19              | [8]     | PWM_RST5        | Sets the duty cycle to what is set in bits 5:3           | rst        | 1        |
| 19              | [7]     | PWM_INC5        | Increases the duty cycle by 12.5%                        | inc        | 1        |
| 19              | [6]     | PWM_DEC5        | Decreases the duty cycle by 12.5%                        | dec        | 1        |
| 19              | [5:3]   | PWM_DUTY5       | Sets the duty cycle to this value when reset is asserted | duty cycle | 3        |
| 19              | [2:0]   | PWM_DIV5        | Clock divider value                                      | clk divide | 3        |
|                 |         |                 |                                                          |            |          |
| RO REGISTER MAP |         |                 |                                                          |            |          |
| reg no.         | bits    | name            | description                                              |            | bits req |
| 0               | [0]     | SFP0_TX_FAULT   | low = no fault                                           |            |          |
| 0               | [1]     | SFP0_LOS        | low = no loss of signal                                  |            |          |
| 0               | [2]     | SFP0_PRESENT    | low = present                                            |            |          |
| 0               | [8]     | SFP1_TX_FAULT   | low = no fault                                           |            |          |
| 0               | [9]     | SFP1_LOS        | low = no loss of signal                                  |            |          |
| 0               | [10]    | SFP1_PRESENT    | low = present                                            |            |          |
| 0               | [16]    | SFP2_TX_FAULT   | low = no fault                                           |            |          |
| 0               | [17]    | SFP2_LOS        | low = no loss of signal                                  |            |          |
| 0               | [18]    | SFP2_PRESENT    | low = present                                            |            |          |
|                 |         |                 |                                                          |            |          |
| 1               | [13:8]  | BP_IO           |                                                          |            |          |
| 1               | [18:16] | wib_rx_sel_in   |                                                          |            |          |
| 1               | [27:24] | timing_stat     |                                                          |            |          |
| 1               | [28]    | timing_lock     |                                                          |            |          |
|                 |         |                 |                                                          |            |          |
| 2               | [6:0]   | VP12_IV_ALERT   | low = alert                                              |            |          |
| 2               | [8]     | VP2V5_ALER      | low = alert                                              |            |          |
| 2               | [9]     | VP3V3_ALERT     | low = alert                                              |            |          |
| 2               | [18:16] | OVER_TEMP       | low = alert                                              |            |          |
| 2               | [24]    | VP48_IV_ALERT   | low = alert                                              |            |          |
|                 |         |                 |                                                          |            |          |
| 62              | [0]     | mmcm0_locked    | Test                                                     |            |          |
|                 |         |                 |                                                          |            |          |
| 63              | [31:0]  | 32'hdeadbeef    | Test                                                     |            |          |
