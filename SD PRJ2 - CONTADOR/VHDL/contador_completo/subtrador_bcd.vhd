library ieee;
use ieee.std_logic_1164.all;

entity subtrator_bcd is
  port (
    a   : in std_logic_vector(11 downto 0);
    b   : in std_logic_vector(11 downto 0);
    c_in : in std_logic;
    EAC  : out std_logic;
    z    : out std_logic_vector(11 downto 0)
  );
end subtrator_bcd;

architecture ckt of subtrator_bcd is

  component somador_bcd
    port (
			a     : in std_logic_vector(11 downto 0);
			b     : in std_logic_vector(11 downto 0);
			c_in  : in std_logic;
			c_out : out std_logic;
			z     : out std_logic_vector(11 downto 0)
					);
  end component;

  component complemento_9
    port (
      a : in std_logic_vector(3 downto 0);
      b : out std_logic_vector(3 downto 0)
    );
  end component;

  signal i, c : std_logic_vector(11 downto 0);

begin

  U0 : complemento_9 port map(
    a => b(3 downto 0),
    b => i(3 downto 0)
  );

  U1 : complemento_9 port map(
    a => b(7 downto 4),
    b => i(7 downto 4)
  );

  U2 : complemento_9 port map(
    a => b(11 downto 8),
    b => i(11 downto 8)
  );

  U3 : somador_bcd port map(
    a     => a,
    b     => i(11 downto 0),
    c_in  => '0',
    c_out => EAC,
    z     => c(11 downto 0)
  );

  U4 : somador_bcd port map(
    a(0) => '1',
    a(1) => '0',
    a(2) => '0',
    a(3) => '0',
    a(4) => '0',
    a(5) => '0',
    a(6) => '0',
    a(7) => '0',
    a(8) => '0',
    a(9) => '0',
    a(10) => '0',
    a(11) => '0',
    b     => c(11 downto 0),
    c_in  => '0',
    z     => z(11 downto 0)
    
  );

end ckt;