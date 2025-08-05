# Clock Divider Frequencies
The written clock divider uses an 3 bit counter, so divisions up to 7 are possible. For a nominal 50 MHz clock, the output of the divider will look like:

| Div     |  Frequency  | Period  |
| ------- | ----------- | --------|
| 1       | 25MHz       | 40ns    |
| 2       | 12.5MHz     | 80ns    |
| 3       | ~8.3MHz     | 120ns    |
| 4       | 6.25MHz     | 160ns    |
| 5       | 5MHz        | 200ns    |
| 6       | ~4.17MHz    | 240ns    |
| 7       | ~3.57MHz    | 280ns    |

It is important to note that the PWM module uses the output of this clock divider almost as if it were the main clock. By virtue of PWM, this means the effective output will be divided again, and the PWM module was also written with a 3 bit counter.


# RW Register Map

| reg no.         | bits    | name            | description                                              |            | bits req |     |
| --------------- | ------- | --------------- | -------------------------------------------------------- | ---------- | -------- | --- |
| 0               | [16]    | bp_io_en        |                                                          |            |          |     |
| 0               | [23]    | crate_addre_en  |                                                          |            |          |     |
| 0               | [31:24] | crate_addr_out  |                                                          |            |          |     |
|                 |         |                 |                                                          |            |          |     |
| 1               | [10]    | ep_srst         |                                                          |            |          |     |
| 1               | [11]    | ep_clk_sel      |                                                          |            |          |     |
| 1               | [17]    | mmcm0_rst_n     |                                                          |            |          |     |
|                 |         |                 |                                                          |            |          |     |
| 2               | [0]     | EN_3V3          |                                                          |            |          |     |
| 3               | [0]     | EN_2V5          |                                                          |            |          |     |
| 10              | [6:0]   | vp12_sync_en    |                                                          |            |          |     |
| 10              | [7]     | lvsync_en       |                                                          |            |          |     |
|                 |         |                 |                                                          |            |          |     |
| 14              | [9]     | PWM_EN0         | Allows the PWM module to produce an output               | enable     | 1        |     |
| 14              | [8]     | PWM_RST0        | Sets the duty cycle to what is set in bits 5:3           | rst        | 1        |     |
| 14              | [7]     | PWM_INC0        | Increases the duty cycle by 12.5%                        | inc        | 1        |     |
| 14              | [6]     | PWM_DEC0        | Decreases the duty cycle by 12.5%                        | dec        | 1        |     |
| 14              | [5:3]   | PWM_DUTY0       | Sets the duty cycle to this value when reset is asserted | duty cycle | 3        |     |
| 14              | [2:0]   | PWM_DIV0        | Clock divider value                                      | clk divide | 3        |     |
|                 |         |                 |                                                          |            |          |     |
| 15              | [9]     | PWM_EN1         | Allows the PWM module to produce an output               | enable     | 1        |     |
| 15              | [8]     | PWM_RST1        | Sets the duty cycle to what is set in bits 5:3           | rst        | 1        |     |
| 15              | [7]     | PWM_INC1        | Increases the duty cycle by 12.5%                        | inc        | 1        |     |
| 15              | [6]     | PWM_DEC1        | Decreases the duty cycle by 12.5%                        | dec        | 1        |     |
| 15              | [5:3]   | PWM_DUTY1       | Sets the duty cycle to this value when reset is asserted | duty cycle | 3        |     |
| 15              | [2:0]   | PWM_DIV1        | Clock divider value                                      | clk divide | 3        |     |
|                 |         |                 |                                                          |            |          |     |
| 16              | [9]     | PWM_EN2         | Allows the PWM module to produce an output               | enable     | 1        |     |
| 16              | [8]     | PWM_RST2        | Sets the duty cycle to what is set in bits 5:3           | rst        | 1        |     |
| 16              | [7]     | PWM_INC2        | Increases the duty cycle by 12.5%                        | inc        | 1        |     |
| 16              | [6]     | PWM_DEC2        | Decreases the duty cycle by 12.5%                        | dec        | 1        |     |
| 16              | [5:3]   | PWM_DUTY2       | Sets the duty cycle to this value when reset is asserted | duty cycle | 3        |     |
| 16              | [2:0]   | PWM_DIV2        | Clock divider value                                      | clk divide | 3        |     |
|                 |         |                 |                                                          |            |          |     |
| 17              | [9]     | PWM_EN3         | Allows the PWM module to produce an output               | enable     | 1        |     |
| 17              | [8]     | PWM_RST3        | Sets the duty cycle to what is set in bits 5:3           | rst        | 1        |     |
| 17              | [7]     | PWM_INC3        | Increases the duty cycle by 12.5%                        | inc        | 1        |     |
| 17              | [6]     | PWM_DEC3        | Decreases the duty cycle by 12.5%                        | dec        | 1        |     |
| 17              | [5:3]   | PWM_DUTY3       | Sets the duty cycle to this value when reset is asserted | duty cycle | 3        |     |
| 17              | [2:0]   | PWM_DIV3        | Clock divider value                                      | clk divide | 3        |     |
|                 |         |                 |                                                          |            |          |     |
| 18              | [9]     | PWM_EN4         | Allows the PWM module to produce an output               | enable     | 1        |     |
| 18              | [8]     | PWM_RST4        | Sets the duty cycle to what is set in bits 5:3           | rst        | 1        |     |
| 18              | [7]     | PWM_INC4        | Increases the duty cycle by 12.5%                        | inc        | 1        |     |
| 18              | [6]     | PWM_DEC4        | Decreases the duty cycle by 12.5%                        | dec        | 1        |     |
| 18              | [5:3]   | PWM_DUTY4       | Sets the duty cycle to this value when reset is asserted | duty cycle | 3        |     |
| 18              | [2:0]   | PWM_DIV4        | Clock divider value                                      | clk divide | 3        |     |
|                 |         |                 |                                                          |            |          |     |
| 19              | [9]     | PWM_EN5         | Allows the PWM module to produce an output               | enable     | 1        |     |
| 19              | [8]     | PWM_RST5        | Sets the duty cycle to what is set in bits 5:3           | rst        | 1        |     |
| 19              | [7]     | PWM_INC5        | Increases the duty cycle by 12.5%                        | inc        | 1        |     |
| 19              | [6]     | PWM_DEC5        | Decreases the duty cycle by 12.5%                        | dec        | 1        |     |
| 19              | [5:3]   | PWM_DUTY5       | Sets the duty cycle to this value when reset is asserted | duty cycle | 3        |     |
| 19              | [2:0]   | PWM_DIV5        | Clock divider value                                      | clk divide | 3        |     |

# RO Register Map
| reg no.         | bits    | name            | description                                              |            | bits req |     |
| --------------- | ------- | --------------- | -------------------------------------------------------- | ---------- | -------- | --- |
| 1               | [27:24] | timing_stat     |                                                          |            |          |     |
| 1               | [28]    | timing_lock     |                                                          |            |          |     |
|                 |         |                 |                                                          |            |          |     |
| 2               | [6:0]   | VP12_IV_ALERT   | low = alert                                              |            |          |     |
| 2               | [8]     | VP2V5_ALER      | low = alert                                              |            |          |     |
| 2               | [9]     | VP3V3_ALERT     | low = alert                                              |            |          |     |
|                 |         |                 |                                                          |            |          |     |
| 62              | [0]     | mmcm0_locked    | Test                                                     |            |          |     |
|                 |         |                 |                                                          |            |          |     |
| 63              | [31:0]  | 32'hdeadbeef    | Test                                                     |            |          |     |
