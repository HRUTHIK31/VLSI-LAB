`include "eightBitFullAdder.v"
module sixteenBitFullAdder (a, b, cin, sum, ca);
input [15:0] a, b;
input cin;

output [15:0] sum;
output ca;

wire c5;

eightBitFullAdder FA_0 (a[7:0], b[7:0], cin, sum[7:0], c5);
eightBitFullAdder FA_1 (a[15:8], b[15:8], c5, sum[15:8], ca);

endmodule
