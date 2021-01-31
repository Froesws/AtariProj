`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2021 17:52:13
// Design Name: 
// Module Name: datapath
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


module datapath #(
WIDTH = 8
)
(
input clk,
input rst,
input brc,
input inc,
input load_x,
input load_y,
input wire[2:0] sel_SB,
input wire[1:0] sel_ADH,
input wire[2:0] sel_DB,
input wire[2:0] sel_ADL,
input wire sel_ABH,
input load_s,
input load_ai,
input load_bi,
input load_ABH,
input load_ABL,
input sel_ai,
input load_DOR,
input wire[1:0] sel_bi,
input wire[WIDTH-1:0] DL,
input wire[WIDTH-1:0] ABH,
input wire[WIDTH-1:0] ABL,
input pcl_adl,
input pch_adh,
input load_acc,
input cin_alu,
input decEn_alu,
input [3:0] op_alu,
output [3:0] alu_status,
output reg [WIDTH-1:0] DOR
    );
// Fios nomeados
 wire [WIDTH-1:0] mux_ABH;
 wire [WIDTH-1:0] ADH;
 wire [WIDTH-1:0] ADL; 
 wire [WIDTH-1:0] PCH;
 wire [WIDTH-1:0] PCL;
 wire [WIDTH-1:0] SB;
 wire [WIDTH-1:0] DB; 
 wire [WIDTH-1:0] ALU_OUT;
 
// Fios sem nome/saidas de registradores
wire [WIDTH-1:0] acc;
wire [WIDTH-1:0] y;
wire [WIDTH-1:0] x;
wire [WIDTH-1:0] s;
wire [WIDTH-1:0] ai;
wire [WIDTH-1:0] bi;
wire [WIDTH-1:0] mux_ai;
wire [WIDTH-1:0] mux_bi;
////////////////////////////////////////////////////////////// END Wire /////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////// Init Registers ///////////////////////////////////////////////////////
//////////////////////////////////////////////////////////// Program Counter //////////////////////////////////////////////////////
program_counter16b pc_reg (
    .clk(clk),
    .rst(rst),
    .pcl_adl(pcl_adl),
    .pch_adh(pch_adh),
    .brc(brc),
    .inc(inc),
    .adh(ADH),
    .adl(ADL),
    .pcl(PCL),
    .pch(PCH)
);
//////////////////////////////////////////////////////////// END Program Counter //////////////////////////////////////////////////////
//////////////////////////////////////////////////////////// ACCUMULATOR  //////////////////////////////////////////////////////
 register acc_reg(
    .clk(clk),
    .rst(rst),
    .load_reg(load_acc),
    .data_in(SB),
    .data_out(acc)
);
//////////////////////////////////////////////////////////// END ACCUMULATOR //////////////////////////////////////////////////////
//////////////////////////////////////////////////////////// X Register //////////////////////////////////////////////////////
register x_reg(
    .clk(clk),
    .rst(rst),
    .load_reg(load_x),
    .data_in(SB),
    .data_out(x)
);
//////////////////////////////////////////////////////////// END X REGISTER //////////////////////////////////////////////////////
//////////////////////////////////////////////////////////// Y Register //////////////////////////////////////////////////////
register y_reg(
    .clk(clk),
    .rst(rst),
    .load_reg(load_y),
    .data_in(SB),
    .data_out(y)
);
//////////////////////////////////////////////////////////// End Y Register //////////////////////////////////////////////////////
//////////////////////////////////////////////////////////// S Register //////////////////////////////////////////////////////
register s_reg(
    .clk(clk),
    .rst(rst),
    .load_reg(load_s),
    .data_in(SB),
    .data_out(s)
);
//////////////////////////////////////////////////////////// END S Register //////////////////////////////////////////////////////
//////////////////////////////////////////////////////////// AI Register //////////////////////////////////////////////////////
register ai_reg(
    .clk(clk),
    .rst(rst),
    .load_reg(load_ai),
    .data_in(mux_ai),
    .data_out(ai)
);
//////////////////////////////////////////////////////////// End AI Register //////////////////////////////////////////////////////
//////////////////////////////////////////////////////////// BI Register //////////////////////////////////////////////////////
register bi_reg(
    .clk(clk),
    .rst(rst),
    .load_reg(load_bi),
    .data_in(mux_bi),
    .data_out(bi)
);
//////////////////////////////////////////////////////////// End BI Register //////////////////////////////////////////////////////
//////////////////////////////////////////////////////////// ABH Register //////////////////////////////////////////////////////
register abh_reg(
    .clk(clk),
    .rst(rst),
    .load_reg(load_ABH),
    .data_in(mux_ABH),
    .data_out(ABH)
);
//////////////////////////////////////////////////////////// END ABH Register //////////////////////////////////////////////////////
//////////////////////////////////////////////////////////// ABL Register //////////////////////////////////////////////////////
register abl_reg(
    .clk(clk),
    .rst(rst),
    .load_reg(load_ABL),
    .data_in(ADL),
    .data_out(ABL)
);
//////////////////////////////////////////////////////////// END ABL Register //////////////////////////////////////////////////////
//////////////////////////////////////////////////////////// DOR Register //////////////////////////////////////////////////////
register dor_reg(
    .clk(clk),
    .rst(rst),
    .load_reg(load_DOR),
    .data_in(DB),
    .data_out(DOR)
);
//////////////////////////////////////////////////////////// END ADH Register //////////////////////////////////////////////////////
///////////////////////////////////////////////////// End Registers/////////////////////////////////////////////////////
//////////////////////////////////////////////////// Init Mux /////////////////////////////////////////////////////////
// MUX SB_AI
mux_2 SB_ai(
.sel(sel_ai),
.in_0(SB),
.in_1(8'h00),
.out(mux_ai)
);
// MUX ADH_ABH
mux_2 ADH_ABH(
.sel(sel_ABH),
.in_0(ADH),
.in_1(8'hff),
.out(mux_ABH)
);

// MUX DB_BI
mux_4 DB_bi(
.sel(sel_bi),
.in_0(ADL),
.in_1(~DB),
.in_2(DB),
.in_3(8'h00),
.out(mux_bi)
);

// MUX SB
mux_8 mux_SB(
.sel(sel_SB),
.in_0(s),
.in_1(ALU_OUT),
.in_2(DB),
.in_3(y),
.in_4(x),
.in_5(acc),
.in_6(8'h00),
.in_7(8'h00),
.out(SB)
);

// MUX ADH
mux_4 mux_ADH(
.sel(sel_ADH),
.in_0(DB),
.in_1('h00),
.in_2(SB),
.in_3(PCH),
.out(ADH)
);
// MUX DB
mux_8 mux_DB(
.sel(sel_DB),
.in_0(DL),
.in_1(PCL),
.in_2(PCH),
.in_3(SB),
.in_4(acc),
.in_5(8'h00),
.in_6(8'h00),
.in_7(8'h00),
.out(DB)
);
// MUX ADL
mux_8 mux_ADL(
.sel(sel_ADL),
.in_0(PCL),
.in_1(8'h00),
.in_2(ALU_OUT),
.in_3(s),
.in_4(DL),
.in_5(8'h00),
.in_6(8'h00),
.in_7(8'h00),
.out(DB)
);

//////////////////////////////////////////////////// End Mux /////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////// Init ALU //////////////////////////////////////////////////////
alu8b alu(
    .AI(ai),
    .BI(bi),
    .carIn(cin_alu),
    .decEn(decEn_alu),
    .ALU_Oper(op_alu),
    .alu_status(alu_status),
    .ALU_out(ALU_OUT)
);
//////////////////////////////////////////////////////////// END ALU //////////////////////////////////////////////////////

endmodule
