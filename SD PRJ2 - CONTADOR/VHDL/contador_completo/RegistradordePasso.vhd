library ieee;
use ieee.std_logic_1164.all;

entity RegistradordePasso is
	port (
		ck : in std_logic;
		S  : in std_logic_vector(1 downto 0); -- SELETOR DO MUX
		Z  : in std_logic_vector(3 downto 0); -- ENTRADAS CLEAR
		A  : in std_logic_vector(3 downto 0); -- ENTRADA PARALELA A
		Q  : out std_logic_vector(3 downto 0) -- SAIDA DO REGISTRADOR
	);
end RegistradordePasso;

architecture CKT of RegistradordePasso is

	component ffd is
		port (
			ck, clr, set, d : in std_logic;

			q               : out std_logic
		);
	end component;

	component Registrador4Bits
		port (
			ck, clr, set : in std_logic;
			S            : in std_logic_vector(1 downto 0); -- SELETOR DO MUX
			Z, W         : in std_logic_vector(3 downto 0); -- ENTRADAS CLEAR
			A            : in std_logic_vector(3 downto 0); -- ENTRADA PARALELA A
			Q            : out std_logic_vector(3 downto 0) -- SAIDA DO REGISTRADOR
		);
	end component;

begin
	RG : Registrador4Bits port map(ck => ck, clr => '1', set => '1', S => S, Z => "0001", W => "0001", A => A, Q => Q);
end CKT;