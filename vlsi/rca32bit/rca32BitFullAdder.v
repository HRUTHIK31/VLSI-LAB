`include "sixteenBitFullAdder.v"
module rca32BitFullAdder (a, b, cin, sum, ca);
input [31:0] a, b;
input cin;

output [31:0] sum;
output ca;

wire c6;

sixteenBitFullAdder FA_0 (a[15:0], b[15:0], cin, sum[15:0], c6);
sixteenBitFullAdder FA_1 (a[31:16], b[31:16], c6, sum[31:16], ca);

endmodule
