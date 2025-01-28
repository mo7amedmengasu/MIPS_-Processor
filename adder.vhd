----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:50:49 12/17/2024 
-- Design Name: 
-- Module Name:    adder - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY adder IS
    PORT (
        A     : IN  STD_LOGIC_VECTOR (31 DOWNTO 0); -- 32-bit input A
        B     : IN  STD_LOGIC_VECTOR (31 DOWNTO 0); -- 32-bit input B
        S     : OUT STD_LOGIC_VECTOR (31 DOWNTO 0) -- 32-bit sum output
    );
END adder;

ARCHITECTURE Behavioral OF adder IS
signal result : STD_LOGIC_VECTOR(32 downto 0);
BEGIN
	 result <= ('0'&A)+('0'&B);
    -- Convert the inputs to UNSIGNED for arithmetic, perform the addition, and convert back to STD_LOGIC_VECTOR
    S <= result(31 downto 0);
    
END Behavioral;



