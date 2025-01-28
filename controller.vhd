----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:11:45 12/19/2024 
-- Design Name: 
-- Module Name:    controller - Behavioral 
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
use work.controller_package.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controller is
 port (
    op, funct: in STD_LOGIC_VECTOR(5 downto 0);
    zero: in STD_LOGIC;
    memtoreg, memwrite: out STD_LOGIC;
    pcsrc, alusrc: out STD_LOGIC;
    regdst, regwrite: out STD_LOGIC;
    jump: out STD_LOGIC;
    alucontrol: out STD_LOGIC_VECTOR(3 downto 0)
  );
end controller;

architecture Behavioral of controller is
	signal aluop: STD_LOGIC_VECTOR(1 downto 0);
	signal branch: STD_LOGIC;
begin
	maindec_instance: maindec
		port map(
		   op => op,
			memtoreg => memtoreg ,
			memwrite => memwrite,
			branch => branch , 
			alusrc => alusrc,
			regdst => regdst,
			regwrite => regwrite,
			jump => jump,
			aluop => aluop
		);
	aludec_instace: aludec
		port map(
		   funct => funct,
			aluop => aluop,
			alucontrol => alucontrol
		);
	
	pcsrc <= zero and branch;

end Behavioral;

