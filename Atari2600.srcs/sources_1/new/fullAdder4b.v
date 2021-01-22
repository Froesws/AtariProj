`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2021 01:05:11 PM
// Design Name: 
// Module Name: fullAdder4b
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


module fullAdder4b(
    input [3:0] i0,
    input [3:0] i1,
    input carryIn,
    output carryOut,
    output [3:0] out
    );

wire co_a,co_b,co_c; // carry out connectors
    
fullAdder1b FullAdder1b_a(
    .i0(i0[0]),
    .i1(i1[0]),
    .carryIn(0),
    .carryOut(co_a),
    .out(out[0])
    );
    
fullAdder1b FullAdder1b_b(
    .i0(i0[1]),
    .i1(i1[1]),
    .carryIn(co_a),
    .carryOut(co_b),
    .out(out[1])
    );
    
fullAdder1b FullAdder1b_c(
    .i0(i0[2]),
    .i1(i1[2]),
    .carryIn(co_b),
    .carryOut(co_c),
    .out(out[2])
    );
 
fullAdder1b FullAdder1b_d(
    .i0(i0[3]),
    .i1(i1[3]),
    .carryIn(co_c),
    .carryOut(carryOut),
    .out(out[3])
    );
    
endmodule
