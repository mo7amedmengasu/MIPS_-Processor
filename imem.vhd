----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:40:04 12/19/2024 
-- Design Name: 
-- Module Name:    imem - Behavioral 
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
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
library STD;
use STD.TEXTIO.ALL;

entity imem is -- instruction memory
    port (
        a  : in  STD_LOGIC_VECTOR(5 downto 0);
        rd : out STD_LOGIC_VECTOR(31 downto 0)
    );
end imem;

architecture behave of imem is
begin
    process is
        file mem_file : TEXT;
        variable L    : line;
        variable ch   : character;
        variable i, index, result : integer;
        type ramtype is array (63 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
        variable mem : ramtype;
    begin
        -- Initialize memory from file
        for i in 0 to 63 loop
            mem(i) := (others => '0'); -- Set all contents to '0'
        end loop;

        index := 0;
        FILE_OPEN(mem_file, "C:\Users\oa508\Documents\CO_project_phase2_v2\memfile.dat", READ_MODE);

        while not endfile(mem_file) loop
            readline(mem_file, L);
            result := 0;

            for i in 1 to 8 loop
                read(L, ch);
                if '0' <= ch and ch <= '9' then
                    result := character'pos(ch) - character'pos('0');
                elsif 'a' <= ch and ch <= 'f' then
                    result := character'pos(ch) - character'pos('a') + 10;
                else
                    report "Format error on line " & integer'image(index) severity error;
                end if;

                mem(index)(35 - i * 4 downto 32 - i * 4) := std_logic_vector(to_unsigned(result, 4));
            end loop;

            index := index + 1;
        end loop;

        -- Read memory
        for i in 1 to 1000 loop
            rd <= mem(CONV_INTEGER(a));
            wait on a;
        end loop;
    end process;

end;

