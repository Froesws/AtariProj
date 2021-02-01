----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.01.2021 16:00:38
-- Design Name: 
-- Module Name: Decoder - Behavioral
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

-- Uncomment the following librry declaration if instantiating
-- any Xilinx leaf cells in thiscode.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder is
 Port (
 instruction_in: in std_logic_vector(7 downto 0);
 operation : out std_logic_vector (7 downto 0);
 addressing: out std_logic_vector (3 downto 0)
  );
end Decoder;
 
 
architecture rtl of decoder is 
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
signal instruction: decoded_instruction;
signal mode: address_mode;
signal AAA: std_logic_vector(2 downto 0);
signal BBB: std_logic_vector(2 downto 0);
signal CC:  std_logic_vector(1 downto 0);
begin
AAA <= INSTRUCTION_IN(7 DOWNTO 5);
BBB <= INSTRUCTION_IN(4 DOWNTO 2);
CC <= INSTRUCTION_IN(1 DOWNTO 0);
my_process_name : process(AAA,BBB,CC)
begin
  case CC is
    when "00" =>  -- CC = 00
    if (AAA = "000") then
        if(BBB = "000") then
            instruction <= BRK;
            mode <= imp;
         elsif(BBB = "100") then
            instruction <= BPL;
            mode <= rel;
         elsif(BBB = "010") then
            instruction <= PHP;
            mode <= imp;
         elsif(BBB = "110") then
            instruction <= CLC;
            mode <= imp;
         end if;
         
     elsif (AAA = "001") then 
        if(BBB = "000") then
             instruction <= JSR;
             mode <= abt;
        elsif (BBB ="100")then
             instruction <= BMI;
             mode <= rel;
        elsif (BBB ="001")then
             instruction <= BIT_1;
             mode <= zpg;
        elsif (BBB ="010")then
             instruction <= PLP;
             mode <= imp;
        elsif (BBB ="110")then
             instruction <= SEC;
             mode <= imp;
        elsif (BBB ="011")then
             instruction <= BIT_1;
             mode <= abt;
        end if;
        
    elsif (AAA = "010") then 
        if (BBB = "000") then 
             instruction <= RTI;
             mode <= imp;
        elsif (BBB = "100") then
             instruction <= BVC;
             mode <= rel;
        elsif (BBB = "100") then
             instruction <= BVC;
             mode <= rel;
        elsif (BBB = "010") then
             instruction <= PHA;
             mode <= imp;
         elsif (BBB = "110") then
             instruction <= CLI;
             mode <= imp;
          elsif (BBB = "011") then
             instruction <= JMP;
             mode <= abt;
        end if;
        
    elsif (AAA = "011") then
        if (BBB = "000") then 
             instruction <= RTS;
             mode <= imp;
        elsif (BBB = "100") then
             instruction <= BVS;
             mode <= rel;
        elsif (BBB = "010") then
             instruction <= PLA;
             mode <= imp;
        elsif (BBB = "110") then
             instruction <= SEI;
             mode <= imp;
        elsif (BBB = "011") then
             instruction <= JMP;
             mode <= ind;
        end if;
        
    elsif (AAA = "100") then
          if (BBB = "100") then 
             instruction <= BCC;
             mode <= rel;
        elsif (BBB = "001") then
             instruction <= STY;
             mode <= zpg;
        elsif (BBB = "101") then
             instruction <= STY;
             mode <= zpx;
        elsif (BBB = "010") then
             instruction <= DEY;
             mode <= imp;
        elsif (BBB = "110") then
             instruction <= TYA;
             mode <= imp;
        elsif (BBB = "011") then
             instruction <= STY;
             mode <= abt;
        end if;
        
    elsif (AAA = "101") then 
        if (BBB = "000") then
             instruction <= LDY;
             mode <= imd; 
        elsif (BBB = "100") then
             instruction <= BCS;
             mode <= rel;
        elsif (BBB = "001") then
             instruction <= LDY;
             mode <= zpg;
        elsif (BBB = "101") then
             instruction <= LDY;
             mode <= zpx;
        elsif (BBB = "010") then
             instruction <= TAY;
             mode <= imp;
        elsif (BBB = "110") then
             instruction <= CLV;
             mode <= imp;
        elsif (BBB = "011") then
             instruction <= LDY;
             mode <= abt;
        elsif (BBB = "111") then
             instruction <= LDY;
             mode <= abs_x;
        end if;  
         
    elsif (AAA = "110") then  
        if (BBB = "000")then
            instruction <= CPY;
            mode <= imd;
        elsif (BBB = "100" ) then
            instruction <= BNE;
            mode <= rel;
        elsif (BBB = "001" ) then
            instruction <= CPY;
            mode <= zpg;
         elsif (BBB = "010" ) then
            instruction <= INY;
            mode <= imp;
         elsif (BBB = "110" ) then
            instruction <= CLD;
            mode <= imp;
         elsif (BBB = "011" ) then
            instruction <= CPY;
            mode <= abt;
        end if;
    else
        if (BBB = "000" ) then
            instruction <= CPX;
            mode <= imd;
         elsif (BBB = "100" ) then
            instruction <= BEQ;
            mode <= rel;
         elsif (BBB = "001" ) then
            instruction <= CPX;
            mode <= zpg;
         elsif (BBB = "010" ) then
            instruction <= INX;
            mode <= imp;
         elsif (BBB = "110" ) then
            instruction <= SED;
            mode <= imp;
         elsif (BBB = "011" ) then
            instruction <= CPX;
            mode <= abt;
        end if;
    end if;
    
    
 when "01" =>  -- CC = 01
    if (AAA = "000") then
        if (BBB = "000") then
            instruction <= ORA;
            mode <=x_ind;
        elsif (BBB = "100") then
            instruction <= ORA;
            mode <=ind_y;
         elsif (BBB = "001") then
            instruction <= ORA;
            mode <=zpg;
         elsif (BBB = "101") then
            instruction <= ORA;
            mode <=zpx;
         elsif (BBB = "010") then
            instruction <= ORA;
            mode <=imd;
         elsif (BBB = "110") then
            instruction <= ORA;
            mode <=abs_y;
         elsif (BBB = "011") then
           instruction <= ORA;
           mode <=abt;
         elsif (BBB = "111") then
           instruction <= ORA;
           mode <=abs_x;
        end if;
    elsif (AAA = "001") then
        if (BBB = "000") then
            instruction <= AND_1;
            mode <=x_ind;
        elsif (BBB = "100") then
            instruction <= AND_1;
            mode <=ind_y;
         elsif (BBB = "001") then
            instruction <= AND_1;
            mode <=zpg;
         elsif (BBB = "101") then
            instruction <= AND_1;
            mode <=zpx;
         elsif (BBB = "010") then
            instruction <= AND_1;
            mode <=imd;
         elsif (BBB = "110") then
            instruction <= AND_1;
            mode <=abs_y;
         elsif (BBB = "011") then
           instruction <= AND_1;
           mode <=abt;
         elsif (BBB = "111") then
           instruction <= AND_1;
           mode <=abs_x;
        end if;
        
    elsif (AAA = "010") then
       if (BBB = "000") then
            instruction <= EOR;
            mode <=x_ind;
        elsif (BBB = "100") then
            instruction <= EOR;
            mode <=ind_y;
         elsif (BBB = "001") then
            instruction <= EOR;
            mode <=zpg;
         elsif (BBB = "101") then
            instruction <= EOR;
            mode <=zpx;
         elsif (BBB = "010") then
            instruction <= EOR;
            mode <=imd;
         elsif (BBB = "110") then
            instruction <= EOR;
            mode <=abs_y;
         elsif (BBB = "011") then
           instruction <= EOR;
           mode <=abt;
         elsif (BBB = "111") then
           instruction <= EOR;
           mode <=abs_x;
        end if;
        
    elsif (AAA = "011") then
        if (BBB = "000") then
            instruction <= ADC;
            mode <=x_ind;
        elsif (BBB = "100") then
            instruction <= ADC;
            mode <=ind_y;
         elsif (BBB = "001") then
            instruction <= ADC;
            mode <=zpg;
         elsif (BBB = "101") then
            instruction <= ADC;
            mode <=zpx;
         elsif (BBB = "010") then
            instruction <= ADC;
            mode <=imd;
         elsif (BBB = "110") then
            instruction <= ADC;
            mode <=abs_y;
         elsif (BBB = "011") then
           instruction <= ADC;
           mode <=abt;
         elsif (BBB = "111") then
           instruction <= ADC;
           mode <=abs_x;
        end if;
        
    elsif (AAA = "100") then
        if (BBB = "000") then
            instruction <= STA;
            mode <=x_ind;
        elsif (BBB = "100") then
            instruction <= STA;
            mode <=ind_y;
        elsif (BBB = "001") then
            instruction <= STA;
            mode <=zpg;
        elsif (BBB = "101") then
            instruction <= STA;
            mode <=zpx;
        elsif (BBB = "110") then
            instruction <= STA;
            mode <=abs_y;
        elsif (BBB = "011") then
           instruction <= STA;
           mode <=abt;
        elsif (BBB = "111") then
           instruction <= STA;
           mode <=abs_x;
        end if;
        
    elsif (AAA = "101") then
        if (BBB = "000") then
            instruction <= LDA;
            mode <=x_ind;
        elsif (BBB = "100") then
            instruction <= LDA;
            mode <=ind_y;
         elsif (BBB = "001") then
            instruction <= LDA;
            mode <=zpg;
         elsif (BBB = "101") then
            instruction <= LDA;
            mode <=zpx;
         elsif (BBB = "010") then
            instruction <= LDA;
            mode <=imd;
         elsif (BBB = "110") then
            instruction <= LDA;
            mode <=abs_y;
         elsif (BBB = "011") then
           instruction <= LDA;
           mode <=abt;
         elsif (BBB = "111") then
           instruction <= LDA;
           mode <=abs_x;
        end if;
        
    elsif (AAA = "110") then
        if (BBB = "000") then
            instruction <= CMP;
            mode <=x_ind;
        elsif (BBB = "100") then
            instruction <= CMP;
            mode <=ind_y;
         elsif (BBB = "001") then
            instruction <= CMP;
            mode <=zpg;
         elsif (BBB = "101") then
            instruction <= CMP;
            mode <=zpx;
         elsif (BBB = "010") then
            instruction <= CMP;
            mode <=imd;
         elsif (BBB = "110") then
            instruction <= CMP;
            mode <=abs_y;
         elsif (BBB = "011") then
           instruction <= CMP;
           mode <=abt;
         elsif (BBB = "111") then
           instruction <= CMP;
           mode <=abs_x;
        end if;
        
    else
        if (BBB = "000") then
            instruction <= SBC;
            mode <=x_ind;
        elsif (BBB = "100") then
            instruction <= SBC;
            mode <=ind_y;
         elsif (BBB = "001") then
            instruction <= SBC;
            mode <=zpg;
         elsif (BBB = "101") then
            instruction <= SBC;
            mode <=zpx;
         elsif (BBB = "010") then
            instruction <= SBC;
            mode <=imd;
         elsif (BBB = "110") then
            instruction <= SBC;
            mode <=abs_y;
         elsif (BBB = "011") then
           instruction <= SBC;
           mode <=abt;
         elsif (BBB = "111") then
           instruction <= SBC;
           mode <=abs_x;
        end if;
    end if;
    
    
 when others =>  -- CC = 10
   if (AAA = "000") then
        if (BBB = "001") then
            instruction <= ASL;
            mode <= zpg;
        elsif (BBB = "101") then
            instruction <= ASL;
            mode <= zpx;
        elsif (BBB = "010") then
            instruction <= ASL;
            mode <= acc;
        elsif (BBB = "011") then
            instruction <= ASL;
            mode <= abt;
        elsif (BBB = "111") then
            instruction <= ASL;
            mode <= abs_x;
        end if;
        
    elsif (AAA = "001") then
        if (BBB = "001") then
            instruction <= ROL_1;
            mode <= zpg;
        elsif (BBB = "101") then
            instruction <= ROL_1;
            mode <= zpx;
        elsif (BBB = "010") then
            instruction <= ROL_1;
            mode <= acc;
        elsif (BBB = "011") then
            instruction <= ROL_1;
            mode <= abt;
        elsif (BBB = "111") then
            instruction <= ROL_1;
            mode <= abs_x;
        end if;
        
    elsif (AAA = "010") then
       if (BBB = "001") then
            instruction <= LSR;
            mode <= zpg;
        elsif (BBB = "101") then
            instruction <= LSR;
            mode <= zpx;
        elsif (BBB = "010") then
            instruction <= LSR;
            mode <= acc;
        elsif (BBB = "011") then
            instruction <= LSR;
            mode <= abt;
        elsif (BBB = "111") then
            instruction <= LSR;
            mode <= abs_x;
        end if;
        
    elsif (AAA = "011") then
        if (BBB = "001") then
            instruction <= ROR_1;
            mode <= zpg;
        elsif (BBB = "101") then
            instruction <= ROR_1;
            mode <= zpx;
        elsif (BBB = "010") then
            instruction <= ROR_1;
            mode <= acc;
        elsif (BBB = "011") then
            instruction <= ROR_1;
            mode <= abt;
        elsif (BBB = "111") then
            instruction <= ROR_1;
            mode <= abs_x;
        end if;
        
    elsif (AAA = "100") then
        if (BBB = "001") then
            instruction <= STX;
            mode <= zpg;
        elsif (BBB = "101") then
            instruction <= STX;
            mode <= zpy;
       elsif (BBB = "010") then
           instruction <= TXA;
           mode <= imp;
       elsif (BBB = "110") then
           instruction <= TXS;
           mode <= imp;
       elsif (BBB = "011") then
           instruction <= STX;
           mode <= abt;
        end if;
        
    elsif (AAA = "101") then
        if (BBB = "000") then
          instruction <= LDX;
          mode <= imd;
        elsif (BBB = "001") then
          instruction <= LDX;
          mode <= zpg;
        elsif (BBB = "101") then
          instruction <= LDX;
          mode <= zpy;
        elsif (BBB = "010") then
          instruction <= TAX;
          mode <= imp;
        elsif (BBB = "110") then
          instruction <= TSX;
          mode <= imp;
       elsif (BBB = "011") then
          instruction <= LDX;
          mode <= abt;
       elsif (BBB = "111") then
          instruction <= LDX;
          mode <= abs_y;
        end if;
        
    elsif (AAA = "110") then
        if (BBB = "001") then
          instruction <= DEC;
          mode <= zpg;
        elsif (BBB = "101") then
          instruction <= DEC;
          mode <= zpx;
        elsif (BBB = "010") then
          instruction <= DEX;
          mode <= imp;
        elsif (BBB = "011") then
          instruction <= DEC;
          mode <= abt;
        elsif (BBB = "111") then
          instruction <= DEC;
          mode <= abs_x;
        end if;
        
    else  -- Ultimo AAA
        if (BBB = "001") then
          instruction <= INC;
          mode <= zpg;
        elsif (BBB = "101") then
          instruction <= INC;
          mode <= zpx;
        elsif (BBB = "010") then
          instruction <= NOP;
          mode <= imp;
        elsif (BBB = "011") then
          instruction <= INC;
          mode <= abt;
        elsif (BBB = "111") then
          instruction <= INC;
          mode <= abs_x;
        end if;
    end if;
