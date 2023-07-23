-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "07/23/2023 16:28:33"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          AudioMonitor
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY AudioMonitor_vhd_vec_tst IS
END AudioMonitor_vhd_vec_tst;
ARCHITECTURE AudioMonitor_arch OF AudioMonitor_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL AUD_DATA : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL AUD_NEW : STD_LOGIC;
SIGNAL AVERAGE_S : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL CS : STD_LOGIC;
SIGNAL IO_DATA : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL IO_WRITE : STD_LOGIC;
SIGNAL RESETN : STD_LOGIC;
SIGNAL SYS_CLK : STD_LOGIC;
SIGNAL window_sum1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL window_sum2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT AudioMonitor
	PORT (
	AUD_DATA : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	AUD_NEW : IN STD_LOGIC;
	AVERAGE_S : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	CS : IN STD_LOGIC;
	IO_DATA : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	IO_WRITE : IN STD_LOGIC;
	RESETN : IN STD_LOGIC;
	SYS_CLK : IN STD_LOGIC;
	window_sum1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	window_sum2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : AudioMonitor
	PORT MAP (
-- list connections between master ports and signals
	AUD_DATA => AUD_DATA,
	AUD_NEW => AUD_NEW,
	AVERAGE_S => AVERAGE_S,
	CS => CS,
	IO_DATA => IO_DATA,
	IO_WRITE => IO_WRITE,
	RESETN => RESETN,
	SYS_CLK => SYS_CLK,
	window_sum1 => window_sum1,
	window_sum2 => window_sum2
	);

-- SYS_CLK
t_prcs_SYS_CLK: PROCESS
BEGIN
LOOP
	SYS_CLK <= '0';
	WAIT FOR 5000 ps;
	SYS_CLK <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SYS_CLK;
-- AUD_DATA[15]
t_prcs_AUD_DATA_15: PROCESS
BEGIN
	AUD_DATA(15) <= '0';
	WAIT FOR 20000 ps;
	AUD_DATA(15) <= '1';
	WAIT FOR 160000 ps;
	AUD_DATA(15) <= '0';
WAIT;
END PROCESS t_prcs_AUD_DATA_15;
-- AUD_DATA[14]
t_prcs_AUD_DATA_14: PROCESS
BEGIN
	AUD_DATA(14) <= '0';
	WAIT FOR 20000 ps;
	AUD_DATA(14) <= '1';
	WAIT FOR 160000 ps;
	AUD_DATA(14) <= '0';
WAIT;
END PROCESS t_prcs_AUD_DATA_14;
-- AUD_DATA[13]
t_prcs_AUD_DATA_13: PROCESS
BEGIN
	AUD_DATA(13) <= '0';
	WAIT FOR 20000 ps;
	AUD_DATA(13) <= '1';
	WAIT FOR 160000 ps;
	AUD_DATA(13) <= '0';
WAIT;
END PROCESS t_prcs_AUD_DATA_13;
-- AUD_DATA[12]
t_prcs_AUD_DATA_12: PROCESS
BEGIN
	AUD_DATA(12) <= '0';
	WAIT FOR 20000 ps;
	AUD_DATA(12) <= '1';
	WAIT FOR 160000 ps;
	AUD_DATA(12) <= '0';
WAIT;
END PROCESS t_prcs_AUD_DATA_12;
-- AUD_DATA[11]
t_prcs_AUD_DATA_11: PROCESS
BEGIN
	AUD_DATA(11) <= '0';
	WAIT FOR 20000 ps;
	AUD_DATA(11) <= '1';
	WAIT FOR 160000 ps;
	AUD_DATA(11) <= '0';
WAIT;
END PROCESS t_prcs_AUD_DATA_11;
-- AUD_DATA[10]
t_prcs_AUD_DATA_10: PROCESS
BEGIN
	AUD_DATA(10) <= '0';
	WAIT FOR 20000 ps;
	AUD_DATA(10) <= '1';
	WAIT FOR 160000 ps;
	AUD_DATA(10) <= '0';
WAIT;
END PROCESS t_prcs_AUD_DATA_10;
-- AUD_DATA[9]
t_prcs_AUD_DATA_9: PROCESS
BEGIN
	AUD_DATA(9) <= '0';
	WAIT FOR 20000 ps;
	AUD_DATA(9) <= '1';
	WAIT FOR 160000 ps;
	AUD_DATA(9) <= '0';
WAIT;
END PROCESS t_prcs_AUD_DATA_9;
-- AUD_DATA[8]
t_prcs_AUD_DATA_8: PROCESS
BEGIN
	AUD_DATA(8) <= '0';
	WAIT FOR 20000 ps;
	AUD_DATA(8) <= '1';
	WAIT FOR 160000 ps;
	AUD_DATA(8) <= '0';
WAIT;
END PROCESS t_prcs_AUD_DATA_8;
-- AUD_DATA[7]
t_prcs_AUD_DATA_7: PROCESS
BEGIN
	AUD_DATA(7) <= '0';
	WAIT FOR 20000 ps;
	AUD_DATA(7) <= '1';
	WAIT FOR 160000 ps;
	AUD_DATA(7) <= '0';
WAIT;
END PROCESS t_prcs_AUD_DATA_7;
-- AUD_DATA[6]
t_prcs_AUD_DATA_6: PROCESS
BEGIN
	AUD_DATA(6) <= '0';
	WAIT FOR 20000 ps;
	AUD_DATA(6) <= '1';
	WAIT FOR 160000 ps;
	AUD_DATA(6) <= '0';
WAIT;
END PROCESS t_prcs_AUD_DATA_6;
-- AUD_DATA[5]
t_prcs_AUD_DATA_5: PROCESS
BEGIN
	AUD_DATA(5) <= '0';
	WAIT FOR 20000 ps;
	AUD_DATA(5) <= '1';
	WAIT FOR 160000 ps;
	AUD_DATA(5) <= '0';
WAIT;
END PROCESS t_prcs_AUD_DATA_5;
-- AUD_DATA[4]
t_prcs_AUD_DATA_4: PROCESS
BEGIN
	AUD_DATA(4) <= '0';
	WAIT FOR 20000 ps;
	AUD_DATA(4) <= '1';
	WAIT FOR 160000 ps;
	AUD_DATA(4) <= '0';
WAIT;
END PROCESS t_prcs_AUD_DATA_4;
-- AUD_DATA[3]
t_prcs_AUD_DATA_3: PROCESS
BEGIN
	AUD_DATA(3) <= '0';
	WAIT FOR 20000 ps;
	AUD_DATA(3) <= '1';
	WAIT FOR 160000 ps;
	AUD_DATA(3) <= '0';
WAIT;
END PROCESS t_prcs_AUD_DATA_3;
-- AUD_DATA[2]
t_prcs_AUD_DATA_2: PROCESS
BEGIN
	AUD_DATA(2) <= '0';
	WAIT FOR 20000 ps;
	AUD_DATA(2) <= '1';
	WAIT FOR 160000 ps;
	AUD_DATA(2) <= '0';
	WAIT FOR 160000 ps;
	AUD_DATA(2) <= '1';
	WAIT FOR 80000 ps;
	AUD_DATA(2) <= '0';
WAIT;
END PROCESS t_prcs_AUD_DATA_2;
-- AUD_DATA[1]
t_prcs_AUD_DATA_1: PROCESS
BEGIN
	AUD_DATA(1) <= '0';
	WAIT FOR 100000 ps;
	AUD_DATA(1) <= '1';
	WAIT FOR 80000 ps;
	AUD_DATA(1) <= '0';
	WAIT FOR 80000 ps;
	AUD_DATA(1) <= '1';
	WAIT FOR 80000 ps;
	AUD_DATA(1) <= '0';
WAIT;
END PROCESS t_prcs_AUD_DATA_1;
-- AUD_DATA[0]
t_prcs_AUD_DATA_0: PROCESS
BEGIN
	AUD_DATA(0) <= '0';
	WAIT FOR 60000 ps;
	AUD_DATA(0) <= '1';
	WAIT FOR 40000 ps;
	AUD_DATA(0) <= '0';
	WAIT FOR 40000 ps;
	AUD_DATA(0) <= '1';
	WAIT FOR 40000 ps;
	FOR i IN 1 TO 3
	LOOP
		AUD_DATA(0) <= '0';
		WAIT FOR 40000 ps;
		AUD_DATA(0) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	AUD_DATA(0) <= '0';
WAIT;
END PROCESS t_prcs_AUD_DATA_0;

-- RESETN
t_prcs_RESETN: PROCESS
BEGIN
	RESETN <= '0';
	WAIT FOR 30000 ps;
	RESETN <= '1';
WAIT;
END PROCESS t_prcs_RESETN;

-- CS
t_prcs_CS: PROCESS
BEGIN
	CS <= '1';
WAIT;
END PROCESS t_prcs_CS;

-- AUD_NEW
t_prcs_AUD_NEW: PROCESS
BEGIN
LOOP
	AUD_NEW <= '0';
	WAIT FOR 20000 ps;
	AUD_NEW <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_AUD_NEW;

-- IO_WRITE
t_prcs_IO_WRITE: PROCESS
BEGIN
	IO_WRITE <= '0';
WAIT;
END PROCESS t_prcs_IO_WRITE;
-- IO_DATA[15]
t_prcs_IO_DATA_15: PROCESS
BEGIN
	IO_DATA(15) <= 'Z';
WAIT;
END PROCESS t_prcs_IO_DATA_15;
-- IO_DATA[14]
t_prcs_IO_DATA_14: PROCESS
BEGIN
	IO_DATA(14) <= 'Z';
WAIT;
END PROCESS t_prcs_IO_DATA_14;
-- IO_DATA[13]
t_prcs_IO_DATA_13: PROCESS
BEGIN
	IO_DATA(13) <= 'Z';
WAIT;
END PROCESS t_prcs_IO_DATA_13;
-- IO_DATA[12]
t_prcs_IO_DATA_12: PROCESS
BEGIN
	IO_DATA(12) <= 'Z';
WAIT;
END PROCESS t_prcs_IO_DATA_12;
-- IO_DATA[11]
t_prcs_IO_DATA_11: PROCESS
BEGIN
	IO_DATA(11) <= 'Z';
WAIT;
END PROCESS t_prcs_IO_DATA_11;
-- IO_DATA[10]
t_prcs_IO_DATA_10: PROCESS
BEGIN
	IO_DATA(10) <= 'Z';
WAIT;
END PROCESS t_prcs_IO_DATA_10;
-- IO_DATA[9]
t_prcs_IO_DATA_9: PROCESS
BEGIN
	IO_DATA(9) <= 'Z';
WAIT;
END PROCESS t_prcs_IO_DATA_9;
-- IO_DATA[8]
t_prcs_IO_DATA_8: PROCESS
BEGIN
	IO_DATA(8) <= 'Z';
WAIT;
END PROCESS t_prcs_IO_DATA_8;
-- IO_DATA[7]
t_prcs_IO_DATA_7: PROCESS
BEGIN
	IO_DATA(7) <= 'Z';
WAIT;
END PROCESS t_prcs_IO_DATA_7;
-- IO_DATA[6]
t_prcs_IO_DATA_6: PROCESS
BEGIN
	IO_DATA(6) <= 'Z';
WAIT;
END PROCESS t_prcs_IO_DATA_6;
-- IO_DATA[5]
t_prcs_IO_DATA_5: PROCESS
BEGIN
	IO_DATA(5) <= 'Z';
WAIT;
END PROCESS t_prcs_IO_DATA_5;
-- IO_DATA[4]
t_prcs_IO_DATA_4: PROCESS
BEGIN
	IO_DATA(4) <= 'Z';
WAIT;
END PROCESS t_prcs_IO_DATA_4;
-- IO_DATA[3]
t_prcs_IO_DATA_3: PROCESS
BEGIN
	IO_DATA(3) <= 'Z';
WAIT;
END PROCESS t_prcs_IO_DATA_3;
-- IO_DATA[2]
t_prcs_IO_DATA_2: PROCESS
BEGIN
	IO_DATA(2) <= 'Z';
WAIT;
END PROCESS t_prcs_IO_DATA_2;
-- IO_DATA[1]
t_prcs_IO_DATA_1: PROCESS
BEGIN
	IO_DATA(1) <= 'Z';
WAIT;
END PROCESS t_prcs_IO_DATA_1;
-- IO_DATA[0]
t_prcs_IO_DATA_0: PROCESS
BEGIN
	IO_DATA(0) <= 'Z';
WAIT;
END PROCESS t_prcs_IO_DATA_0;
END AudioMonitor_arch;
