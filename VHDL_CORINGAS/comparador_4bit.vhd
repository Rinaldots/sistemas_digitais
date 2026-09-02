library ieee;
use ieee.std_logic_1164.all;

entity comp_4bit is
  port(a                            : in std_logic_vector(3 downto 0);
       b                            : in std_logic_vector(3 downto 0); 
       a_b_out, a_out, b_out       : out std_logic);
end comp_4bit;

architecture ckt of comp_4bit is
  
  component comp_2bit is
    port(in_a_b, in_a0, in_b0,a_in, b_in : in std_logic;
         a_b, a_0, b_0                : out std_logic);
  end component;
  
  signal a_b_carry, b_carry, a_carry : std_logic_vector(2 downto 0);

  begin

  U0: comp_2bit port map(
    in_a_b     => '1',
    in_a0      => '0',
    in_b0      => '0',
    a_in       => a(0),
    b_in       => b(0),
    a_b        => a_b_carry(0),
    b_0       => b_carry(0),
    a_0       => a_carry(0)
    );
  U2: comp_2bit port map(
    in_a_b     => a_b_carry(0),
    in_a0      => b_carry(0),
    in_b0      => a_carry(0),
    a_in       => a(1),
    b_in       => b(1),
    a_b        => a_b_carry(1),
    b_0       => b_carry(1),
    a_0       => a_carry(1)
    );
  U3: comp_2bit port map(
    in_a_b     => a_b_carry(1),
    in_a0      => b_carry(1),
    in_b0      => a_carry(1),
    a_in       => a(2),
    b_in       => b(2),
    a_b        => a_b_carry(2),
    b_0       => b_carry(2),
    a_0       => a_carry(2)
    );
  U4: comp_2bit port map(
    in_a_b     => a_b_carry(2),
    in_a0      => b_carry(2),
    in_b0      => a_carry(2),
    a_in       => a(3),
    b_in       => b(3),
    a_b        => a_b_out,
    b_0       => b_out,
    a_0       => a_out
    );
end ckt;


