----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:41:23 12/17/2024 
-- Design Name: 
-- Module Name:    flopr - Behavioral 
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

entity flopr is
    generic (
        n : NATURAL := 32
    );
    port (
        clk, reset : in  STD_LOGIC;
        d          : in  STD_LOGIC_VECTOR(n-1 downto 0);
        q          : out STD_LOGIC_VECTOR(n-1 downto 0)
    );
end flopr;

architecture Behavioral of Flopr is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            q <= (others => '0');
        elsif rising_edge(clk) then
            q <= d;
        end if;
    end process;
end architecture Behavioral;
