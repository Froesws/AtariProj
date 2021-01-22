`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2021 10:34:48 AM
// Design Name: 
// Module Name: mux2To1
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
// 
//////////////////////////////////////////////////////////////////////////////////


module mux8b_2To1(
    input [7:0] i0, 
    input [7:0] i1, 
    input s0,
    output [7:0] out); 

 assign out = s0 ? i1 : i0; 

endmodule
