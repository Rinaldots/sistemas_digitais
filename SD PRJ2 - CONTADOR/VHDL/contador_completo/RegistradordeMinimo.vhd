library ieee;
use ieee.std_logic_1164.all;
entity RegistradordeMinimo is
	port (
		ck   : in std_logic;
		S    : in std_logic_vector (1 downto 0);
		A    : in std_logic_vector (11 downto 0);
		Q    : out std_logic_vector(11 downto 0)
	);
end RegistradordeMinimo;

architecture CKT of RegistradordeMinimo is
	component Registrador12Bits is
		port (
			ck, clr, set : in std_logic;
			S            : in std_logic_vector (1 downto 0); --ENTRADA DO SELETOR DO MUX
			A            : in std_logic_vector(11 downto 0); -- ENTRADA PARALELA A
			Z, W         : in std_logic_vector(11 downto 0);  -- ENTRADAS CLEAR
			Q            : out std_logic_vector(11 downto 0) -- SA�DA DO REGISTRADO
		);
	end component;

begin
	REG : Registrador12Bits port map(ck => ck, clr => '1', set => '1', S => S, A => A, Z => "000000000000", W => "000000000000", Q => Q);
end CKT;