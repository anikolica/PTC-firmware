`include "clock_div.v"

module PWM(
	input clk,
	input en,
	input rst,
	input duty_inc,
	input duty_dec,
	input [2:0]  duty, //Bits to control the ratio of on to off
	input [2:0] div, //Bits to control how divided the clock is
	output reg PWM_out //Output pin for the modified signal
);
	reg [2:0] counter; //The counter that is compared to the duty cycle
	reg [2:0] duty_cycle; //Register for the current working duty cycle
	reg [2:0] duty_prev; //Register to story the previous duty cycle
	reg  duty_changed; //When asserted indicates if the duty cycle changed
	wire clk_div;

	//Instantiate a clock divider
	clock_div clock_div_inst(
		.CLK(clk),
		.RST(rst),
		.div(div),
		.clk_div(clk_div)
	);

	//Reset will initialize everything to zero and a duty cycle of 50%
	always @(posedge rst)
	begin
		counter <= 0;
		duty_prev <= 0;
		duty_cycle <= 3'b100;
		PWM_out <= 0;
	end

	//Check to see if the duty input changed
	always @(posedge clk_div)
	begin
		duty_prev <= duty; //These lines run in parallel
		duty_changed <= (duty_prev != duty);
	end

	//Block for counter and PWM 
	always @(posedge clk_div)
		if(en) begin
			counter <= counter + 1'b1;	
			//Comparator for duty cycle
				if(duty_cycle > counter)
					PWM_out <= 1'b1;
				else
					PWM_out <= 1'b0;
			end
		else begin 
			PWM_out <= 1'b0;

		end

	//If either duty_inc or duty_dec, change the cycle by approximately 10%
	always @(posedge clk_div)
		if(en) begin
			//Assigns the duty cycle if it was changed via control bits
			if(duty_changed) begin
				duty_cycle <= duty;
				duty_changed <= 1'b0;
			end
			//Changes the duty cycle if duty_inc or duty_dec are asserted
			else begin
				if(duty_inc==1 && duty_cycle < 7)
					duty_cycle <= duty_cycle + 1;
				else if(duty_dec && duty_cycle >= 1)
					duty_cycle <= duty_cycle - 1;
				end
		end
endmodule
