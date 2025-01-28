----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:07:59 12/17/2024 
-- Design Name: 
-- Module Name:    data_path - Behavioral 
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
use work.data_path_package.ALL;

entity datapath is
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
end datapath;

architecture Behavioral of datapath is
    -- Signal declarations
	 signal pc_internal : STD_LOGIC_VECTOR(31 downto 0);
    signal writereg     : STD_LOGIC_VECTOR(4 downto 0);
    signal pcjump, pcnext, pcnextbr, pcplus4, pcbranch : STD_LOGIC_VECTOR(31 downto 0);
    signal signimm, signimmsh : STD_LOGIC_VECTOR(31 downto 0);
   -- signal srca, srcb, result : STD_LOGIC_VECTOR(31 downto 0);
    signal regdst_out_signal  : STD_LOGIC_VECTOR(4 downto 0);
    signal memtoreg_out_signal: STD_LOGIC_VECTOR(31 downto 0);
    signal alu_data1_out      : STD_LOGIC_VECTOR(31 downto 0);
    signal alu_data2_out      : STD_LOGIC_VECTOR(31 downto 0);
    signal alusrc_mux_out     : STD_LOGIC_VECTOR(31 downto 0); 
 	 signal main_aluout_signal : STD_LOGIC_VECTOR(31 downto 0);
    signal alu_z_flag         : STD_LOGIC;	 
begin
    -- MUX and adder logic for the program counter (PC)
    pcjump <= pcplus4(31 downto 28) & instr(25 downto 0) & "00";
    
    -- Register for storing the program counter (PC)
    pcreg: flopr generic map(32) port map(clk, reset, pcnext, pc_internal);
    
    -- Adder to calculate the next PC (PC + 4)
    pcadd1: adder port map(pc_internal, X"00000004", pcplus4);
    
    -- Shift left operation for the immediate value (sign-extended)
    immsh: sl2 port map(signimm, signimmsh);
    
    -- Adder for calculating the branch address (PC + branch offset)
    pcadd2: adder port map(pcplus4, signimmsh, pcbranch);
    
    -- MUX to select between the PC + 4 or the branch target
    pcbrmux: Mux2 generic map(32) port map(pcplus4, pcbranch, pcsrc, pcnextbr);
    
    -- MUX to select between the branch target or the jump target
    pcmux: Mux2 generic map(32) port map(pcnextbr, pcjump, jump, pcnext);
	 
    regdst_mux: Mux2 generic map(5) 
        port map (
            I0 => instr(20 downto 16),
            I1 => instr(15 downto 11),
            S  => regdst,
            Y  => regdst_out_signal
        );
    rf_instance: Register_File 
        port map (
            read_sel1  => instr(25 downto 21),
            read_sel2  => instr(20 downto 16),
            write_sel  => regdst_out_signal,
            write_ena  => regwrite,
            clk        => clk,
				reset      => reset,
            write_data => memtoreg_out_signal,
            data1      => alu_data1_out,
            data2      => alu_data2_out
        );
    s_extend: signext 
        port map (
            a => instr(15 downto 0),
            y => signimm
        );
    alusrc_mux: Mux2 generic map(32)
        port map (
            I0 => alu_data2_out,
            I1 => signimm,--sign_extend_out,
            S  => alusrc,
            Y  => alusrc_mux_out
        );
    main_alu: alu 
        port map (
            data11  => alu_data1_out,
            data22  => alusrc_mux_out,
            aluop   => alucontrol,
            dataout => main_aluout_signal,
            zflag   => alu_z_flag
        );
	 
    memtoreg_mux: Mux2 generic map(32)
        port map (
            I0 => main_aluout_signal,
            I1 => readdata,
            S  => memtoreg,
            Y  => memtoreg_out_signal
        );
		  
			pc<= pc_internal;
			zero <= alu_z_flag;
			aluout<= main_aluout_signal;
			writedata <= alu_data2_out;
			
end Behavioral;