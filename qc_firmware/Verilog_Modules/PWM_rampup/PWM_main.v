`include "counter.v"
`include "stepper.v"

module PWM_main(
	input clk,
	output reg PWM_out //Output pin for the modified signal
);
	wire [3:0] counter; //The counter that is compared to the duty cycle
	reg [3:0] duty_cycle = 4'b0; //Duty cycle declaration
	wire [11:0] stepper_counter;
       	
	//Instantiate a counter module
	counter counter_inst(
		.clk(clk),
		.counter(counter)
	);
	
	//Instantiation of a stepper
	stepper stepper_inst(
		.clk(clk),
		.step(stepper_counter)
	);

	//Comparator for duty cycle
	always @(posedge clk)
		if(duty_cycle > counter)
			PWM_out <= 1'b1;
		else
			PWM_out <= 1'b0;

	//Every 4096 clk cycles, increase the duty cycle by 10%
	always @(posedge clk)
		if(stepper_counter>=4095 &&  duty_cycle < 14)
			duty_cycle = duty_cycle + 2;
		else
			duty_cycle = duty_cycle;
endmodule