end case;
end process;


process_saida: process (instruction, mode)
begin
case (instruction) is
    when BRK => OPERATION <= x"00";
    when BPL => OPERATION <= x"01";
    when JSR => OPERATION <= x"02";
    when BMI => OPERATION <= x"03";
    when RTI => OPERATION <= x"04";
    when BVC => OPERATION <= x"05";
    when RTS => OPERATION <= x"06";
    when BVS => OPERATION <= x"07";
    when BCC => OPERATION <= x"08";
    when LDY => OPERATION <= x"09";
    when BCS => OPERATION <= x"0A";
    when CPY => OPERATION <= x"0B"; 
    when BNE => OPERATION <= x"0C";
    when CPX => OPERATION <= x"0D";
    when BEQ => OPERATION <= x"0E";
    when BIT_1 => OPERATION <= x"0F";
    when STY => OPERATION <= x"10";
    when PHP => OPERATION <= x"11";
    when CLC => OPERATION <= x"12";
    when PLP =>  OPERATION <= x"13";
    when SEC => OPERATION <= x"14";
    when PHA => OPERATION <= x"15";
    when CLI => OPERATION <= x"16";
    when PLA => OPERATION <= x"17";
    when SEI => OPERATION <= x"18";
    when DEY => OPERATION <= x"19";
    when TYA => OPERATION <= x"1A";
    when TAY => OPERATION <= x"1B";
    when CLV => OPERATION <= x"1C";
    when INY => OPERATION <= x"1D";
    when CLD => OPERATION <= x"1E";
    when INX => OPERATION <= x"1F";
    when SED => OPERATION <= x"20";
    when ORA => OPERATION <= x"21";
    when AND_1 => OPERATION <= x"22";
    when EOR => OPERATION <= x"23";
    when ADC => OPERATION <= x"24";
    when STA => OPERATION <= x"25";
    when LDA => OPERATION <= x"26";
    when CMP => OPERATION <= x"27";
    when SBC => OPERATION <= x"28";
    when ASL =>  OPERATION <= x"29";
    when ROL_1 => OPERATION <= x"2A";
    when LSR => OPERATION <= x"2B";
    when ROR_1 => OPERATION <= x"2C";
    when STX => OPERATION <= x"2D";
    when LDX => OPERATION <= x"2E";
    when DEC => OPERATION <= x"2F";
    when INC => OPERATION <= x"30";
    when TXA => OPERATION <= x"31";
    when TXS => OPERATION <= x"32";
    when TAX => OPERATION <= x"33";
    when TSX => OPERATION <= x"34";
    when DEX => OPERATION <= x"35";
    when NOP => OPERATION <= x"36";
    when JMP => OPERATION <= x"37";
end case;
    case (mode) is
       when zpg => addressing <= x"0";
       when imd => addressing <= x"1";
       when abt => addressing <= x"2";
       when zpx => addressing <= x"3";
       when abs_y => addressing <= x"4";
       when abs_x => addressing <= x"5";
       when imp => addressing <= x"5";
       when rel =>  addressing <= x"6";
       when acc => addressing <= x"7";
       when ind => addressing <= x"8";
       when x_ind =>  addressing <= x"9";
       when zpx_ind => addressing <= x"A";
       when zpy => addressing <= x"B";
       when ind_y => addressing <= x"C";
   end case;
end process;
end rtl;
