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

package mips_package is

component controller is
 port (
    op, funct: in STD_LOGIC_VECTOR(5 downto 0);
    zero: in STD_LOGIC;
    memtoreg, memwrite: out STD_LOGIC;
    pcsrc, alusrc: out STD_LOGIC;
    regdst, regwrite: out STD_LOGIC;
    jump: out STD_LOGIC;
    alucontrol: out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;

component datapath is
    -- MIPS datapath
    port (
        clk, reset      : in  STD_LOGIC;
        memtoreg, pcsrc : in  STD_LOGIC;
        alusrc, regdst  : in  STD_LOGIC;
        regwrite, jump  : in  STD_LOGIC;
        alucontrol      : in  STD_LOGIC_VECTOR(3 downto 0);
        zero            : out STD_LOGIC;
        pc              : buffer STD_LOGIC_VECTOR(31 downto 0);
        instr           : in  STD_LOGIC_VECTOR(31 downto 0);
        writedata       : buffer STD_LOGIC_VECTOR(31 downto 0);
        aluout          : buffer STD_LOGIC_VECTOR(31 downto 0);
        readdata        : in  STD_LOGIC_VECTOR(31 downto 0)
    );
end component;

end mips_package;


