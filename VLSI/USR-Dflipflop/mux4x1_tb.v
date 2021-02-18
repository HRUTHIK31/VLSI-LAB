`include "mux4x1.v"

module mux4x1_tb;

reg i3, i2, i1, i0;
reg s1, s0;

wire out;

mux4x1 m1 (out, s1, s0, i3, i2, i1, i0);

initial
begin
	$dumpfile("mux4x1_tb.vcd"); 
	$dumpvars;
	
	i3 = 1'b0; 
	i2 = 1'b0;
	i1 = 1'b1;
	i0 = 1'b1;
    #5 $display("i3 = %b, i2 = %b, i1 = %b, i0 = %b\n",i3, i2, i1, i0);
		
	s1 = 1'b0;
	s0 = 1'b0;
	#5 $display("s1 = %b, s0 = %b, out = %b\n",s1,s0,out);
		
	s1 = 1'b0;
	s0 = 1'b1;
	#5 $display("s1 = %b, s0 = %b, out = %b\n",s1,s0,out);
		
	s1 = 1'b1;
	s0 = 1'b0;
	#5 $display("s1 = %b, s0 = %b, out = %b\n",s1,s0,out);
		
	s1 = 1'b1;
	s0 = 1'b1;
	#5 $display("s1 = %b, s0 = %b, out = %b\n",s1,s0,out);
	
end
	
endmodule
