library ieee;
use ieee.std_logic_1164.all;

entity adder_10bit is
  port (
    a     : in std_logic_vector(9 downto 0);
    b     : in std_logic_vector(9 downto 0);
    c_in  : in std_logic;
    c_out : out std_logic;
    z     : out std_logic_vector(9 downto 0));
end adder_10bit;

architecture ckt of adder_10bit is

  component adder_2bit
    port (
      a, b, c_int : in std_logic;
      s, c_out    : out std_logic);
  end component;

  signal carry : std_logic_vector(8 downto 0);

begin

  U0 : adder_2bit port map(
    a     => a(0),
    b     => b(0),
    c_int => c_in,
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
    c_out => carry(2)
  );
  U3 : adder_2bit port map(
    a     => a(3),
    b     => b(3),
    c_int => carry(2),
    s     => z(3),
    c_out => carry(3)
  );

  U4 : adder_2bit port map(
    a     => a(4),
    b     => b(4),
    c_int => carry(3),
    s     => z(4),
    c_out => carry(4)
  );

  U5 : adder_2bit port map(
    a     => a(5),
    b     => b(5),
    c_int => carry(4),
    s     => z(5),
    c_out => carry(5)
  );

  U6 : adder_2bit port map(
    a     => a(6),
    b     => b(6),
    c_int => carry(5),
    s     => z(6),
    c_out => carry(6)
  );

  U7 : adder_2bit port map(
    a     => a(7),
    b     => b(7),
    c_int => carry(6),
    s     => z(7),
    c_out => carry(7)
  );

  U8 : adder_2bit port map(
    a     => a(8),
    b     => b(8),
    c_int => carry(7),
    s     => z(8),
    c_out => carry(8)
  );

  U9 : adder_2bit port map(
    a     => a(9),
    b     => b(9),
    c_int => carry(8),
    s     => z(9),
    c_out => c_out
  );

end ckt;