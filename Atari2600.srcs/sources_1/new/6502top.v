`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2021 23:56:46
// Design Name: 
// Module Name: 6502top
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


module top6502(
    );
     
         reg clk;
         reg rst;
         wire brc;
         wire pc_inc;
         wire load_x;
         wire load_y;
         wire [2:0] sel_SB;
         wire [1:0] sel_ADH;
         wire [2:0] sel_DB;
         wire [2:0] sel_ADL;
         wire sel_ABH;
         wire load_s;
         wire load_ai;
         wire load_bi;
         wire load_ABH;
         wire load_ABL;
         wire sel_ai;
         wire load_DOR;
         wire [1:0] sel_bi;
         wire [7:0] DL;
         wire [7:0] ABH;
         wire [7:0] ABL;
         wire pcl_adl;
         wire pch_adh;
         wire load_acc;
         wire cin_alu;
         wire decEn_alu;
         wire [3:0] op_alu;
         wire [3:0] alu_status;
         wire [7:0] DOR;
         wire sync;
         wire [2:0] cycles;
         wire [7:0] instruction;
         reg [3:0] addresing_mode;
         wire [7:0] out_P;
         wire mem_wrt;
         wire [7:0] ir;
         wire [7:0] in_ir;
         
datapath dp (
    .clk(clk),
    .rst(rst),
    .brc(brc),
    .pc_inc(pc_inc),
    .load_x(load_x),
    .load_y(load_y),
    .sel_SB(sel_SB),
    .sel_ADH(sel_ADH),
    .sel_DB(sel_DB),
    .sel_ADL(sel_ADL),
    .sel_ABH(sel_ABH),
    .load_s(load_s),
    .load_ai(load_ai),
    .load_bi(load_bi),
    .load_ABH(load_ABH),
    .load_ABL(load_ABL),
    .sel_ai(sel_ai),
    .load_DOR(load_DOR),
    .sel_bi(sel_bi),
    .DL(DL),
    .ABH(ABH),
    .ABL(ABL),
    .pcl_adl(pcl_adl),
    .pch_adh(pch_adh),
    .load_acc(load_acc),
    .op_alu(op_alu),
    .alu_status(alu_status),
    .DOR(DOR)
);
    
    control_unit uc (
    .clk(clk),
         .rst(rst), 
        .sync(sync),
        .load_s(load_s),
        .load_acc(load_acc),
         .instruction(instruction),
         .addressing_mode(addresing_mode),
         .alu_status(alu_status),
        .cycles(cycles),
        .sel_ADH(sel_ADH),
        .sel_ADL(sel_ADL),
        .sel_ABH(sel_ABH),
        .sel_ai(sel_ai),
        .sel_SB(sel_SB),
        .sel_DB(sel_DB),
        .sel_BI(sel_bi),
        .pc_inc(pc_inc),
        .load_ABH(load_ABH), 
        .load_ABL(load_ABL),
        .load_DOR(load_DOR),
        .load_bi(load_bi),
        .load_ai(load_ai),
        .load_y(load_y),
        .load_x(load_x),
        .mem_wrt(mem_wrt),
        .op_ula(op_alu),
        .sel_bi(sel_bi),
        .out_P(out_P)
    );
    
    
    decoder dcd (
     .instruction_in(ir),
    .operation(instruction),
    .addressing(addressing_mode)
    );
    
    predecoder predcd(
     .data_bus(),
     .reset(rst),
     .cycle(cycles),
      .instruction(in_ir),
      .RMW()
    );
    
    register ir_reg (
    .clk(clk),
    .rst(rst),
    .load_reg(sync),
    .data_in(in_ir),
    .data_out(ir)
    );
endmodule
