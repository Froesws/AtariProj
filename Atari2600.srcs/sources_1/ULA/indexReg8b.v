`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2021 06:20:02 PM
// Design Name: 
// Module Name: indexReg8b
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


module indexReg8b ( 
    input [7:0] dataIn, 
    input load, 
    input clk, 
    input rst,
    output [7:0] dataOut); 

reg8b Reg8b(
    .reset(rst),
    .clk(clk),
    .load(load),
    .D(dataIn),
    .Q(dataOut)
    );
    
endmodule
