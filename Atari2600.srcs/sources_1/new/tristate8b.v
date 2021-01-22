`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2021 03:40:56 PM
// Design Name: 
// Module Name: tristate
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


module tristate8b(
    output [7:0] port,
    input dir,
    input [7:0] send,
    output [7:0] read
    );

assign port = dir ? send : 1'bZ; //se dir for 1, copia send para port, senão coloca port em alta impedância    
assign read = dir ? 1'bZ : port;

endmodule
