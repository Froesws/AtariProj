`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2021 01:20:22 PM
// Design Name: 
// Module Name: fullAdder8b
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


module fullAdder8b(
    input [7:0] i0,
    input [7:0] i1,
    input carryIn,
    output carryOut,
    output [7:0] out
    );

wire co_a;    
    
fullAdder4b FullAdder4b_a(
    .i0(i0[3:0]),
    .i1(i1[3:0]),
    .carryIn(0),
    .carryOut(co_a),
    .out(out[3:0])
    ); 
 
fullAdder4b FullAdder4b_b(
    .i0(i0[7:4]),
    .i1(i1[7:4]),
    .carryIn(co_a),
    .carryOut(carryOut),
    .out(out[7:4])
    );
    
endmodule
