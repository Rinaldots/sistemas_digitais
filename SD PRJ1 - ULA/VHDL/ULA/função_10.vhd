LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SWP IS
	PORT (
		A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END SWP;

ARCHITECTURE porta_swp OF SWP IS

BEGIN

	S(0) <= A(4);
	S(1) <= A(5);
	S(2) <= A(6);
	S(3) <= A(7);
	S(4) <= A(0);
	S(5) <= A(1);
	S(6) <= A(2);
	S(7) <= A(3);

END porta_swp;