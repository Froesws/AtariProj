`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2021 17:45:12
// Design Name: 
// Module Name: acumulador
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


module accumulator(input clk, 
                    input rst,
                    input SBAC, 
                    input ACDB,
                    input ACSB,
                    output reg[7:0] DB,
                    output reg[7:0] SB,
                    output reg[7:0]  loadAc,
                    input enable
 );
 
 reg [7:0] acc;
 
 always @(posedge clk) 
 begin 
    if (rst == 1) begin
        acc = 7'b0;
    end else begin
        if (enable)
            assign acc = loadAc;
    end 
 end 
 
 always @(ACDB or ACSB)
 begin 
    if (ACDB)
        assign DB = acc;
    else if (ACSB)
       assign SB = acc;
     
 end 
  
endmodule
