library ieee;
use ieee.std_logic_1164.all;

entity adder_3bit is
  port (
    a     : in std_logic_vector(2 downto 0);
    b     : in std_logic_vector(2 downto 0);
    c_out : out std_logic;
    z     : out std_logic_vector(2 downto 0));
end adder_3bit;

architecture ckt of adder_3bit is

  component adder_2bit
    port (
      a, b, c_int : in std_logic;
      s, c_out    : out std_logic);
  end component;

  signal carry : std_logic_vector(1 downto 0);

begin

  U0 : adder_2bit port map(
    a     => a(0),
    b     => b(0),
    c_int => '0',
    s     => z(0),
    c_out => carry(0)
  );
  U1 : adder_2bit port map(
    a     => a(1),
    b     => b(1),
    c_int => carry(0),
    s     => z(1),
    c_out => carry(1)
  );
  U2 : adder_2bit port map(
    a     => a(2),
    b     => b(2),
    c_int => carry(1),
    s     => z(2),
    c_out => c_out
  );
 

end ckt;
