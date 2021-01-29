`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2021 01:30:13 PM
// Design Name: 
// Module Name: accumulator8b
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


module accumulator8b(
    input [7:0] dataIn, 
    input load_SB_AC,
    input clk, 
    input rst,
    output [7:0] dataOut
 );
 
reg8b Reg8b(
    .reset(rst),
    .clk(clk),
    .load(load_SB_AC),
    .D(dataIn),
    .Q(dataOut)
    );
         
endmodule
