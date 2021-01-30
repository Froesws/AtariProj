`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2021 01:28:40 PM
// Design Name: 
// Module Name: mux8b_ABH
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


module mux8b_ABH(
        input wire[7:0] adh_abh, 
        input wire[7:0] ff, 
        input wire[1:0] sel,
        output wire[7:0] out_mux_adh_abh
);
    
    reg[7:0]  out_mux;
    assign out_mux_adh_abh = out_mux;


    //-------------Code Starts Here---------
    always @ (sel or adh_abh or ff)
    // begin and end act like curly braces in C/C++.
    if (sel == 1'b0) begin
      out_mux = adh_abh;
    end else begin
      out_mux = 8'b0;//o_add
    end

endmodule //End Of Module mux
        