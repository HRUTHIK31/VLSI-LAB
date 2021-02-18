`include "CLA.v"

module top;

reg [63:0] a,b;
wire [63:0]sum;
wire [63:0]cout;

bitrc B1(a,b,sum,cout);

initial
begin

 a=125;
 b=223;

#10 $display("\ta  =%d\n\n\tb  =%d\n\n\tSUM=%d,cout=%d",a,b, {cout[63],sum},cout);

end

endmodule
