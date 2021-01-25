`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2021 15:55:10
// Design Name: 
// Module Name: mux_tb
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


module mux_tb(

    );
     
  reg[2:0]   sel;
  reg[7:0]   in_1;
  reg[7:0]   in_2;
  reg[7:0]   in_3;
  reg[7:0]   in_4;
  reg[7:0]   in_5;
  wire [7:0]   out;
  
mux_db mux_1(
    .db_sel(sel),
    .dl_db(in_1),
    .pcl_db(in_2),
    .pch_db(in_3),
    .sb_db(in_4),
    .acc_db(in_5),
    .db(out)
);

always begin 
  in_1 = 8'h01;
  in_2 = 8'h02;
  in_3 = 8'h03;
  in_4 = 8'h04; 
  in_5= 8'h05;
  sel = 3'b000;
#500;  
    sel = 3'b001;
#500; 
    sel = 3'b010;
#500;   
    sel = 3'b011;
#500; 
     sel = 3'b100;
#500;   
end



endmodule

