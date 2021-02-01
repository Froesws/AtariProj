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
output reg sync,
output reg load_s,
output reg load_acc,
input wire[7:0] instruction,
input wire[3:0] addressing_mode,
input [3:0] alu_status,
input [2:0] cycles,
output reg[1:0] sel_ADH,
output reg[2:0] sel_ADL,
output reg sel_ABH,
output reg sel_ai,
output reg[2:0] sel_SB,
output reg[2:0] sel_DB,
output reg[1:0] sel_BI,
output reg pc_inc,
output reg load_ABH, 
output reg load_ABL,
output reg load_DOR,
output reg load_bi,
output reg load_ai,
output reg load_y,
output reg load_x,
output reg mem_wrt,
output reg [3:0] op_ula,
output reg[2:0] sel_bi,
output reg[7:0] out_P
    );
    
 reg [7:0] state;
 reg [7:0] next_state;
 reg [2:0] cycle_num;
 
 reg [7:0] P;  // P = C,Z,I,D,B, ,V,N
 
parameter integer cry = 7;
parameter integer zer = 6;
parameter integer itp = 5;
parameter integer dcm = 4;
parameter integer bek = 3;
parameter integer ovf = 1;
parameter integer neg = 0;
parameter T0 = 'h00;
parameter T1 ='h01;
parameter T2 ='h02;
parameter T3 ='h03;
parameter T4 ='h04;
parameter T5 ='h05;
parameter T6 ='h06;
parameter T7 ='h07;
parameter DELAY1 ='hFF;

 
 //Maquina de Mealy
 always @(posedge clk or rst) begin
    if (rst == 'b1)begin
        state = T0;
    end else begin
        state = next_state;
    end 
 end
 
  
   
always @(state) begin
	case (state)
		T0: begin
			 sync = 'b1; // load Instruction Register
				next_state = T1;
			end
		T1: begin
			sync ='b0;
			load_ABH = 'b0;
			load_ABL = 'b0;
			cycle_num = cycles;
			if ( instruction == DEY | instruction == INY ) begin
				sel_SB = 'b011;
				sel_DB = 'b011;
				sel_BI = 'b010;
				load_bi = 'b1;
				pc_inc = 'b1;
				// alu_status = C,Z,V,N
				P[cry] = alu_status[3];
				P[zer] = alu_status[2];
				P[ovf] = alu_status[1];
				P[neg] = alu_status[0];
			end
			else if ( instruction == DEX | instruction == INX ) begin
				sel_SB = 'b100;
				sel_DB = 'b011;
				sel_BI = 'b010;
				load_bi = 'b1;
				pc_inc = 'b1;
				// alu_status = C,Z,V,N
				P[cry] = alu_status[3];
				P[zer] = alu_status[2];
				P[ovf] = alu_status[1];
				P[neg] = alu_status[0];
			end
			else if ( instruction == CLC | instruction == CLD | instruction == CLI | instruction == CLV ) begin
				case (instruction)
					CLC: P[cry] = 'b0;
					CLD: P[dcm] = 'b0;
					CLI: P[itp] = 'b0;
					default: P[ovf] = 'b0;
				endcase
				pc_inc = 'b1;
			end
			else if ( instruction == NOP ) begin
				pc_inc = 'b1;	
			end
			else if ( instruction == PHA ) begin
				sel_DB = 'b100;
				load_DOR = 'b1;
				sel_ADL = 'b011;
				sel_ABH = 'b1;
				load_ABL = 'b1;
				load_ABH = 'b1;
				sel_BI = 'b00;
				load_bi = 'b1;
				pc_inc = 'b1;
			end
			else if ( instruction == PHP ) begin
				out_P = P;
				sel_ADL = 'b011;
				sel_ABH = 'b1;
				load_ABL = 'b1;
				load_ABH = 'b1;
				sel_BI = 'b00;
				load_bi = 'b1;
				sel_DB = 'b101;
				pc_inc = 'b1;
				load_DOR = 'b1;
			end
			else if ( instruction == PLA ) begin
				sel_ADL = 'b011;
				sel_ABH = 'b1;
				load_ABL = 'b1;
				load_ABH = 'b1;
				sel_BI = 'b00;
				load_bi = 'b1;
				pc_inc = 'b1;
				load_DOR = 'b1;
			end	
			else if (instruction == LSR) begin 
				if (addressing_mode == abt) begin
					pc_inc = 'b1;
					sel_ADL = 'b00;
					load_ABL = 'b1;

				end
			end 
			 next_state = T2;
		end // T1
		T2: begin	//  ------------------------------------------------------- T2
			sel_SB = 'b000;
			sel_DB = 'b000;
			sel_BI = 'b000;
			load_bi = 'b0;
			pc_inc = 'b0;
			
			if ( instruction == DEY | instruction == INY ) begin
				if (instruction == DEY)
					op_ula = 'b0111;
				else
					op_ula = 'b0110; // INY
				load_y = 'b1;
				sel_SB = 'b001;
				sel_ADL = 'b000;
				sel_ADH = 'b11;
				sel_ABH = 'b0;
				load_ABH = 'b1;
				load_ABL = 'b1;
				next_state = T1;
			end
			else if ( instruction == DEX | instruction == INX ) begin
				if (instruction == DEX)
					   op_ula = 'b0111;
				else
					   op_ula = 'b0110; // INX
					load_x = 'b1;
					sel_SB = 'b001;
					sel_ADL = 'b000;
					sel_ADH = 'b11;
					sel_ABH = 'b0;
					load_ABH = 'b1;
					load_ABL = 'b1;
					next_state = T1;
			end
			else if ( instruction == CLC | instruction == CLD | instruction == CLI | instruction == CLV ) begin
				sel_ADL = 'b000;
				sel_ADH = 'b11;
				sel_ABH = 'b0;
				load_ABH = 'b1;
				load_ABL = 'b1;
				next_state = T1;
			end
			else if ( instruction == NOP ) begin
				next_state = T1;
			end
			else if ( instruction == PHA | instruction == PHP ) begin
				op_ula = 'b0111;
				sel_SB = 'b001;
				load_s = 'b1;
				mem_wrt = 'b1;
				next_state = T3;
			end
			else if ( instruction == PLA ) begin
				sel_DB = 'b000;
				sel_SB = 'b10;
				load_acc = 'b1;
				next_state = T3;
			end
			else if (instruction == LSR) begin 
				if (addressing_mode == abt) begin
					pc_inc = 'b1;
					sel_ADL = 'b000;
					sel_ABH = 'b1;
					sel_DB = 'b000;
					sel_bi = 'b010;
					sel_ai = 'b1;
					load_ai = 'b1;
					load_bi = 'b1;
					next_state <= T3;
				end
			end 
		end // T2 
			
		T3: begin	
			
			if ( instruction == PHA | instruction == PHP ) begin
				sel_ADL = 'b000;
				sel_ADH = 'b11;
				sel_ABH = 'b0;
				load_ABH = 'b1;
				load_ABL = 'b1;
				next_state = T1;
			end	
			else if ( instruction == PLA ) begin
				sel_SB = 'b01;
				load_s = 'b1;
				sel_ADH = 'b11;
				sel_ADL = 'b000;
				sel_ABH = 'b0;
				load_ABL = 'b1;
				load_ABH = 'b1;
				next_state = T3;
			end
			else if (instruction == LSR) begin
				if (addressing_mode == abt) begin
					sel_ADH = 'b000;
					sel_ABH ='b0;
					load_ABH = 'b1;
					op_ula = 'b0011;
					sel_ADL = 'b010;
					load_ABL = 'b1;
					next_state = T4;
				end
			end
		end // T3
		
		DELAY1: begin
			if( instruction == PLA ) begin
				next_state = T1;
			end
		end //delay

		T4: begin
			if (instruction == LSR) begin
				if (addressing_mode == abt) begin
					sel_DB = 'b000;
					sel_bi= 'b010;
					load_bi  = 'b1;
					pc_inc = 'b1;
				end
			end
		end // T4

		T5: begin
			op_ula = 'b0010;
			sel_SB = 'b001;
			sel_DB = 'b011;
			load_DOR = 'b1;
		end // T5

		T6: begin
			load_bi  = 'b1;
			sel_ADL  = 'b000;
			sel_ADH = 'b011;
			sel_ABH  = 'b0;
			mem_wrt = 'b1;
		end
	endcase
	
	cycle_num = cycle_num - 'b001;
	
	if (cycle_num == 'b000)
		sync = 'b1;
	else
		sync = 'b0;
		
    end
endmodule
