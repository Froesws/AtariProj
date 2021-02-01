`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: William Froes  
// 
// Create Date: 22.01.2021 15:59:06
// Design Name: 
// Module Name: predecoder
// Project Name: Mos6502proj
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


module predecoder( 
    input wire[7:0] data_bus,
    input wire reset,
    output reg [3:0] cycle,
    output reg[7:0] instruction,
    output reg RMW
    );
    
    always @(data_bus or reset) begin
        if (reset == 1)begin
            RMW = 0;
            instruction = 7'b00;
            cycle = 4'b01;
        end else begin 
            instruction = data_bus;
            cycle = 4'b01;
            RMW  = 0;
            if (data_bus == 7'hFF) 
                cycle = 4'b01; 
            else if (data_bus[1:0] == 'b01) begin
                RMW = 'b0;
                case (data_bus[4:2])
                    3'b000:  //(Zero Page, X)
                        cycle = 'h6;
            
                    3'b001: //Zero Page com 01
                        cycle = 'h3;
                    
                    3'b010: //Imediato com 01
                        cycle = 'h2;
                    
                    3'b011: //Absoluto
                        cycle = 'h4;
                    
                    3'b100:  //(Zero Page), Y
                        cycle = 'h6;
                    
                    3'b101: // Zero Page, X
                        cycle = 'h4;
                    
                    3'b110: // absoluto, Y
                        cycle = 'h5;
                    
                    3'b111:  //absoluto, X
                        cycle = 'h5;
                    
                    default: 
                        cycle = 'b0001;
                    
                endcase

            end else if (data_bus[1:0] == 'b10) begin
                if (data_bus[7]== 'b1 & data_bus[3:2]== 'b10) begin
                    RMW = 'b0;
                    cycle = 'h2;
                end if (data_bus[7:6]== 'b10 &  data_bus[3:2]!= 'b10) begin
                    RMW = 'b0;
                    case (data_bus[4:2])
                        'b000: //imediato
                                cycle ='h2;
                        'b001: // zero page
                                cycle ='h3; 
                        'b010: //accumulator
                                cycle ='h2;
                        'b011: //absolute
                                cycle ='h4;
                        'b101: // zero page x,y
                                cycle ='h4;
                        'b111: // absolute x,y
                                cycle ='h5;
                        default: 
                                cycle ='h0;
                    endcase
                end else if (data_bus[4:2] == 'b010) begin
                    cycle = 'h2;
                    RMW ='b0;
                end else begin
                    RMW = 'b1;
                    case (data_bus[4:2])
                        'b001: // zero page
                            cycle ='h5;
                        'b011: //absoluto
                            cycle = 'h6;
                        'b101: // zero page, x/y
                            cycle = 'h6;
                        'b111: // absoluto, X/Y
                            cycle ='h7;
                        default:
                            cycle = 'h1; 
                    endcase
                end
            end else if (data_bus[1:0] == 'b00) begin
                
                if (data_bus[4:2]=='b000 & data_bus[7] =='b0) begin //interrupts
                    RMW = 'b0;
                    if (data_bus[6:5] == 'b00) // BRK
                        cycle = 'h1;
                    else // JSR, RTS, RTI
                        cycle = 'h6;
                end else begin // outros
                    if (data_bus[3:2] == 'b10) begin
                        RMW  = 'b0;
                        case (data_bus[7:4])
                            'h0:
                                cycle = 'h3;
                            'h1:
                                cycle = 'h4;
                            'h4:
                                cycle = 'h3;
                            'h6:
                                cycle = 'h4;
                            default:
                                 cycle = 'h2;
                        endcase
                    end else if (data_bus[4:2] == 'b100)begin // branch
                        cycle = 'h0;
                        RMW = 'b0;
                    end else if (data_bus[4:2] == 'b000)begin // imediato
                        cycle = 'h2;
                        RMW = 'b0;
                    end else if (data_bus[4:2] == 'b001)begin // zero page
                        cycle = 'h3;
                        RMW = 'b0;
                    end else if (data_bus[4:2] == 'b011 & data_bus[7:5] == 'b010 )begin  // absolute JMP ABS
                        cycle = 'h3;
                        RMW = 'b0;
                    end else if (data_bus[4:2] == 'b011 & data_bus[7:5] == 'b011 )begin //absolute JMP IND
                        cycle = 'h5;
                        RMW = 'b0;
                    end else if (data_bus[4:2] == 'b011 & data_bus[7:6] != 'b01 )begin // Todos os outros absolutos
                        cycle = 'h4;
                        RMW = 'b0;
                    end else if (data_bus[4:2] == 'b101)begin  //zero page X
                        cycle = 'h4;
                        RMW = 'b0;
                    end else if (data_bus[4:2] == 'b111)begin  // absolute, X
                        cycle = 'h5;
                        RMW = 'b0;
                    end else begin
                        cycle = 'h1;
                        RMW = 'b0;
                    end // end databus[3:2] =10
                end //interrupts e outros
            end else begin
                cycle = 'h1;
                RMW = 'b0;
            end  // END CC
        end // End if RST
    end // End Always
endmodule
