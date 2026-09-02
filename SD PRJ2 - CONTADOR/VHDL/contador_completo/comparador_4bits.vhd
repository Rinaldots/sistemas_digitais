
library ieee;
use ieee.std_logic_1164.all;

entity comparador_4bits is
	port (
		A, B                       : in std_logic_vector(3 downto 0);
		AmenorBCarry, AmaiorBCarry : in std_logic;
		AigualB, AmenorB, AmaiorB  : out std_logic
	);
end comparador_4bits;

architecture ckt of comparador_4bits is

	signal carryMaior, carryIgual, carryMenor : std_logic;
	signal x                                  : std_logic_vector(3 downto 0);

begin

	x(3)       <= not (A(3) xor B(3));
	x(2)       <= not (A(2) xor B(2));
	x(1)       <= not (A(1) xor B(1));
	x(0)       <= not (A(0) xor B(0));

	carryIgual <= x(3) and x(2) and x(1) and x(0);
	carryMaior <= ((A(3) and not B(3)) or (x(3) and A(2) and not B(2)) or (x(3) and x(2) and A(1) and not B(1)) or (x(3) and x(2) and x(1) and A(0) and not B(0)));
	carryMenor <= not (carryIgual or carryMaior);

	AigualB    <= ((not (AmaiorBCarry or AmenorBCarry) and carryIgual));
	AmaiorB    <= ((not (AmenorBCarry) and carryMaior) or AmaiorBCarry);
	AmenorB    <= ((not (AmaiorBCarry) and carryMenor) or AmenorBCarry);

end ckt;