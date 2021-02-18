
`include "rca32BitFullAdder.v"
module top;
reg [31:0] a, b;
reg cin;
wire [31:0] sum;
wire ca;

rca32BitFullAdder FullAdd_0 (a, b, cin, sum, ca);

initial
begin
	a = 32'd0; b = 32'd0; cin = 1'b0;

		#5 a = 32'd5; b = 32'd8;

		#5 a = 32'd14; b = 32'd5;

		#5 a = 32'd17; b = 32'd10;

		#5 a = 32'd19; b = 32'd8;

		#5 a = 32'd2; b = 32'd21;
	
end

initial begin
	$monitor ($time, "  a = %b; b = %b; cin = %b; sum = %b; ca = %b", a, b, cin, sum, ca);

$dumpfile("rca32bit.vcd"); 
$dumpvars;   	
end
endmodule
   
