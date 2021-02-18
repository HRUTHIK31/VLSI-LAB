`include "parallel_prefix_adder.v"

module parallel_prefix_tb;
	
	reg [31:0] a;
	reg [31:0] b;
	wire [31:0] sum;
	wire c;

	cla_adder ppa(a, b, sum, c);
	
	initial	begin
 		
 		a = 32'b01010101010101010101010101010101;
		b = 32'b10101010101010101010101010101010;
		
		$monitor("c = %d, sum[31:0] = %d", c, sum[31:0]);
		
	end
				
endmodule
