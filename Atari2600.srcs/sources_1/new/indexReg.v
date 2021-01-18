`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2021 06:20:02 PM
// Design Name: 
// Module Name: indexReg
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


module indexReg ( 
    input [7:0] dataIn, 
    input load, 
    input busEn, 
    input clk, 
    input rst,
    output [7:0] dataOut); 

wire [7:0] muxToReg;

mux8b_2To1 mux2to1(
    .i0(dataOut), 
    .i1(dataIn), 
    .s0(load),
    .out(muxToReg)
);

Reg8Bit reg8b(
    .reset(rst),
    .clk(clk),
    .D(muxToReg),
    .Q(dataOut)
    );
    
endmodule
