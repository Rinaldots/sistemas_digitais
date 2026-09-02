library ieee;
use ieee.std_logic_1164.all;

entity adder_4bit is
  port(a     : in std_logic_vector(3 downto 0);
       b     : in std_logic_vector(3 downto 0); 
       c_out : out std_logic;
       z     : out std_logic_vector(3 downto 0));
end adder_4bit;

architecture ckt of adder_4bit is
  
  component adder_2bit
    port(a, b, c_int : in std_logic;
         s, c_out    : out std_logic);
  end component;
  
  signal carry : std_logic_vector(2 downto 0);

  begin

  U0: adder_2bit port map(
    a     => a(0),
    b     => b(0),
    c_int => '0',
    s     => z(0),
    c_out => carry(0)
    );
  U1: adder_2bit port map(
    a     => a(1),
    b     => b(1),
    c_int => carry(0),
    s     => z(1),
    c_out => carry(1)
    );
  U2: adder_2bit port map(
    a     => a(2),
    b     => b(2),
    c_int => carry(1),
    s     => z(2),
    c_out => carry(2)
    );
  U3: adder_2bit port map(
    a     => a(3),
    b     => b(3),
    c_int => carry(2),
    s     => z(3),
    c_out => c_out
    );
end ckt;

