----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:08:42 12/17/2024 
-- Design Name: 
-- Module Name:    demux - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.numeric_std.all;


entity demux is
    Port ( input : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC_VECTOR (4 downto 0));
end demux;

architecture Behavioral of demux is

begin
process(sel,input)
  begin
    output <= (others => '0');
    if input= '1' then
      output(to_integer(unsigned(sel)))<=input;
    end if;
  end process;
end Behavioral;
