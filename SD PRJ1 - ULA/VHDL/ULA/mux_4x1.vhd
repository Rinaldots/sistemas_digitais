library ieee;
use ieee.std_logic_1164.all;

entity mux4x1 is
  port(a,b :  in std_logic_vector(3 downto 0);
       s   :  in std_logic;
       z   :  out std_logic_vector(3 downto 0));
end mux4x1;

architecture ckt of mux4x1 is
  
  component mux2x1
    port(e : in std_logic_vector(1 downto 0);
         s : in std_logic;
         z : out std_logic);
  end component;
  begin
        

  U0: mux2x1 port map(
    e(1)     => a(0),
    e(0)     => b(0),
    s        => s,
    z        => z(0)
    );
    
  U1: mux2x1 port map(
    e(1)     => a(1),
    e(0)     => b(1),
    s        => s,
    z        => z(1)
    );
  U2: mux2x1 port map(
    e(1)     => a(2),
    e(0)     => b(2),
    s        => s,
    z        => z(2)
    );
  U3: mux2x1 port map(
    e(1)     => a(3),
    e(0)     => b(3),
    s        => s,
    z        => z(3)
    );
end ckt;
