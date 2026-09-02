library ieee;
use ieee.std_logic_1164.all;

entity comp_2bit is
  port(in_a_b, in_a0, in_b0,a_in, b_in : in std_logic;
       a_b, a_0, b_0                : out std_logic);
end comp_2bit;

architecture ckt of comp_2bit is
  begin
        a_b <= (in_a_b and (a_in XNOR b_in));
        a_0 <= (in_a0 or (in_a_b and (a_in and (not(b_in)))));
        b_0 <= (in_b0 or (in_a_b and (b_in and (not(a_in)))));
end ckt;


