----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:13:10 12/17/2024 
-- Design Name: 
-- Module Name:    General_Mux - Behavioral 
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
use IEEE.numeric_std.all;


entity General_Mux is

generic(
   BITS   : POSITIVE  := 32
);
Port (
		in0 : in std_logic_vector(BITS-1 downto 0);
		in1 : in std_logic_vector(BITS-1 downto 0);
		in2 : in std_logic_vector(BITS-1 downto 0);
		in3 :  in std_logic_vector(BITS-1 downto 0);
		in4 :  in std_logic_vector(BITS-1 downto 0);
		in5 :  in std_logic_vector(BITS-1 downto 0);
		in6 :  in std_logic_vector(BITS-1 downto 0);
		in7 :  in std_logic_vector(BITS-1 downto 0);
		in8 :  in std_logic_vector(BITS-1 downto 0);
		in9 :  in std_logic_vector(BITS-1 downto 0);
		in10 : in std_logic_vector(BITS-1 downto 0);
		in11 : in std_logic_vector(BITS-1 downto 0);
		in12 : in std_logic_vector(BITS-1 downto 0);
		in13 : in std_logic_vector(BITS-1 downto 0);
		in14 : in std_logic_vector(BITS-1 downto 0);
		in15 : in std_logic_vector(BITS-1 downto 0);
		in16 : in std_logic_vector(BITS-1 downto 0);
		in17 : in std_logic_vector(BITS-1 downto 0);
		in18 : in std_logic_vector(BITS-1 downto 0);
		in19 : in std_logic_vector(BITS-1 downto 0);
		in20 : in std_logic_vector(BITS-1 downto 0);
		in21 : in std_logic_vector(BITS-1 downto 0);
		in22 : in std_logic_vector(BITS-1 downto 0);
		in23 : in std_logic_vector(BITS-1 downto 0);
		in24 : in std_logic_vector(BITS-1 downto 0);
		in25 : in std_logic_vector(BITS-1 downto 0);
		in26 : in std_logic_vector(BITS-1 downto 0);
		in27 : in std_logic_vector(BITS-1 downto 0);
		in28 : in std_logic_vector(BITS-1 downto 0);
		in29 : in std_logic_vector(BITS-1 downto 0);
		in30 : in std_logic_vector(BITS-1 downto 0);
		in31 : in std_logic_vector(BITS-1 downto 0);

		selection    : in  std_logic_vector(4 downto 0);
		output 		 : out std_logic_vector(BITS-1  downto 0));
	

end General_Mux;

architecture Behavioral of General_Mux is

begin
output <=in0 when to_integer(unsigned(selection)) = 0 else 
         in1 when to_integer(unsigned(selection)) = 1 else 
         in2 when to_integer(unsigned(selection)) = 2 else 
         in3 when to_integer(unsigned(selection)) = 3 else 
         in4 when to_integer(unsigned(selection)) = 4 else 
         in5 when to_integer(unsigned(selection)) = 5 else 
         in6 when to_integer(unsigned(selection)) = 6 else 
         in7 when to_integer(unsigned(selection)) = 7 else 
         in8 when to_integer(unsigned(selection)) = 8 else 
         in9 when to_integer(unsigned(selection)) = 9 else 
         in10 when to_integer(unsigned(selection)) = 10 else 
         in11 when to_integer(unsigned(selection)) = 11 else 
         in12 when to_integer(unsigned(selection)) = 12 else 
         in13 when to_integer(unsigned(selection)) = 13 else 
         in14 when to_integer(unsigned(selection)) = 14 else 
         in15 when to_integer(unsigned(selection)) = 15 else 
         in16 when to_integer(unsigned(selection)) = 16 else 
         in17 when to_integer(unsigned(selection)) = 17 else 
         in18 when to_integer(unsigned(selection)) = 18 else 
         in19 when to_integer(unsigned(selection)) = 19 else 
         in20 when to_integer(unsigned(selection)) = 20 else 
         in21 when to_integer(unsigned(selection)) = 21 else 
         in22 when to_integer(unsigned(selection)) = 22 else 
         in23 when to_integer(unsigned(selection)) = 23 else 
         in24 when to_integer(unsigned(selection)) = 24 else 
         in25 when to_integer(unsigned(selection)) = 25 else 
         in26 when to_integer(unsigned(selection)) = 26 else 
         in27 when to_integer(unsigned(selection)) = 27 else 
         in28 when to_integer(unsigned(selection)) = 28 else 
         in29 when to_integer(unsigned(selection)) = 29 else
         in30 when to_integer(unsigned(selection)) = 30 else
         in31 when to_integer(unsigned(selection)) = 31 ;

end Behavioral;

