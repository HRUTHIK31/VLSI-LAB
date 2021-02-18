`include "fourBitFullAdder.v"
module eightBitFullAdder (a, b, cin, sum, ca);
input [7:0] a, b;
input cin;

output [7:0] sum;
output ca;

wire c4;

fourBitFullAdder FA_0 (a[3:0], b[3:0], cin, sum[3:0], c4);
fourBitFullAdder FA_1 (a[7:4], b[7:4], c4, sum[7:4], ca);

endmodule
