----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.01.2021 16:50:04
-- Design Name: 
-- Module Name: work - 
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity work is
--  Port ( );
end work;

package my_types is
    type decoded_instruction is(
        BRK, BPL, JSR, BMI, RTI, BVC, 
        RTS, BVS, BCC, LDY, BCS, CPY, 
        BNE, CPX, BEQ, BIT_1, STY,PHP, 
        CLC, PLP, SEC, PHA, CLI, PLA, 
        SEI, DEY, TYA, TAY, CLV, INY, 
        CLD, INX, SED, ORA, AND_1, EOR, 
        ADC, STA, LDA, CMP,SBC, ASL, ROL_1, 
        LSR, ROR_1, STX, LDX, DEC, INC, TXA, 
        TXS, TAX, TSX, DEX, NOP, JMP); 


type address_mode is ( zpg,imd,abt, zpx, abs_y, abs_x, imp, rel, acc,
                                    ind, x_ind, zpx_ind, zpy, ind_y);



end package;




