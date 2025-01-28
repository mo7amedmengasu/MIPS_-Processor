----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:34:20 12/19/2024 
-- Design Name: 
-- Module Name:    dmem - Behavioral 
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
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dmem is -- Data memory
    port (
        clk, we : in  STD_LOGIC;
        a, wd   : in  STD_LOGIC_VECTOR(31 downto 0);
        rd      : out STD_LOGIC_VECTOR(31 downto 0)
    );
end dmem;

architecture behave of dmem is
begin
    process is
        type ramtype is array (63 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
        variable mem : ramtype;
    begin
        -- Read or write memory
        for i in 1 to 1000 loop
            if rising_edge(clk) then
                if (we = '1') then
                    mem(CONV_INTEGER('0' & a(7 downto 2))) := wd;
                end if;
            end if;

            rd <= mem(CONV_INTEGER('0' & a(7 downto 2)));
            wait on clk, a;
        end loop;
    end process;
end behave;


