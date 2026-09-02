LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg_4_bit IS
	PORT (
		ck : IN STD_LOGIC;
		clr : IN STD_LOGIC;
		en : IN STD_LOGIC;
		d : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END reg_4_bit;

ARCHITECTURE CKT OF reg_4_bit IS

	COMPONENT mux_4_bit IS
		PORT (
			D_0, D_1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			s_in : IN STD_LOGIC;
			D_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT bit4_flip_d IS
		PORT (
			ck : IN STD_LOGIC;
			clr : IN STD_LOGIC;
			en : IN STD_LOGIC;
			d : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;
	SIGNAL REG1, REG2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN

	U1 : bit4_flip_d
	PORT MAP(
		ck => ck,
		en => '1',
		d => REG2,
		clr => clr,
		q => REG1);

	U2 : mux_4_bit
	PORT MAP(
		D_0 => REG1,
		D_1 => d,
		s_in => en,
		D_out => REG2);

	q <= REG1;
	
END CKT;