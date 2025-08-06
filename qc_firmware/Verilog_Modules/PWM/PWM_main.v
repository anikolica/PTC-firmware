`include "counter.v"

module PWM_main(
	input clk,
	input reset,
	input [7:0] duty_cycle, //Duty cycle declaration
	output reg PWM_out //Output pin for the modified signal
);
	wire [7:0] counter; //The counter that is compared to the duty cycle

	counter counter_inst(
	.clk(clk),
	.counter(counter)
	);



	always @(posedge clk)
		if(duty_cycle > counter)
			PWM_out <= 1'b1;
		else
			PWM_out <= 1'b0;
endmodule
