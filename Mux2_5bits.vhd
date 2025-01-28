----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:00:39 12/17/2024 
-- Design Name: 
-- Module Name:    Mux2_5bits - Behavioral 
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Mux2_5bits IS
    GENERIC (
        n : INTEGER := 5
    );
    PORT (
        I0, I1 : IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        S      : IN  STD_LOGIC;
        Y      : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
    );
END Mux2_5bits;

ARCHITECTURE MuxArch OF Mux2_5bits IS
BEGIN
    Y <= I1 WHEN S = '1' ELSE I0;
END MuxArch;
