module mux4x1(out, s1, s0, i3, i2, i1, i0);
input i3,i2,i1,i0;
input s1,s0;
output reg out;

always@(s1,s0,i3,i2,i1,i0)
begin
	if(s1==0 && s0 ==0)
		out=i0;
	else if(s1==0 && s0 ==1)
		out=i1;
	else if(s1==1 && s0 ==0)
		out=i2;
	else if(s1==1 && s0==1)
		out=i3;
end
endmodule
