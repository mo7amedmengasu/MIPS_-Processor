----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:07:13 12/19/2024 
-- Design Name: 
-- Module Name:    aludec - Behavioral 
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

-- ALU control decoder

entity aludec is
  port (
    funct: in STD_LOGIC_VECTOR(5 downto 0);
    aluop: in STD_LOGIC_VECTOR(1 downto 0);
    alucontrol: out STD_LOGIC_VECTOR(3 downto 0)
  );
end entity;
architecture behave of aludec is
begin

  process (aluop, funct) is
  begin
    case aluop is
      when "00" => alucontrol <= "0010"; -- add (for lw/sw/addi)
      when "01" => alucontrol <= "0110"; -- sub (for beq)
      when others =>
        case funct is -- R-type instructions
          when "100000" => alucontrol <= "0010"; -- add
          when "100010" => alucontrol <= "0110"; -- sub
          when "100100" => alucontrol <= "0000"; -- and
          when "100101" => alucontrol <= "0001"; -- or
          when "101010" => alucontrol <= "0111"; -- slt
          when others => alucontrol <= "----"; -- ???
        end case;
    end case;
  end process;

end architecture;
