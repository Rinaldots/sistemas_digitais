LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY PORTA_AND IS
	PORT (
		A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END PORTA_AND;

ARCHITECTURE porta_and OF PORTA_AND IS

BEGIN

	S(0) <= A(0) AND B(0);
	S(1) <= A(1) AND B(1);
	S(2) <= A(2) AND B(2);
	S(3) <= A(3) AND B(3);
	S(4) <= A(4) AND B(4);
	S(5) <= A(5) AND B(5);
	S(6) <= A(6) AND B(6);
	S(7) <= A(7) AND B(7);

END porta_and;