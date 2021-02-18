`include "mux4x1.v"
`include "dflipflop.v"

module USR (OUT,I, clk, reset, s, leftshift, rightshift);

input [7:0]I;
input [1:0]s;
input clk;
input reset,leftshift,rightshift;
output [7:0]OUT;

wire [7:0] w;

mux4x1 m1(w[0],s[1],s[0],I[0],leftshift,OUT[1],OUT[0]);
mux4x1 m2(w[1],s[1],s[0],I[1],OUT[0],OUT[2],OUT[1]);
mux4x1 m3(w[2],s[1],s[0],I[2],OUT[1],OUT[3],OUT[2]);
mux4x1 m4(w[3],s[1],s[0],I[3],OUT[2],OUT[4],OUT[3]);
mux4x1 m5(w[4],s[1],s[0],I[4],OUT[3],OUT[5],OUT[4]);
mux4x1 m6(w[5],s[1],s[0],I[5],OUT[4],OUT[6],OUT[5]);
mux4x1 m7(w[6],s[1],s[0],I[6],OUT[5],OUT[7],OUT[6]);
mux4x1 m8(w[7],s[1],s[0],I[7],OUT[6],rightshift,OUT[7]);

dflipflop d1(OUT[0],w[0],clk,reset);
dflipflop d2(OUT[1],w[1],clk,reset);
dflipflop d3(OUT[2],w[2],clk,reset);
dflipflop d4(OUT[3],w[3],clk,reset);
dflipflop d5(OUT[4],w[4],clk,reset);
dflipflop d6(OUT[5],w[5],clk,reset);
dflipflop d7(OUT[6],w[6],clk,reset);
dflipflop d8(OUT[7],w[7],clk,reset);

endmodule
