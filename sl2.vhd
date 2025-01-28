----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:51:30 12/17/2024 
-- Design Name: 
-- Module Name:    sl2 - Behavioral 
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

ENTITY sl2 IS
    PORT (
        a : IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
        y : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
END sl2;

ARCHITECTURE myarch OF sl2 IS
BEGIN
    -- Shift left by 2 positions: assign bits 29 downto 0 and append "00"
    y <= a(29 DOWNTO 0) & "00";
END myarch;


