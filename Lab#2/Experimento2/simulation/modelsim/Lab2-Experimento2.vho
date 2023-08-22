-- Copyright (C) 2023  Intel Corporation. All rights reserved.
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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 22.1std.1 Build 917 02/14/2023 SC Lite Edition"

-- DATE "08/21/2023 21:21:51"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	FourBitFullAdder IS
    PORT (
	bitA : IN std_logic_vector(3 DOWNTO 0);
	bitB : IN std_logic_vector(3 DOWNTO 0);
	cin : IN std_logic;
	sum4bits : BUFFER std_logic_vector(6 DOWNTO 0);
	cout : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END FourBitFullAdder;

-- Design Ports Information
-- sum4bits[0]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum4bits[1]	=>  Location: PIN_V23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum4bits[2]	=>  Location: PIN_W24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum4bits[3]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum4bits[4]	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum4bits[5]	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum4bits[6]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cout[0]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cout[1]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cout[2]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cout[3]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cout[4]	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cout[5]	=>  Location: PIN_AA28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cout[6]	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitA[0]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitB[0]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cin	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitA[1]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitB[1]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitA[2]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitB[2]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitA[3]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitB[3]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF FourBitFullAdder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_bitA : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_bitB : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_cin : std_logic;
SIGNAL ww_sum4bits : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_cout : std_logic_vector(6 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \bitB[2]~input_o\ : std_logic;
SIGNAL \bitA[2]~input_o\ : std_logic;
SIGNAL \bitA[1]~input_o\ : std_logic;
SIGNAL \cin~input_o\ : std_logic;
SIGNAL \bitB[0]~input_o\ : std_logic;
SIGNAL \bitA[0]~input_o\ : std_logic;
SIGNAL \bitB[1]~input_o\ : std_logic;
SIGNAL \S1|suma~combout\ : std_logic;
SIGNAL \S2|cout~combout\ : std_logic;
SIGNAL \S0|cout~combout\ : std_logic;
SIGNAL \S1|cout~combout\ : std_logic;
SIGNAL \bitA[3]~input_o\ : std_logic;
SIGNAL \bitB[3]~input_o\ : std_logic;
SIGNAL \S3|cout~combout\ : std_logic;
SIGNAL \conv0|Mux6~0_combout\ : std_logic;
SIGNAL \conv0|Mux5~0_combout\ : std_logic;
SIGNAL \conv0|Mux4~0_combout\ : std_logic;
SIGNAL \conv0|Mux3~0_combout\ : std_logic;
SIGNAL \conv0|Mux2~0_combout\ : std_logic;
SIGNAL \conv0|Mux1~0_combout\ : std_logic;
SIGNAL \conv0|Mux0~0_combout\ : std_logic;
SIGNAL \S3|suma~combout\ : std_logic;
SIGNAL \ALT_INV_bitB[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_cin~input_o\ : std_logic;
SIGNAL \ALT_INV_bitA[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_bitB[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_bitA[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_bitA[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_bitB[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_bitB[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_bitA[0]~input_o\ : std_logic;
SIGNAL \conv0|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \S3|ALT_INV_cout~combout\ : std_logic;
SIGNAL \S2|ALT_INV_cout~combout\ : std_logic;
SIGNAL \S1|ALT_INV_suma~combout\ : std_logic;
SIGNAL \S1|ALT_INV_cout~combout\ : std_logic;
SIGNAL \S0|ALT_INV_cout~combout\ : std_logic;

BEGIN

ww_bitA <= bitA;
ww_bitB <= bitB;
ww_cin <= cin;
sum4bits <= ww_sum4bits;
cout <= ww_cout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_bitB[0]~input_o\ <= NOT \bitB[0]~input_o\;
\ALT_INV_cin~input_o\ <= NOT \cin~input_o\;
\ALT_INV_bitA[1]~input_o\ <= NOT \bitA[1]~input_o\;
\ALT_INV_bitB[1]~input_o\ <= NOT \bitB[1]~input_o\;
\ALT_INV_bitA[2]~input_o\ <= NOT \bitA[2]~input_o\;
\ALT_INV_bitA[3]~input_o\ <= NOT \bitA[3]~input_o\;
\ALT_INV_bitB[2]~input_o\ <= NOT \bitB[2]~input_o\;
\ALT_INV_bitB[3]~input_o\ <= NOT \bitB[3]~input_o\;
\ALT_INV_bitA[0]~input_o\ <= NOT \bitA[0]~input_o\;
\conv0|ALT_INV_Mux6~0_combout\ <= NOT \conv0|Mux6~0_combout\;
\S3|ALT_INV_cout~combout\ <= NOT \S3|cout~combout\;
\S2|ALT_INV_cout~combout\ <= NOT \S2|cout~combout\;
\S1|ALT_INV_suma~combout\ <= NOT \S1|suma~combout\;
\S1|ALT_INV_cout~combout\ <= NOT \S1|cout~combout\;
\S0|ALT_INV_cout~combout\ <= NOT \S0|cout~combout\;

-- Location: IOOBUF_X89_Y20_N45
\sum4bits[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \conv0|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_sum4bits(0));

-- Location: IOOBUF_X89_Y15_N5
\sum4bits[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \conv0|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_sum4bits(1));

-- Location: IOOBUF_X89_Y15_N22
\sum4bits[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \conv0|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_sum4bits(2));

-- Location: IOOBUF_X89_Y8_N22
\sum4bits[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \conv0|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_sum4bits(3));

-- Location: IOOBUF_X89_Y13_N22
\sum4bits[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \conv0|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_sum4bits(4));

-- Location: IOOBUF_X89_Y13_N5
\sum4bits[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \conv0|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_sum4bits(5));

-- Location: IOOBUF_X89_Y11_N45
\sum4bits[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \conv0|Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_sum4bits(6));

-- Location: IOOBUF_X89_Y9_N39
\cout[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_cout(0));

-- Location: IOOBUF_X89_Y23_N5
\cout[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \S3|suma~combout\,
	devoe => ww_devoe,
	o => ww_cout(1));

-- Location: IOOBUF_X89_Y9_N56
\cout[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \S3|suma~combout\,
	devoe => ww_devoe,
	o => ww_cout(2));

-- Location: IOOBUF_X89_Y23_N22
\cout[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \S3|suma~combout\,
	devoe => ww_devoe,
	o => ww_cout(3));

-- Location: IOOBUF_X89_Y25_N22
\cout[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_cout(4));

-- Location: IOOBUF_X89_Y21_N56
\cout[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_cout(5));

-- Location: IOOBUF_X89_Y20_N62
\cout[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \S3|suma~combout\,
	devoe => ww_devoe,
	o => ww_cout(6));

-- Location: IOIBUF_X4_Y0_N52
\bitB[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitB(2),
	o => \bitB[2]~input_o\);

-- Location: IOIBUF_X2_Y0_N41
\bitA[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitA(2),
	o => \bitA[2]~input_o\);

-- Location: IOIBUF_X4_Y0_N35
\bitA[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitA(1),
	o => \bitA[1]~input_o\);

-- Location: IOIBUF_X2_Y0_N58
\cin~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cin,
	o => \cin~input_o\);

-- Location: IOIBUF_X4_Y0_N1
\bitB[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitB(0),
	o => \bitB[0]~input_o\);

-- Location: IOIBUF_X4_Y0_N18
\bitA[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitA(0),
	o => \bitA[0]~input_o\);

-- Location: IOIBUF_X16_Y0_N18
\bitB[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitB(1),
	o => \bitB[1]~input_o\);

-- Location: LABCELL_X19_Y2_N42
\S1|suma\ : cyclonev_lcell_comb
-- Equation(s):
-- \S1|suma~combout\ = ( \bitA[0]~input_o\ & ( \bitB[1]~input_o\ & ( !\bitA[1]~input_o\ $ (!\cin~input_o\ $ (\bitB[0]~input_o\)) ) ) ) # ( !\bitA[0]~input_o\ & ( \bitB[1]~input_o\ & ( !\bitA[1]~input_o\ $ (!\cin~input_o\ $ (!\bitB[0]~input_o\)) ) ) ) # ( 
-- \bitA[0]~input_o\ & ( !\bitB[1]~input_o\ & ( !\bitA[1]~input_o\ $ (!\cin~input_o\ $ (!\bitB[0]~input_o\)) ) ) ) # ( !\bitA[0]~input_o\ & ( !\bitB[1]~input_o\ & ( !\bitA[1]~input_o\ $ (!\cin~input_o\ $ (\bitB[0]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001100101101001011010010110100101100110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_bitA[1]~input_o\,
	datab => \ALT_INV_cin~input_o\,
	datac => \ALT_INV_bitB[0]~input_o\,
	datae => \ALT_INV_bitA[0]~input_o\,
	dataf => \ALT_INV_bitB[1]~input_o\,
	combout => \S1|suma~combout\);

-- Location: LABCELL_X19_Y2_N21
\S2|cout\ : cyclonev_lcell_comb
-- Equation(s):
-- \S2|cout~combout\ = ( \S1|suma~combout\ & ( (\bitA[2]~input_o\) # (\bitB[2]~input_o\) ) ) # ( !\S1|suma~combout\ & ( (\bitB[2]~input_o\ & \bitA[2]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001100111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_bitB[2]~input_o\,
	datac => \ALT_INV_bitA[2]~input_o\,
	dataf => \S1|ALT_INV_suma~combout\,
	combout => \S2|cout~combout\);

-- Location: LABCELL_X19_Y2_N30
\S0|cout\ : cyclonev_lcell_comb
-- Equation(s):
-- \S0|cout~combout\ = ( \bitA[0]~input_o\ & ( \bitB[0]~input_o\ ) ) # ( !\bitA[0]~input_o\ & ( \bitB[0]~input_o\ & ( \cin~input_o\ ) ) ) # ( \bitA[0]~input_o\ & ( !\bitB[0]~input_o\ & ( \cin~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100110011001100111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_cin~input_o\,
	datae => \ALT_INV_bitA[0]~input_o\,
	dataf => \ALT_INV_bitB[0]~input_o\,
	combout => \S0|cout~combout\);

-- Location: LABCELL_X19_Y2_N9
\S1|cout\ : cyclonev_lcell_comb
-- Equation(s):
-- \S1|cout~combout\ = ( \bitA[0]~input_o\ & ( \bitB[1]~input_o\ & ( (!\bitB[0]~input_o\ $ (\cin~input_o\)) # (\bitA[1]~input_o\) ) ) ) # ( !\bitA[0]~input_o\ & ( \bitB[1]~input_o\ & ( (!\bitB[0]~input_o\ $ (!\cin~input_o\)) # (\bitA[1]~input_o\) ) ) ) # ( 
-- \bitA[0]~input_o\ & ( !\bitB[1]~input_o\ & ( (\bitA[1]~input_o\ & (!\bitB[0]~input_o\ $ (\cin~input_o\))) ) ) ) # ( !\bitA[0]~input_o\ & ( !\bitB[1]~input_o\ & ( (\bitA[1]~input_o\ & (!\bitB[0]~input_o\ $ (!\cin~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001011010000000001010010101011010111111111010010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_bitB[0]~input_o\,
	datac => \ALT_INV_cin~input_o\,
	datad => \ALT_INV_bitA[1]~input_o\,
	datae => \ALT_INV_bitA[0]~input_o\,
	dataf => \ALT_INV_bitB[1]~input_o\,
	combout => \S1|cout~combout\);

-- Location: IOIBUF_X8_Y0_N35
\bitA[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitA(3),
	o => \bitA[3]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\bitB[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitB(3),
	o => \bitB[3]~input_o\);

-- Location: LABCELL_X19_Y2_N24
\S3|cout\ : cyclonev_lcell_comb
-- Equation(s):
-- \S3|cout~combout\ = ( \bitA[2]~input_o\ & ( \S1|suma~combout\ & ( (!\bitA[3]~input_o\ & (\bitB[3]~input_o\ & \bitB[2]~input_o\)) # (\bitA[3]~input_o\ & ((\bitB[2]~input_o\) # (\bitB[3]~input_o\))) ) ) ) # ( !\bitA[2]~input_o\ & ( \S1|suma~combout\ & ( 
-- (!\bitA[3]~input_o\ & (\bitB[3]~input_o\ & !\bitB[2]~input_o\)) # (\bitA[3]~input_o\ & ((!\bitB[2]~input_o\) # (\bitB[3]~input_o\))) ) ) ) # ( \bitA[2]~input_o\ & ( !\S1|suma~combout\ & ( (!\bitA[3]~input_o\ & (\bitB[3]~input_o\ & !\bitB[2]~input_o\)) # 
-- (\bitA[3]~input_o\ & ((!\bitB[2]~input_o\) # (\bitB[3]~input_o\))) ) ) ) # ( !\bitA[2]~input_o\ & ( !\S1|suma~combout\ & ( (!\bitA[3]~input_o\ & (\bitB[3]~input_o\ & \bitB[2]~input_o\)) # (\bitA[3]~input_o\ & ((\bitB[2]~input_o\) # (\bitB[3]~input_o\))) ) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100111111001111110000001100111111000000110000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_bitA[3]~input_o\,
	datac => \ALT_INV_bitB[3]~input_o\,
	datad => \ALT_INV_bitB[2]~input_o\,
	datae => \ALT_INV_bitA[2]~input_o\,
	dataf => \S1|ALT_INV_suma~combout\,
	combout => \S3|cout~combout\);

-- Location: LABCELL_X19_Y2_N0
\conv0|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv0|Mux6~0_combout\ = ( \S3|cout~combout\ & ( (!\S2|cout~combout\) # ((\S1|cout~combout\) # (\S0|cout~combout\)) ) ) # ( !\S3|cout~combout\ & ( (!\S2|cout~combout\ & ((\S1|cout~combout\))) # (\S2|cout~combout\ & ((!\S0|cout~combout\) # 
-- (!\S1|cout~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111001011110010111100101111010111111101111111011111110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \S2|ALT_INV_cout~combout\,
	datab => \S0|ALT_INV_cout~combout\,
	datac => \S1|ALT_INV_cout~combout\,
	dataf => \S3|ALT_INV_cout~combout\,
	combout => \conv0|Mux6~0_combout\);

-- Location: LABCELL_X19_Y2_N36
\conv0|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv0|Mux5~0_combout\ = ( \S3|cout~combout\ & ( (\S2|cout~combout\ & (\S0|cout~combout\ & !\S1|cout~combout\)) ) ) # ( !\S3|cout~combout\ & ( (!\S2|cout~combout\ & ((\S1|cout~combout\) # (\S0|cout~combout\))) # (\S2|cout~combout\ & (\S0|cout~combout\ & 
-- \S1|cout~combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101100101011001010110010101100010000000100000001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \S2|ALT_INV_cout~combout\,
	datab => \S0|ALT_INV_cout~combout\,
	datac => \S1|ALT_INV_cout~combout\,
	dataf => \S3|ALT_INV_cout~combout\,
	combout => \conv0|Mux5~0_combout\);

-- Location: LABCELL_X19_Y2_N39
\conv0|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv0|Mux4~0_combout\ = ( \S3|cout~combout\ & ( (!\S2|cout~combout\ & (\S0|cout~combout\ & !\S1|cout~combout\)) ) ) # ( !\S3|cout~combout\ & ( ((\S2|cout~combout\ & !\S1|cout~combout\)) # (\S0|cout~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111001101110011011100110111001100100000001000000010000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \S2|ALT_INV_cout~combout\,
	datab => \S0|ALT_INV_cout~combout\,
	datac => \S1|ALT_INV_cout~combout\,
	dataf => \S3|ALT_INV_cout~combout\,
	combout => \conv0|Mux4~0_combout\);

-- Location: LABCELL_X19_Y2_N3
\conv0|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv0|Mux3~0_combout\ = ( \S3|cout~combout\ & ( (\S1|cout~combout\ & (!\S2|cout~combout\ $ (\S0|cout~combout\))) ) ) # ( !\S3|cout~combout\ & ( (!\S2|cout~combout\ & (\S0|cout~combout\ & !\S1|cout~combout\)) # (\S2|cout~combout\ & (!\S0|cout~combout\ $ 
-- (\S1|cout~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101000000101010110100000010100000000101001010000000010100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \S2|ALT_INV_cout~combout\,
	datac => \S0|ALT_INV_cout~combout\,
	datad => \S1|ALT_INV_cout~combout\,
	dataf => \S3|ALT_INV_cout~combout\,
	combout => \conv0|Mux3~0_combout\);

-- Location: LABCELL_X19_Y2_N12
\conv0|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv0|Mux2~0_combout\ = ( \S3|cout~combout\ & ( (\S2|cout~combout\ & ((!\S0|cout~combout\) # (\S1|cout~combout\))) ) ) # ( !\S3|cout~combout\ & ( (!\S2|cout~combout\ & (!\S0|cout~combout\ & \S1|cout~combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000001000000010000000100001000101010001010100010101000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \S2|ALT_INV_cout~combout\,
	datab => \S0|ALT_INV_cout~combout\,
	datac => \S1|ALT_INV_cout~combout\,
	dataf => \S3|ALT_INV_cout~combout\,
	combout => \conv0|Mux2~0_combout\);

-- Location: LABCELL_X19_Y2_N15
\conv0|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv0|Mux1~0_combout\ = ( \S3|cout~combout\ & ( (!\S0|cout~combout\ & (\S2|cout~combout\)) # (\S0|cout~combout\ & ((\S1|cout~combout\))) ) ) # ( !\S3|cout~combout\ & ( (\S2|cout~combout\ & (!\S0|cout~combout\ $ (!\S1|cout~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010000010100000101000001010001000111010001110100011101000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \S2|ALT_INV_cout~combout\,
	datab => \S0|ALT_INV_cout~combout\,
	datac => \S1|ALT_INV_cout~combout\,
	dataf => \S3|ALT_INV_cout~combout\,
	combout => \conv0|Mux1~0_combout\);

-- Location: LABCELL_X19_Y2_N48
\conv0|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv0|Mux0~0_combout\ = ( \S2|cout~combout\ & ( \S3|cout~combout\ & ( (!\S1|cout~combout\ & \S0|cout~combout\) ) ) ) # ( !\S2|cout~combout\ & ( \S3|cout~combout\ & ( (\S1|cout~combout\ & \S0|cout~combout\) ) ) ) # ( \S2|cout~combout\ & ( 
-- !\S3|cout~combout\ & ( (!\S1|cout~combout\ & !\S0|cout~combout\) ) ) ) # ( !\S2|cout~combout\ & ( !\S3|cout~combout\ & ( (!\S1|cout~combout\ & \S0|cout~combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100110011000000000000000000001100110000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \S1|ALT_INV_cout~combout\,
	datad => \S0|ALT_INV_cout~combout\,
	datae => \S2|ALT_INV_cout~combout\,
	dataf => \S3|ALT_INV_cout~combout\,
	combout => \conv0|Mux0~0_combout\);

-- Location: LABCELL_X19_Y2_N57
\S3|suma\ : cyclonev_lcell_comb
-- Equation(s):
-- \S3|suma~combout\ = ( \bitA[2]~input_o\ & ( \S1|suma~combout\ & ( !\bitB[3]~input_o\ $ (!\bitB[2]~input_o\ $ (\bitA[3]~input_o\)) ) ) ) # ( !\bitA[2]~input_o\ & ( \S1|suma~combout\ & ( !\bitB[3]~input_o\ $ (!\bitB[2]~input_o\ $ (!\bitA[3]~input_o\)) ) ) ) 
-- # ( \bitA[2]~input_o\ & ( !\S1|suma~combout\ & ( !\bitB[3]~input_o\ $ (!\bitB[2]~input_o\ $ (!\bitA[3]~input_o\)) ) ) ) # ( !\bitA[2]~input_o\ & ( !\S1|suma~combout\ & ( !\bitB[3]~input_o\ $ (!\bitB[2]~input_o\ $ (\bitA[3]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001100101101001011010010110100101100110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_bitB[3]~input_o\,
	datab => \ALT_INV_bitB[2]~input_o\,
	datac => \ALT_INV_bitA[3]~input_o\,
	datae => \ALT_INV_bitA[2]~input_o\,
	dataf => \S1|ALT_INV_suma~combout\,
	combout => \S3|suma~combout\);

-- Location: LABCELL_X22_Y39_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


