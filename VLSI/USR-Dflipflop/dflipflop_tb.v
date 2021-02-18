`include "dflipflop.v"

module dflipflop_tb;

reg d, clk, reset;

wire q;
	
dflipflop  d1 (q, d, clk, reset);
		
always 
begin
	clk = 1'b0;
	#5;
	clk = 1'b1;
	#5;
end
	
initial	begin
$dumpfile("dflipflop_tb.vcd"); 
$dumpvars;
 		
reset = 1;

#10
reset = 0; 
d = 1;

#10
d = 0;

#10 
d = 1;

#10 $finish;
end
		
initial
	$monitor ($time, "   q = %b, d = %b, clk = %b, reset = %b",q,d,clk,reset);
	
endmodule
