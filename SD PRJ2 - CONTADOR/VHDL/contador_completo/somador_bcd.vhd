library ieee;
use ieee.std_logic_1164.all;

entity somador_bcd is
  port (
    a    : in std_logic_vector(11 downto 0);
    b    : in std_logic_vector(11 downto 0);
    c_in  : in std_logic;
    c_out : out std_logic;
    z    : out std_logic_vector(11 downto 0)
  );
end somador_bcd;

architecture ckt of somador_bcd is

  component sum_1_D
    port (
      a     : in std_logic_vector(3 downto 0);
      b     : in std_logic_vector(3 downto 0);
      c_in  : in std_logic;
      c_out : out std_logic;
      z     : out std_logic_vector(3 downto 0)
    );
  end component;

  signal carry : std_logic_vector(1 downto 0);

begin

  U0 : sum_1_D port map(
    a     => a(3 downto 0),
    b     => b(3 downto 0),
    c_in  => c_in,
    z     => z(3 downto 0),
    c_out => carry(0)
  );
  U1 : sum_1_D port map(
    a     => a(7 downto 4),
    b     => b(7 downto 4),
    c_in  => carry(0),
    z     => z(7 downto 4),
    c_out => carry(1)
  );
  U2 : sum_1_D port map(
    a     => a(11 downto 8),
    b     => b(11 downto 8),
    c_in  => carry(1),
    z     => z(11 downto 8),
    c_out => c_out
  );

end ckt;