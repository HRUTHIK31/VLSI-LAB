`include "WMT.v"
module top;

reg [31:0] M1,M2;
wire [63:0] p;
wallace q(M1,M2,p);

initial
begin

   M1=45;
   M2=16;
#5 M1=4;
   M2=83;
#5 M1=640;
   M2=3200;
   
end

initial
begin
$monitor("%d %d %d",M1,M2,p);
end
endmodule

