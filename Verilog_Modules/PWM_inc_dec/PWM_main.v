module PWM_main(
	input clk,
	input en,
	input rst,
	input duty_inc,
	input duty_dec,
	input [2:0]  duty,
	output reg PWM_out //Output pin for the modified signal
);
	reg [2:0] counter; //The counter that is compared to the duty cycle
	reg [2:0] duty_cycle;

	//Instantiate a counter module
	always @(posedge clk)
		if(en) begin
			counter <= counter + 1'b1;
			
			//Comparator for duty cycle
				if(duty_cycle > counter)
					PWM_out <= 1'b1;
				else
					PWM_out <= 1'b0;

			//If either duty_inc or duty_dec, change the cycle by approximately 10%
				if (rst)
					duty_cycle <= duty;
				else begin
					if(duty_inc==1 && duty_cycle < 7)
						duty_cycle <= duty_cycle + 1;
					else if(duty_dec && duty_cycle >= 1)
						duty_cycle <= duty_cycle - 1;
				end
		end

		else
			PWM_out = 1'b0;
endmodule
