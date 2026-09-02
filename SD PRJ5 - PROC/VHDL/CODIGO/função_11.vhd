LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SWA IS
	PORT (
		A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END SWA;

ARCHITECTURE porta_swa OF SWA IS

BEGIN

	S(0) <= A(7);
	S(1) <= A(6);
	S(2) <= A(5);
	S(3) <= A(4);
	S(4) <= A(3);
	S(5) <= A(2);
	S(6) <= A(1);
	S(7) <= A(0);

END porta_swa;