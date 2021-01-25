`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2021 16:39:58
// Design Name: 
// Module Name: register
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


module register(
    input clk,
    input rst,
    input wire[7:0] data_in,
    output reg[7:0] data_out,
    input load_reg
    );
    
always @(posedge clk) begin
    if (rst == 1) begin 
        data_out = 8'h00;
    end else begin
        if (load_reg == 1)
            data_out = data_in;
    end 
end
endmodule
