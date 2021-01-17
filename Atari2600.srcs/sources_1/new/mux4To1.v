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


module mux4To1 ( 
    input i1, 
    input i2, 
    input i3, 
    input i4, 
    input s0, s1,
    output out); 

 assign out = s1 ? (s0 ? i4 : i3) : (s0 ? i2 : i1); 

endmodule
