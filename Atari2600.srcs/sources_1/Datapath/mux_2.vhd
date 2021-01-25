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

entity Mux_2 is
generic (
WIDTH :INTEGER := 8;
SIZE: INTEGER := 1
);

port(	
	In_0: 	in std_logic_vector(WIDTH-1 downto 0);
	In_1: 	in std_logic_vector(WIDTH-1 downto 0);
	Sel:	in std_logic_vector (SIZE-1 DOWNTO 0);
	o_mux:	out std_logic_vector(WIDTH-1 downto 0)
);
end Mux_2;  

-------------------------------------------------

architecture rtl of Mux_2 is
begin
   o_mux <= 
    in_0 when (sel = "0" ) else 
    in_1;
 
end rtl;


--------------------------------------------------
