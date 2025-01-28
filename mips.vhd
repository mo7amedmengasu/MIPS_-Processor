----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:36:26 12/19/2024 
-- Design Name: 
-- Module Name:    mips - Behavioral 
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
use work.mips_package.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mips is -- single cycle MIPS processor
  port (
    clk, reset: in STD_LOGIC;
    pc: buffer STD_LOGIC_VECTOR(31 downto 0);
    instr: in STD_LOGIC_VECTOR(31 downto 0);
    memwrite: out STD_LOGIC;
    aluout, writedata: buffer STD_LOGIC_VECTOR(31 downto 0);
    readdata: in STD_LOGIC_VECTOR(31 downto 0)
  );
end entity;

architecture Behavioral of mips is
	signal memtoreg, alusrc, regdst, regwrite, jump, pcsrc: STD_LOGIC;
	signal zero: STD_LOGIC;
	signal alucontrol: STD_LOGIC_VECTOR(3 downto 0);
	signal alu_out, write_data: STD_LOGIC_VECTOR(31 downto 0);
begin
	datapath_instance: datapath
		port map(
		      clk => clk, 
				reset => reset, 
				memtoreg => memtoreg,
				pcsrc => pcsrc,
				alusrc => alusrc,
				regdst => regdst,
				regwrite => regwrite,
				jump => jump,  
				alucontrol => alucontrol,
				zero => zero,
				pc => pc,      
				instr => instr,        
				writedata => writedata,
				aluout => aluout, 
				readdata => readdata
		);
   controller_instance: controller
		port map(
				 op => instr(31 downto 26),
				 funct => instr(5 downto 0),
				 zero => zero,
				 memtoreg => memtoreg,
				 memwrite => memwrite,
				 pcsrc => pcsrc,
				 alusrc => alusrc,
				 regdst => regdst, 
				 regwrite => regwrite,
				 jump => jump,
				 alucontrol => alucontrol
		);
   
end Behavioral;

