`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2021 13:30:52
// Design Name: 
// Module Name: program_counter16b
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


module program_counter16b (
    input clk,
    input rst,
    input wire[7:0] adh,
    input wire[7:0] adl,
    input pcl_adl,
    input pch_adh,
    input brc,
    input inc,
    output reg[7:0] pcl,
    output reg[7:0] pch
);
reg[15:0] pc;

  always @(posedge clk, rst) begin
      pch = pc[15:8];
      pcl = pc[7:0];
      if (rst == 1) begin
          pc <= 16'h0000;
      end else begin
          if(pch_adh)
            pc[15:8] <= adh;
          if (pcl_adl)
            pc[7:0] <= adl;
          if(brc)
            pc <= pc+adl;
          if (inc)
            pc = pc+1;
      end
  end  
endmodule