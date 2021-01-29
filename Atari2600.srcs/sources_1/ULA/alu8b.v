`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2021 06:37:43 PM
// Design Name: 
// Module Name: alu8b
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


module alu8b(
    input [7:0] AI,
    input [7:0] BI,
    input carIn,
    input decEn,
    input [3:0] ALU_Oper,
    output hfCarry,
    output carOut,
    output overflow,
    output [7:0] ALU_out
    );

reg [7:0] result;
reg [3:0] tempResult;
reg [6:0] tempResultPrev;
reg tempCarryOut;
reg tempCarryOut_prev;
reg tempHfCarry;
reg overflowReg;



always @* begin
        
    case(ALU_Oper)
        4'b0000: // Addition
           begin
                {tempCarryOut,result} = AI + BI + carIn ;
                {tempHfCarry,tempResult}= AI[3:0]+BI[3:0];
                {tempCarryOut_prev,tempResultPrev}= AI[6:0]+BI[6:0];
                overflowReg = ((~(AI[7] | BI[7])) & tempCarryOut_prev) |~ ((~(AI[7] & BI[7]))|~ tempCarryOut_prev); 
            end
        4'b0001: // Subtraction
           begin
                {tempCarryOut,result} = AI - BI + carIn;
                {tempHfCarry,tempResult}= AI[3:0]-BI[3:0];
                {tempCarryOut_prev,tempResultPrev}= AI[6:0]-BI[6:0];
                overflowReg = ((~(AI[7] | BI[7])) & tempCarryOut_prev) |~ ((~(AI[7] & BI[7]))|~ tempCarryOut_prev);   
            end 
        4'b0010: // Logical shift right
           begin
               {tempCarryOut,result} = BI>>1;
               tempHfCarry = 'b0;
           end
        4'b0011: //  Logical and 
           begin
                result = AI & BI;
                tempCarryOut = 'b0;
                tempHfCarry = 'b0;
           end
        4'b0100: //  Logical or
           begin
                result = AI | BI;
                tempCarryOut = 'b0;
                tempHfCarry = 'b0;
           end
        4'b0101: //  Logical xor
           begin
                result = AI ^ BI; 
                tempCarryOut = 'b0;
                tempHfCarry = 'b0;
           end      
        4'b0110: //  Logical Increase
           begin
                {tempCarryOut,result} = BI + 'h01;
                {tempHfCarry,tempResult}= BI[3:0] + 'h1;
                {tempCarryOut_prev,tempResultPrev}= BI[6:0] + 'b000001;
                overflowReg = (~(BI[7]) & tempCarryOut_prev) |~ tempCarryOut_prev;
           end      
        4'b0111: //  Logical Decrease
           begin
                {tempCarryOut,result} = BI - 'h01;
                {tempHfCarry,tempResult}= BI[3:0] - 'h1;
                {tempCarryOut_prev,tempResultPrev}= BI[6:0] - 'b000001;
                overflowReg = (~(BI[7]) & tempCarryOut_prev) |~ tempCarryOut_prev;
           end        
        endcase
end        

assign ALU_out = result;
assign overflow = overflowReg;
assign hfCarry = tempHfCarry;
assign carOut = tempCarryOut;

endmodule
