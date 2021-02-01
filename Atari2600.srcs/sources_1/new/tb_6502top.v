`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2021 06:12:50 PM
// Design Name: 
// Module Name: tb_6502top
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


module tb_6502top(
);

wire [7:0] MEM_DL;
	wire [7:0] DOR_MEM;
	reg clk_tb = 0;
	reg rst_tb = 0;
	wire mem_wrt;
	wire [7:0] ABH;
    wire [7:0] ABL;
	
	top6502 tb6502(
		.DL(MEM_DL),
		.clk(clk_tb),
		.rst(rst_tb),
		.mem_wrt(),
		.DOR (DOR_MEM),
		.ABH(ABH),
        .ABL(ABL)
	);
	
	memory tbMem( 
		.addr({ABH,ABL}),
		.din(DOR_MEM),
		.clk(clk_tb), 
		.rst(rst_tb),
		.mem_wrt(mem_wrt),
		.dout(MEM_DL)
		);

initial begin 
    rst_tb = 1; 
    #840;
    rst_tb = 0;
end 
	
always begin 
#420 clk_tb = ~clk_tb;
end

endmodule
