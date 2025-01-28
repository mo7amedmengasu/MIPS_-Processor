----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:57:33 12/17/2024 
-- Design Name: 
-- Module Name:    signext - Behavioral 
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

entity signext is
    -- sign extender
    port (
        a : in  STD_LOGIC_VECTOR(15 downto 0);
        y : out STD_LOGIC_VECTOR(31 downto 0)
    );
end signext;

architecture beave of signext is
begin
    y <= X"ffff" & a when a(15) = '1' else
         X"0000" & a;
end architecture beave;