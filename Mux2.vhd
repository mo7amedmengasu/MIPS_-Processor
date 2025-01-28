----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:45:10 12/17/2024 
-- Design Name: 
-- Module Name:    Mux2 - Behavioral 
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
ENTITY Mux2 IS
    Generic (n : integer := 32); -- Default value of n is 8 bits
    PORT (
        I0, I1 : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0); -- 2 inputs of n-bit width
        S      : IN STD_LOGIC;                      -- Select signal
        Y      : OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0) -- Output of n-bit width
    );
END Mux2;

ARCHITECTURE MuxArch OF Mux2 IS
BEGIN
    Y <= I1 WHEN S = '1' ELSE I0; -- Conditional assignment based on S
END MuxArch;

