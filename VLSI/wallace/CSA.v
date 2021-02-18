`include "FA.v"

module carrysaveadder(A,B,C,u,v);
input [63:0] A,B,C;
output [63:0]v;
output [63:0]u;
wire c;

assign v[0]=0;
genvar i;
generate
for(i=0;i<=62;i=i+1)
begin:iloop

 FA ful(A[i],B[i],C[i],u[i],v[i+1]);
end
endgenerate
FA F1(A[63],B[63],C[63],u[63],c);



endmodule
