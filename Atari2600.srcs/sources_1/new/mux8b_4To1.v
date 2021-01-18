`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2021 06:20:02 PM
// Design Name: 
// Module Name: mux4To1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// fffff
//////////////////////////////////////////////////////////////////////////////////


module mux8b_4To1 ( 
    input [7:0] i1, 
    input [7:0] i2, 
    input [7:0] i3, 
    input [7:0] i4, 
    input s0, s1,
    output [7:0] out); 

 assign out = s1 ? (s0 ? i4 : i3) : (s0 ? i2 : i1); 

endmodule
