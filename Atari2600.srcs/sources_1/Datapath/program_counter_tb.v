`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2021 13:52:28
// Design Name: 
// Module Name: program_counter_tb
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


module program_counter_tb(

    );
    
   reg clk = 0;
   reg rst;
   reg[7:0] adh;
   reg[7:0] adl;
   reg pcl_adl;
   reg pch_adh;
   reg brc;
   wire[7:0] pcl;
   wire[7:0] pch;
   wire[7:0] out;
   reg[7:0] in;
   reg enable;
   
always begin 
    #50 clk = ~clk;
end  

initial begin 
  
    rst = 1;
#200 
    rst = 0;
end
register acc (
     .clk(clk),
     .rst(rst),
     .data_in(in),
     .load_reg(enable),
     .data_out(out)
);
program_counter16b pc (
     .clk(clk),
     .rst(rst),
     .adh(adh),
     .adl(adl),
     .pcl_adl(pcl_adl),
     .pch_adh(pch_adh),
     .brc(brc),
     .pcl(pcl),
     .pch(pch)
);
     


always @(posedge clk) begin
enable = 1;
in = 8'hff;
#5;
enable = 0;
#500;
enable = 1;
in = 8'h0f;
#5;
enable = 0;
#500;

end
endmodule
