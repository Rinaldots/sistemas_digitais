LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ULA_P1 IS
	PORT (
		A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		S_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		S_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --FLAG ZERO
		C_out, Z_out : OUT STD_LOGIC
	);
END ULA_P1;

ARCHITECTURE CKT OF ULA_P1 IS
	COMPONENT BLOCOFUNCOES IS --FUNCAO 1
		PORT (
			A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			S_1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --FUNCAO 1
			Cout_1 : OUT STD_LOGIC;
			S_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --FUNCAO 2 
			Cout_2 : OUT STD_LOGIC;
			S_3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --FUNCAO 3 
			Cout_3 : OUT STD_LOGIC;
			S_4 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --FUNCAO 4
			Cout_4 : OUT STD_LOGIC;
			S_5 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --FUNCAO 5
			Cout_5 : OUT STD_LOGIC;
			S_8 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --FUNCAO 8
			Cout_8 : OUT STD_LOGIC;
			S_9 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --FUNCAO 9
			S_10 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --FUNCAO 10
			S_11 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --FUNCAO 11
			S_12 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --FUNCAO 12
			S_13 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --FUNCAO 13
			S_14 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --FUNCAO 14
			S_15 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) --FUNCAO 15
		);
	END COMPONENT;

	COMPONENT BIGMUX IS
		PORT (
			I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			C0, C1, C2, C3, C4, C5, C8 : IN STD_LOGIC;
			S : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			Z : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			C : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT comparador_zero IS
		PORT (
			a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			z : OUT STD_LOGIC);
	END COMPONENT;

	SIGNAL S_1_c, S_2_c, S_3_c, S_4_c, S_5_c, S_6_c, S_7_c, S_8_c, S_9_c, S_10_c, S_11_c, S_12_c, S_13_c : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL Cout_1_c, Cout_2_c, Cout_3_c, Cout_4_c, Cout_5_c, Cout_8_c : STD_LOGIC;
	SIGNAL S_inverted : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL mux_s_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL mux_c_out : STD_LOGIC;

	
BEGIN
	S_inverted <= not S_in;
	U1 : BLOCOFUNCOES
	PORT MAP(
		A => A,
		B => B,
		S_1 => S_1_c,
		S_2 => S_2_c,
		S_3 => S_3_c,
		S_4 => S_4_c,
		S_5 => S_5_c,
		S_8 => S_6_c,
		S_9 => S_7_c,
		S_10 => S_8_c,
		S_11 => S_9_c,
		S_12 => S_10_c,
		S_13 => S_11_c,
		S_14 => S_12_c,
		S_15 => S_13_c,
		Cout_1 => Cout_1_c,
		Cout_2 => Cout_2_c,
		Cout_3 => Cout_3_c,
		Cout_4 => Cout_4_c,
		Cout_5 => Cout_5_c,
		Cout_8 => Cout_8_c
	);
	U2 : BIGMUX
	PORT MAP(
		I0 => S_1_c,
		I1 => S_2_c,
		I2 => S_3_c,
		I3 => S_4_c,
		I4 => S_5_c,
		I5 => S_6_c,
		I6 => S_7_c,
		I7 => S_8_c,
		I8 => S_9_c,
		I9 => S_10_c,
		I10 => S_11_c,
		I11 => S_12_c,
		I12 => S_13_c,
		C0 => Cout_1_c,
		C1 => Cout_2_c,
		C2 => Cout_3_c,
		C3 => Cout_4_c,
		C4 => Cout_5_c,
		C5 => Cout_8_c,
		C8 => '0',
		S => S_inverted,
		Z => mux_s_out,
		C => mux_c_out
	);

	U3 : comparador_zero
	PORT MAP(
		a => mux_s_out,
		z => Z_out
	);

	S_out <= mux_s_out;
	C_out <= mux_c_out;

END CKT;