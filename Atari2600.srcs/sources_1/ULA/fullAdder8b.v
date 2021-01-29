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
    output carryOut_prev,
    output hfCarryOut,
    output [7:0] out
    );

    
wire co_a,co_b,co_c,co_e,co_f; // carry out connectors
    
fullAdder1b FullAdder1b_a(
    .i0(i0[0]),
    .i1(i1[0]),
    .carryIn(dataIn),
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
    .carryOut(hfCarryOut),
    .out(out[3])
    );
    
fullAdder1b FullAdder1b_e(
    .i0(i0[4]),
    .i1(i1[4]),
    .carryIn(hfCarryOut),
    .carryOut(co_e),
    .out(out[4])
    );
    
fullAdder1b FullAdder1b_f(
    .i0(i0[5]),
    .i1(i1[5]),
    .carryIn(co_e),
    .carryOut(co_f),
    .out(out[5])
    );
    
fullAdder1b FullAdder1b_g(
    .i0(i0[6]),
    .i1(i1[6]),
    .carryIn(co_f),
    .carryOut(carryOut_prev),
    .out(out[6])
    );
 
fullAdder1b FullAdder1b_h(
    .i0(i0[7]),
    .i1(i1[7]),
    .carryIn(carryOut_prev),
    .carryOut(carryOut),
    .out(out[7])
    );
    
endmodule
