`include "counter.v"

module PWM_main(
	input clk,
	input duty_inc,
	input duty_dec,
	output reg PWM_out //Output pin for the modified signal
);
	wire [3:0] counter; //The counter that is compared to the duty cycle
	reg [3:0] duty_cycle = 4'b1000; //Duty cycle declaration
	
	//Instantiate a counter module
	counter counter_inst(
		.clk(clk),
		.counter(counter)
	);

	
	//Comparator for duty cycle
	always @(posedge clk)
		if(duty_cycle > counter)
			PWM_out <= 1'b1;
		else
			PWM_out <= 1'b0;

	//If either duty_inc or duty_dec, change the cycle by approximately 10%
	always @(posedge clk)
		if(duty_inc==1 && duty_cycle < 13)
			duty_cycle = duty_cycle + 2;
		else if(duty_dec && duty_cycle >= 2)
			duty_cycle = duty_cycle - 2;
		else
			duty_cycle = duty_cycle;
endmodule
