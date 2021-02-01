`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2021 06:00:14 PM
// Design Name: 
// Module Name: memory
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


module memory( addr, clk,rst, din, dout, mem_wrt);
    input [15 : 0] addr;
	input [7:0] din;
    input clk, rst,mem_wrt;
    output [7 : 0] dout;
    reg [7:0] memory[1023:0];
    reg [7:0] dout_r;


//  memory[0] = 'h46; // Intrucao LSR - Zero Page
//  memory[1] = 'h03;
//  memory[2] = 'h4A; // Intrucao LSR - Accumulator
//  memory[3] = 'h46; // Intrucao LSR - Zero Page, X
//  memory[4] = 'h01;
//  memory[5] = 'h4E; // Intrucao LSR - Absolute
//  memory[6] = 'h05;  
//  memory[7] = 'h02;  
//  memory[8] = 'h5E;  // Intrucao LSR - Absolute, X
//  memory[9] = 'h00;  
//  memory[10] = 'h02;  

always @(posedge clk)
begin
    dout_r = memory[addr];
    if (rst)
    begin   
        memory[0] = 'h4E; // Intrucao LSR - Absolute
        memory[1] = 'h05;  
        memory[2] = 'h02;  
//        memory[3] = 'h5E;  // Intrucao LSR - Absolute, X
//        memory[4] = 'h00;  
//        memory[5] = 'h02;  
        
        // ...
        memory['h0000] = 'h08;  
        memory['h0001] = 'h05;  
        memory['h0002] = 'h21;  
        memory['h0003] = 'h3B;  
        memory['h0004] = 'h59;  
        // ...
        memory['h0200] = 'h08;  
        memory['h0201] = 'h05;  
        memory['h0202] = 'h21;  
        memory['h0203] = 'h3B;  
        memory['h0204] = 'h59;
        memory['h0205] = 'h18;  
        memory['h0206] = 'h02;  
        memory['h0207] = 'h61;  
        memory['h0208] = 'h31;  
        memory['h0209] = 'h69;  
        memory['h020A] = 'h06;  
        memory['h020B] = 'h95;  
        memory['h020C] = 'hA1;  
        memory['h020D] = 'h3F;  
        memory['h020E] = 'hE9;
    end
    else if (mem_wrt)
        memory[addr] <= din;
    
    end
    
endmodule

