----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:09:49 12/17/2024 
-- Design Name: 
-- Module Name:    RegisterZeroEntity - Behavioral 
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

entity RegisterZeroEntity is
    Port (
        write_enable : in  STD_LOGIC;
        written_data : in  STD_LOGIC_VECTOR(31 downto 0);
        read_data    : out STD_LOGIC_VECTOR(31 downto 0);
        clk          : in  STD_LOGIC;
        reset        : in  STD_LOGIC
    );
end RegisterZeroEntity;

architecture Behavioral of RegisterZeroEntity is

begin

    -- Set read_data to always output zero
    read_data <= (others => '0');

end Behavioral;

