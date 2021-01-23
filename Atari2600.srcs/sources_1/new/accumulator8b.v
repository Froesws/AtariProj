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
    input busEn_AC_SB,
    input busEn_AC_DB, 
    input accEn,
    input rst,
    output [7:0] SB,
    output [7:0] DB
 );
 
wire [7:0] regOut;
wire [7:0] muxIn;
wire [7:0] adderOut;
wire [7:0] regIn;
wire [7:0] muxOut; 

mux8b_2To1 mux_2To1(
    .i0(muxIn), 
    .i1(dataIn), 
    .s0(load_SB_AC),
    .out(muxOut)
    );
    
fullAdder8b adder8b(
    .i0(regOut),
    .i1(muxOut),
    .carryIn(0),
    .carryOut(0),
    .out(adderOut)
    ); 

reg8b Reg8b(
    .reset(rst),
    .clk(accEn),
    .D(regIn),
    .Q(regOut)
    );
     
tristate8b tri_AC_DB(
    .port(DB),
    .dir(busEn_AC_DB),
    .send(regOut),
    .read(muxIn)
    );  

tristate8b tri_AC_SB(
    .port(SB),
    .dir(busEn_AC_SB),
    .send(regOut),
    .read(muxIn)
    );
         
endmodule
