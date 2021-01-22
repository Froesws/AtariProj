`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2021 12:29:27 PM
// Design Name: 
// Module Name: fullAdder1b
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


module fullAdder1b(
    input i0,
    input i1,
    input carryIn,
    output carryOut,
    output out
    );
    
    wire temp;
    
    assign temp = (i0 ^ i1);
    assign carryOut = (temp & carryIn) | (i0 & i1); 
    assign out = (temp ^ carryIn);
    
endmodule
