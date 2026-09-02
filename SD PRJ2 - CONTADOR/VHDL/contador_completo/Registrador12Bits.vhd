library ieee;
use ieee.std_logic_1164.all;

entity Registrador12Bits is
	port (
		ck, clr, set : in std_logic;
		S            : in std_logic_vector (1 downto 0); --ENTRADA DO SELETOR DO MUX
		A            : in std_logic_vector(11 downto 0); -- ENTRADA PARALELA A
		Z, W         : in std_logic_vector(11 downto 0); -- ENTRADAS CLEAR
		Q            : out std_logic_vector(11 downto 0) -- SA�DA DO REGISTRADO
	);
end Registrador12Bits;

architecture CKT of Registrador12Bits is
	component Registrador4Bits is
		port (
			ck, clr, set : in std_logic;
			S            : in std_logic_vector(1 downto 0); -- SELETOR DO MUX
			Z, W         : in std_logic_vector(3 downto 0); -- ENTRADAS CLEAR
			A            : in std_logic_vector(3 downto 0); -- ENTRADA PARALELA A
			Q            : out std_logic_vector(3 downto 0) -- SAIDA DO REGISTRADOR
		);
	end component;
begin
	REG0 : Registrador4Bits
	port map(ck => ck, clr => '1', set => '1', S => S, A => A(3 downto 0), Z => Z(3 downto 0), W => W(3 downto 0), Q => Q(3 downto 0));

	REG1 : Registrador4Bits
	port map(ck => ck, clr => '1', set => '1', S => S, A => A(7 downto 4), Z => Z(7 downto 4), W => W(7 downto 4), Q => Q(7 downto 4));

	REG2 : Registrador4Bits
	port map(ck => ck, clr => '1', set => '1', S => S, A => A(11 downto 8), Z => Z(7 downto 4), W => W(7 downto 4), Q => Q(11 downto 8));

end CKT;