library ieee;
use ieee.std_logic_1164.all;

entity sub_10bit is
  port (
    a     : in  std_logic_vector(9 downto 0);
    b     : in  std_logic_vector(9 downto 0);
    z     : out std_logic_vector(9 downto 0);
    c_out : out std_logic
  );
end sub_10bit;

architecture ckt of sub_10bit is

  component adder_10bit
    port (
      a     : in std_logic_vector(9 downto 0);
      b     : in std_logic_vector(9 downto 0);
      c_in  : in std_logic;
      c_out : out std_logic;
      z     : out std_logic_vector(9 downto 0)
    );
  end component;

  signal b_invert : std_logic_vector(9 downto 0);
  signal c_out_internal : std_logic;
begin

  -- Calcula complemento de 2 de B: not(B) + 1
  b_invert <= not b;

  -- Usa o somador de 10 bits
  U0: adder_10bit port map(
    a     => a,
    b     => b_invert,
    c_in  => '1',      -- soma o +1 do complemento de dois
    c_out => c_out_internal,
    z     => z
  );
  c_out <= NOT(c_out_internal);

end ckt;
