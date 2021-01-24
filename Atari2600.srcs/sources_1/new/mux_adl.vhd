----------------------------------------------------------------------------------
-- Company:  Uergs
-- Engineer: William Froes
-- 
-- Create Date: 24.01.2021 15:43:10
-- Design Name: 
-- Module Name: mux_adl - Behavioral
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


library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_adl is
port(
  adl_sel      : in  std_logic_vector(2 downto 0);
  pcl_adl     : in  std_logic_vector(7 downto 0);
  add_adl     : in  std_logic_vector(7 downto 0);
  s_adl     : in  std_logic_vector(7 downto 0);
  dp_adl      : in  std_logic_vector(7 downto 0);
  adl      : out std_logic_vector(7 downto 0));
end mux_adl;

architecture rtl of mux_adl is
begin
  adl <= pcl_adl when (adl_sel = b"000") else
         x"00" when (adl_sel = b"001") else
         add_adl when (adl_sel = b"010") else
         dp_adl when (adl_sel = b"011") else
         dp_adl when (adl_sel = b"100") else
         x"00";
end rtl;