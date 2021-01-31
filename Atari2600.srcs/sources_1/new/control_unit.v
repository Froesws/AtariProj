`timescale 1ns / 1ps

 
 `include  "control_unit_header.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2021 12:47:07
// Design Name: 
// Module Name: control_unit
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

module control_unit(
input clk,
input rst,
input wire[7:0] instruction,
input wire[3:0] addressing_mode
    );
    
 reg [7:0] state;
 reg [7:0] next_state;
 
 //Maquina de Mealy
 always @(posedge clk or rst) begin
    if (rst == 'b1)begin
        state = T0;
    end else begin
        state = next_state;
    end 
 end
 
     
always @(state) begin
    
end
endmodule
