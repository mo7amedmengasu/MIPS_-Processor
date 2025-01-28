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

package data_path_package is
component Mux2 IS
    Generic (n : integer := 32); -- Default value of n is 8 bits
    PORT (
        I0, I1 : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0); -- 2 inputs of n-bit width
        S      : IN STD_LOGIC;                      -- Select signal
        Y      : OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0) -- Output of n-bit width
    );
END component;

component Register_File is
Port ( read_sel1 : in  std_logic_vector(4 downto 0);
           read_sel2 : in  std_logic_vector(4 downto 0);
           write_sel : in  std_logic_vector(4 downto 0);
           write_ena : in  std_logic;
           clk       : in  std_logic;
			  reset     : in  std_logic;
           write_data: in  std_logic_vector(31 downto 0);
           data1     : out std_logic_vector(31 downto 0);
           data2     : out std_logic_vector(31 downto 0) );
end component;

component adder IS
    PORT (
        A     : IN  STD_LOGIC_VECTOR (31 DOWNTO 0); -- 4-bit input A
        B     : IN  STD_LOGIC_VECTOR (31 DOWNTO 0); -- 4-bit input B
        S     : OUT STD_LOGIC_VECTOR (31 DOWNTO 0) -- 4-bit sum output
    );
END component;


component alu is
    Port ( data11 : in  STD_LOGIC_VECTOR (31 downto 0);
           data22 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (3 downto 0);
           dataout : out  STD_LOGIC_VECTOR (31 downto 0);
           zflag : out  STD_LOGIC);
end component;


component flopr is
    generic (
        n : NATURAL := 32
    );
    port (
        clk, reset : in  STD_LOGIC;
        d          : in  STD_LOGIC_VECTOR(n-1 downto 0);
        q          : out STD_LOGIC_VECTOR(n-1 downto 0)
    );
end component;


component signext is
    -- sign extender
    port (
        a : in  STD_LOGIC_VECTOR(15 downto 0);
        y : out STD_LOGIC_VECTOR(31 downto 0)
    );
end component;

component sl2 IS
    PORT (
        a : IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
        y : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
END component;

component Mux2_5bits IS
    GENERIC (
        n : INTEGER := 5
    );
    PORT (
        I0, I1 : IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        S      : IN  STD_LOGIC;
        Y      : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
    );
END component;


end data_path_package;



