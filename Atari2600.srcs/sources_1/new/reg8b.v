`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2021 10:13:44 AM
// Design Name: 
// Module Name: 8BitReg
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


module reg8b(
    input reset,
    input clk,
    input [7:0] D,
    output [7:0] Q
    );

reg [7:0] Q;

always @(posedge clk)
    if(reset)
        Q = 0;
    else
        Q = D;    
    

endmodule
