----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  William Froes
-- 
-- Create Date: 24.01.2021 17:35:19
-- Design Name: 
-- Module Name: mux_db - Behavioral
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

entity mux_db is
port(
  db_sel      : in  std_logic_vector(2 downto 0);
  dl_db     : in  std_logic_vector(7 downto 0);
  pcl_db     : in  std_logic_vector(7 downto 0);
  pch_db     : in  std_logic_vector(7 downto 0);
  sb_db      : in  std_logic_vector(7 downto 0);
  acc_db      : in  std_logic_vector(7 downto 0);
  db      : out std_logic_vector(7 downto 0));
end mux_db;

architecture rtl of mux_db is
begin
  db <= dl_db when (db_sel = b"000") else
         pcl_db when (db_sel = b"001") else
         pch_db when (db_sel = b"010") else
         sb_db when (db_sel = b"011") else
         acc_db when (db_sel = b"100");
end rtl;