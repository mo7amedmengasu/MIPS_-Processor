library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_File is
Port ( read_sel1 : in  std_logic_vector(4 downto 0);
           read_sel2 : in  std_logic_vector(4 downto 0);
           write_sel : in  std_logic_vector(4 downto 0);
           write_ena : in  std_logic;
           clk       : in  std_logic;
			  reset     : in  std_logic;
           write_data: in  std_logic_vector(31 downto 0);
           data1     : out std_logic_vector(31 downto 0);
           data2     : out std_logic_vector(31 downto 0) );
end Register_File;


architecture Behavioral of Register_File is

component demux is
    Port ( input : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC_VECTOR (4 downto 0));
end component;

component RegisterEntity is
    Port ( write_enable : in  STD_LOGIC;
           written_data : in  STD_LOGIC_VECTOR (31 downto 0);
           read_data : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

component RegisterZeroEntity is
    Port (
        write_enable : in  STD_LOGIC;
        written_data : in  STD_LOGIC_VECTOR(31 downto 0);
        read_data    : out STD_LOGIC_VECTOR(31 downto 0);
        clk          : in  STD_LOGIC;
        reset        : in  STD_LOGIC
    );
end component;

component General_Mux is

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
	

end component;


signal writeind :std_logic_vector(31 downto 0);
		signal reg0d :std_logic_vector(31 downto 0);
		signal reg1d :std_logic_vector(31 downto 0);
		signal reg2d :std_logic_vector(31 downto 0);
		signal reg3d :std_logic_vector(31 downto 0);
		signal reg4d :std_logic_vector(31 downto 0);
		signal reg5d :std_logic_vector(31 downto 0);
		signal reg6d :std_logic_vector(31 downto 0);
		signal reg7d :std_logic_vector(31 downto 0);
		signal reg8d :std_logic_vector(31 downto 0);
		signal reg9d :std_logic_vector(31 downto 0);
		signal reg10d :std_logic_vector(31 downto 0);
		signal reg11d :std_logic_vector(31 downto 0);
		signal reg12d :std_logic_vector(31 downto 0);
		signal reg13d :std_logic_vector(31 downto 0);
		signal reg14d :std_logic_vector(31 downto 0);
		signal reg15d :std_logic_vector(31 downto 0);
		signal reg16d :std_logic_vector(31 downto 0);
		signal reg17d :std_logic_vector(31 downto 0);
		signal reg18d :std_logic_vector(31 downto 0);
		signal reg19d :std_logic_vector(31 downto 0);
		signal reg20d :std_logic_vector(31 downto 0);
		signal reg21d :std_logic_vector(31 downto 0);
		signal reg22d :std_logic_vector(31 downto 0);
		signal reg23d :std_logic_vector(31 downto 0);
		signal reg24d :std_logic_vector(31 downto 0);
		signal reg25d :std_logic_vector(31 downto 0);
		signal reg26d :std_logic_vector(31 downto 0);
		signal reg27d :std_logic_vector(31 downto 0);
		signal reg28d :std_logic_vector(31 downto 0);
		signal reg29d :std_logic_vector(31 downto 0);
		signal reg30d :std_logic_vector(31 downto 0);
		signal reg31d :std_logic_vector(31 downto 0);
begin
	write_demux: demux port map(sel=>write_sel,input=>write_ena,output=>writeind);
   register0 :RegisterZeroEntity port map(written_data=>write_data,read_data=>reg0d,write_enable=>writeind(0),reset=>reset,clk=>clk);
	register1 :RegisterEntity port map(written_data=>write_data,read_data=>reg1d,write_enable=>writeind(1),reset=>reset,clk=>clk);
	register2 :RegisterEntity port map(written_data=>write_data,read_data=>reg2d,write_enable=>writeind(2),reset=>reset,clk=>clk);
	register3 :RegisterEntity port map(written_data=>write_data,read_data=>reg3d,write_enable=>writeind(3),reset=>reset,clk=>clk);
	register4 :RegisterEntity port map(written_data=>write_data,read_data=>reg4d,write_enable=>writeind(4),reset=>reset,clk=>clk);
	register5 :RegisterEntity port map(written_data=>write_data,read_data=>reg5d,write_enable=>writeind(5),reset=>reset,clk=>clk);
	register6 :RegisterEntity port map(written_data=>write_data,read_data=>reg6d,write_enable=>writeind(6),reset=>reset,clk=>clk);
	register7 :RegisterEntity port map(written_data=>write_data,read_data=>reg7d,write_enable=>writeind(7),reset=>reset,clk=>clk);
	register8 :RegisterEntity port map(written_data=>write_data,read_data=>reg8d,write_enable=>writeind(8),reset=>reset,clk=>clk);
	register9 :RegisterEntity port map(written_data=>write_data,read_data=>reg9d,write_enable=>writeind(9),reset=>reset,clk=>clk);
	register10 :RegisterEntity port map(written_data=>write_data,read_data=>reg10d,write_enable=>writeind(10),reset=>reset,clk=>clk);
	register11 :RegisterEntity port map(written_data=>write_data,read_data=>reg11d,write_enable=>writeind(11),reset=>reset,clk=>clk);
	register12 :RegisterEntity port map(written_data=>write_data,read_data=>reg12d,write_enable=>writeind(12),reset=>reset,clk=>clk);
	register13 :RegisterEntity port map(written_data=>write_data,read_data=>reg13d,write_enable=>writeind(13),reset=>reset,clk=>clk);
	register14 :RegisterEntity port map(written_data=>write_data,read_data=>reg14d,write_enable=>writeind(14),reset=>reset,clk=>clk);
	register15 :RegisterEntity port map(written_data=>write_data,read_data=>reg15d,write_enable=>writeind(15),reset=>reset,clk=>clk);
	register16 :RegisterEntity port map(written_data=>write_data,read_data=>reg16d,write_enable=>writeind(16),reset=>reset,clk=>clk);
	register17 :RegisterEntity port map(written_data=>write_data,read_data=>reg17d,write_enable=>writeind(17),reset=>reset,clk=>clk);
	register18 :RegisterEntity port map(written_data=>write_data,read_data=>reg18d,write_enable=>writeind(18),reset=>reset,clk=>clk);
	register19 :RegisterEntity port map(written_data=>write_data,read_data=>reg19d,write_enable=>writeind(19),reset=>reset,clk=>clk);
	register20 :RegisterEntity port map(written_data=>write_data,read_data=>reg20d,write_enable=>writeind(20),reset=>reset,clk=>clk);
	register21 :RegisterEntity port map(written_data=>write_data,read_data=>reg21d,write_enable=>writeind(21),reset=>reset,clk=>clk);
	register22 :RegisterEntity port map(written_data=>write_data,read_data=>reg22d,write_enable=>writeind(22),reset=>reset,clk=>clk);
	register23 :RegisterEntity port map(written_data=>write_data,read_data=>reg23d,write_enable=>writeind(23),reset=>reset,clk=>clk);
	register24 :RegisterEntity port map(written_data=>write_data,read_data=>reg24d,write_enable=>writeind(24),reset=>reset,clk=>clk);
	register25 :RegisterEntity port map(written_data=>write_data,read_data=>reg25d,write_enable=>writeind(25),reset=>reset,clk=>clk);
	register26 :RegisterEntity port map(written_data=>write_data,read_data=>reg26d,write_enable=>writeind(26),reset=>reset,clk=>clk);
	register27 :RegisterEntity port map(written_data=>write_data,read_data=>reg27d,write_enable=>writeind(27),reset=>reset,clk=>clk);
	register28 :RegisterEntity port map(written_data=>write_data,read_data=>reg28d,write_enable=>writeind(28),reset=>reset,clk=>clk);
	register29 :RegisterEntity port map(written_data=>write_data,read_data=>reg29d,write_enable=>writeind(29),reset=>reset,clk=>clk);
	register30 :RegisterEntity port map(written_data=>write_data,read_data=>reg30d,write_enable=>writeind(30),reset=>reset,clk=>clk);
	register31 :RegisterEntity port map(written_data=>write_data,read_data=>reg31d,write_enable=>writeind(31),reset=>reset,clk=>clk);

   read_data_mux1: General_Mux port map(
      in0=>reg0d,in1=>reg1d,in2=>reg2d,in3=>reg3d,
      in4=>reg4d,in5=>reg5d,in6=>reg6d,in7=>reg7d,
      in8=>reg8d,in9=>reg9d,in10=>reg10d,in11=>reg11d,
      in12=>reg12d,in13=>reg13d,in14=>reg14d,in15=>reg15d,
      in16=>reg16d,in17=>reg17d,in18=>reg18d,in19=>reg19d,
      in20=>reg20d,in21=>reg21d,in22=>reg22d,in23=>reg23d,
      in24=>reg24d,in25=>reg25d,in26=>reg26d,in27=>reg27d,
      in28=>reg28d,in29=>reg29d,in30=>reg30d,in31=>reg31d,
      selection=>read_sel1,output=>data1);

   read_data_mux2: General_Mux port map(
      in0=>reg0d,in1=>reg1d,in2=>reg2d,in3=>reg3d,
      in4=>reg4d,in5=>reg5d,in6=>reg6d,in7=>reg7d,
      in8=>reg8d,in9=>reg9d,in10=>reg10d,in11=>reg11d,
      in12=>reg12d,in13=>reg13d,in14=>reg14d,in15=>reg15d,
      in16=>reg16d,in17=>reg17d,in18=>reg18d,in19=>reg19d,
      in20=>reg20d,in21=>reg21d,in22=>reg22d,in23=>reg23d,
      in24=>reg24d,in25=>reg25d,in26=>reg26d,in27=>reg27d,
      in28=>reg28d,in29=>reg29d,in30=>reg30d,in31=>reg31d,
      selection=>read_sel2,output=>data2);

end Behavioral;