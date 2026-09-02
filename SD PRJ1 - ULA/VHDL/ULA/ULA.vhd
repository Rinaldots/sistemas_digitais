LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ULA IS
	PORT (
		A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		S_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		a_7, b_7, c_7, d_7, e_7, f_7, g_7 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		C_out, Z_out : OUT STD_LOGIC
	);
END ULA;

ARCHITECTURE ckt OF ULA IS

	COMPONENT ULA_P1 IS
		PORT (
			A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			S_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			S_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --FLAG ZERO
			C_out, Z_out : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT bin_7_seg IS
		PORT (
			s : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			a, b, c, d, e, f, g : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
	END COMPONENT;

	SIGNAL S_out_carry : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
	U1 : ULA_P1
	PORT MAP(
		A => A,
		B => B,
		S_in => S_in,
		S_out => S_out_carry,
		C_out => C_out,
		Z_out => Z_out
	);
	U2 : bin_7_seg
	PORT MAP(
		s => S_out_carry,
		a => a_7,
		b => b_7,
		c => c_7,
		d => d_7,
		e => e_7,
		f => f_7,
		g => g_7
	);

END ckt;