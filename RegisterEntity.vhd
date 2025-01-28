----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:11:31 12/17/2024 
-- Design Name: 
-- Module Name:    RegisterEntity - Behavioral 
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


entity RegisterEntity is
    Port ( write_enable : in  STD_LOGIC;
           written_data : in  STD_LOGIC_VECTOR (31 downto 0);
           read_data : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end RegisterEntity;

architecture Behavioral of RegisterEntity is
    signal reg_data : STD_LOGIC_VECTOR(31 downto 0); -- Internal signal for register data
begin
    process(clk, reset)
    begin
        if reset = '1' then
            reg_data <= (others => '0'); -- Clear the register
        elsif rising_edge(clk) then
            if write_enable = '1' then
                reg_data <= written_data; -- Write new data at clock edge
            end if;
        end if;
    end process;

    read_data <= reg_data; -- Assign internal register value to output
end Behavioral;
