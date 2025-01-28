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

package top_package is

component mips is -- single cycle MIPS processor
  port (
    clk, reset: in STD_LOGIC;
    pc: buffer STD_LOGIC_VECTOR(31 downto 0);
    instr: in STD_LOGIC_VECTOR(31 downto 0);
    memwrite: out STD_LOGIC;
    aluout, writedata: buffer STD_LOGIC_VECTOR(31 downto 0);
    readdata: in STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

component imem is -- instruction memory
    port (
        a  : in  STD_LOGIC_VECTOR(5 downto 0);
        rd : out STD_LOGIC_VECTOR(31 downto 0)
    );
end component;


component dmem is -- Data memory
    port (
        clk, we : in  STD_LOGIC;
        a, wd   : in  STD_LOGIC_VECTOR(31 downto 0);
        rd      : out STD_LOGIC_VECTOR(31 downto 0)
    );
end component;

end top_package;


