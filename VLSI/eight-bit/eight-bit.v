`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:54 10/07/2020 
// Design Name: 
// Module Name:    eight-bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module eightbit(
    input d0,
    input d1,
    input d2,
    input d3,
    input d4,
    input d5,
    input d6,
    input d7,
    output ep,
    output op
	 );
   
wire a1,a2,a3,a4,a5,a6;
assign a1=d0^d1;
assign a2=d2^d3;
assign a3=d4^d5;
assign a4=d6^d7;
assign a5=a1^a2;
assign a6=a3^a4;
assign ep=a5^a6;
assign op=!ep;


endmodule
 
