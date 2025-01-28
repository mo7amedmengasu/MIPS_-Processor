--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package controller_package is

component aludec is
  port (
    funct: in STD_LOGIC_VECTOR(5 downto 0);
    aluop: in STD_LOGIC_VECTOR(1 downto 0);
    alucontrol: out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;

component maindec is
  port (
    op: in STD_LOGIC_VECTOR(5 downto 0);
    memtoreg, memwrite: out STD_LOGIC;
    branch, alusrc: out STD_LOGIC;
    regdst, regwrite: out STD_LOGIC;
    jump: out STD_LOGIC;
    aluop: out STD_LOGIC_VECTOR(1 downto 0)
  );
end component;



end controller_package;


