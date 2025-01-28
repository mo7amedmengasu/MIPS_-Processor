----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:44:37 12/19/2024 
-- Design Name: 
-- Module Name:    top - Behavioral 
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
use IEEE.STD_LOGIC_1164.all;
use work.top_package.ALL;
--use IEEE.NUMERIC_STD_UNSIGNED.all;
entity top is -- top-level design for testing
port(clk, reset: in STD_LOGIC;
     writedata, dataadr: out STD_LOGIC_VECTOR(31 downto 0);
     memwrite: out STD_LOGIC);
end top;

architecture Behavioral of top is
	signal memwritet: STD_LOGIC;
	signal pc, instr, readdata, dataadrt, writedatat: STD_LOGIC_VECTOR(31 downto 0);
begin
	
	mips_instace: Mips
		port map(
			  clk => clk, 
			  reset => reset,     
			  pc => pc,             
			  instr => instr,          
			  memwrite => memwritet,        
			  aluout => dataadrt , 
			  writedata => writedatat, 
			  readdata =>  readdata     
		);
	
	dmem_instance: dmem
		port map(
			  clk => clk,
			  we => memwritet,
			  a =>  dataadrt, 
			  wd => writedatat,   
			  rd => readdata      
		);
	imem_instance: imem
		port map(
			  a  => pc(7 downto 2),
			  rd => instr
		);
		
	memwrite <= memwritet;
	dataadr <= dataadrt;
	writedata <= writedatat;

end Behavioral;