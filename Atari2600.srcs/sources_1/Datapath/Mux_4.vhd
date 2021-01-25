-------------------------------------------------
-- VHDL code for 4:1 multiplexor
-- (ESD book figure 2.5)
-- by Weijun Zhang, 04/2001
--
-- Multiplexor is a device to select different
-- inputs to outputs. we use 3 bits vector to 
-- describe its I/O ports 
-------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------

entity Mux_4 is
generic (
WIDTH :INTEGER := 8;
SIZE: INTEGER := 2
);

port(	
	In_0: 	in std_logic_vector(WIDTH-1 downto 0);
	In_1: 	in std_logic_vector(WIDTH-1 downto 0);
	In_2: 	in std_logic_vector(WIDTH-1 downto 0);
	In_3: 	in std_logic_vector(WIDTH-1 downto 0);
	Sel:	in std_logic_vector (SIZE-1 DOWNTO 0);
	o_mux:	out std_logic_vector(WIDTH-1 downto 0)
);
end Mux_4;  

-------------------------------------------------

architecture rtl of Mux_4 is
begin
   o_mux <= 
    in_0 when (sel = "00" ) else 
    in_1 when (sel = "01" ) else 
    in_2 when (sel = "10" ) else
    in_3;
 
end rtl;


--------------------------------------------------
