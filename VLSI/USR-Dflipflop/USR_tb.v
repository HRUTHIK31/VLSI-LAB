`include "USR.v"

module top;

reg [7:0]I;
reg clk;
reg reset;
reg [1:0]s;
reg leftshift;
reg rightshift;
reg [7:0]temp;

wire [7:0] OUT;

USR usr_1 (OUT,I, clk, reset, s, leftshift, rightshift);

initial
begin
$dumpfile("usr.vcd"); 
	$dumpvars; 
	
clk=1'b0;
reset=1'b1;
rightshift=1'b1;
leftshift=1'b0;
#100  $display("I=%b; valuein_register= %b; s=%b; output=%b",I,temp,s,OUT);

I= 8'b00001010;
reset=1'b0;
s=2'b11;
temp=OUT;
#100  $display("I=%b; valuein_register= %b; s=%b; output=%b",I,temp,s,OUT);

temp=OUT;
s=2'b01;
#100  $display("I=%b; valuein_register= %b; s=%b; output=%b",I,temp,s,OUT);

temp=OUT;
s=2'b10;
#100  $display("I=%b; valuein_register= %b; s=%b; output=%b",I,temp,s,OUT);

temp= OUT;
s=2'b00;
#100  $display("I=%b; valuein_register= %b; s=%b; output=%b",I,temp,s,OUT);
#100 $finish;

end 
always#50 clk=~clk;

endmodule














