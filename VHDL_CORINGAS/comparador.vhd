
library ieee;
use ieee.std_logic_1164.all;

entity comparador is
	port (
		centena0, dezena0, unidade0, centena1, dezena1, unidade1 : in std_logic_vector(3 downto 0);
		AigualB, AmenorB, AmaiorB                                : out std_logic
	);
end comparador;

architecture ckt of comparador is

	component comparador_4bits is
		port (
			A, B                       : in std_logic_vector(3 downto 0);
			AmenorBCarry, AmaiorBCarry : in std_logic;
			AigualB, AmenorB, AmaiorB  : out std_logic
		);
	end component;

	signal carryMaiorCentena, carryIgualCentena, carryMenorCentena : std_logic;
	signal carryMaiorDezena, carryIgualDezena, carryMenorDezena    : std_logic;
	signal carryMaiorUnidade, carryIgualUnidade, carryMenorUnidade : std_logic;

begin

	U0 : comparador_4bits port map(centena0, centena1, '0', '0', carryIgualCentena, carryMenorCentena, carryMaiorCentena);
	U1 : comparador_4bits port map(dezena0, dezena1, carryMenorCentena, carryMaiorCentena, carryIgualDezena, carryMenorDezena, carryMaiorDezena);
	U2 : comparador_4bits port map(unidade0, unidade1, carryMenorDezena, carryMaiorDezena, AigualB, AmenorB, AmaiorB);

end ckt;