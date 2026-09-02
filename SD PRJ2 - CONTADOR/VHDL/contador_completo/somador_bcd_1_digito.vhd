library ieee;
use ieee.std_logic_1164.all;

entity sum_1_D is
  port (
    a     : in std_logic_vector(3 downto 0);
    b     : in std_logic_vector(3 downto 0);
    c_in  : in std_logic;
    c_out : out std_logic;
    z     : out std_logic_vector(3 downto 0));
end sum_1_D;

architecture ckt of sum_1_D is

  component adder_4bit
    port (
      a     : in std_logic_vector(3 downto 0);
      b     : in std_logic_vector(3 downto 0);
      c_in  : in std_logic;
      c_out : out std_logic;
      z     : out std_logic_vector(3 downto 0));
  end component;

  signal r           : std_logic_vector(3 downto 0);
  signal c_1, c_outc : std_logic;
begin

  U0 : adder_4bit port map(
    a     => a,
    b     => b,
    c_in  => c_in,
    z     => r,
    c_out => c_outc
  );

  c_1 <= (c_outc or (r(3) and (r(1) or r(2))));

  U1 : adder_4bit port map(
    a    => r,
    b(0) => '0',
    b(1) => c_1,
    b(2) => c_1,
    b(3) => '0',
    c_in => '0',
    z    => z
  );

  c_out <= c_1;

end ckt;