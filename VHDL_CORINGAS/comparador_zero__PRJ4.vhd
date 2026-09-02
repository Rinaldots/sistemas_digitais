library ieee;
use ieee.std_logic_1164.all;

entity comparador_zero is
	port(a: in std_logic_vector(3 downto 0);
	     z: out std_logic); 
end comparador_zero;

architecture ckt of comparador_zero is

begin

	z <= not(a(0) or a(1) or a(2) or a(3));

end ckt;	

