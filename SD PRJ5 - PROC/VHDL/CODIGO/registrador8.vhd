LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg_8_bit IS
	port(
         ck   : in  std_logic;
         clr  : in  std_logic;
         en   : in  std_logic;
         d    : in  std_logic_vector(7 downto 0);
         q    : out std_logic_vector(7 downto 0)
      );
END reg_8_bit;

ARCHITECTURE CKT OF reg_8_bit IS

	COMPONENT mux_8_bit IS
		PORT (
			D_0, D_1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			s_in : IN STD_LOGIC;
			D_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT bit8_flip_d IS
		PORT (
			ck : IN STD_LOGIC; -- CLOCK
			enable : IN STD_LOGIC; -- ENABLE
			E : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- ENTRADA
			clr : IN STD_LOGIC; -- CLEAR
			S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- SAIDA
		);
	END COMPONENT;
	SIGNAL REG1, REG2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN

	U1 : bit8_flip_d
	PORT MAP(
		ck => ck,
		enable => '1',
		E => REG2,
		clr => clr,
		S => REG1);

	U2 : mux_8_bit
	PORT MAP(
		D_0 => REG1,
		D_1 => d,
		s_in => en,
		D_out => REG2);
		
	q <= REG1;
END CKT;
