----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:21:19 12/17/2024 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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


entity alu is
    Port ( data11 : in  STD_LOGIC_VECTOR (31 downto 0);
           data22 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (3 downto 0);
           dataout : out  STD_LOGIC_VECTOR (31 downto 0);
           zflag : out  STD_LOGIC);
end alu;

architecture Behavioral of alu is
SIGNAL B, A , sum: STD_LOGIC_VECTOR (31 downto 0);
signal tmp:STD_LOGIC_VECTOR (31 downto 0);
begin
B <= data22 when aluop(2) = '0' else
				not data22;

A <= data11 when aluop(3) = '0' else
	  not data11;
	  
sum <= A + B + aluop(2);

tmp <= A and B when aluop( 1 downto 0) = "00" else
			  A or B when aluop(1 downto 0)= "01" else
			  sum when aluop(1 downto 0) = "10" else
			  ("0000000000000000000000000000000" & sum(31)) when aluop(1 downto 0)= "11"else
			  X"00000000";

dataout <= tmp;
zflag <= '1' when tmp = X"00000000" else '0';

end Behavioral;

