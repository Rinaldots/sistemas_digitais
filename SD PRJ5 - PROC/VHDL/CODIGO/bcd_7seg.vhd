library ieee;
use ieee.std_logic_1164.all;

entity bcd_7seg is
  port(s : in  std_logic_vector(3 downto 0);
       z : out std_logic_vector(6 downto 0));
end bcd_7seg;

architecture ckt of bcd_7seg is
  begin
        z(0) <= NOT(((not s(0))and(not s(2))) or (s(0) and s(2)) or s(3) or s(1));
        z(1) <= NOT((s(1) and s(0)) or ((not s(0))and(not s(1))) or s(3) or (not s(2)));
        z(2) <= NOT(s(3) or s(2) or (not s(1)) or s(0));
        z(3) <= NOT((s(1)and(not s(0))) or ((not s(2)) and s(1) and s(0)) or (s(2) and (not s(1)) and s(0)) or ((not s(2)) and (not s(0))));
        z(4) <= NOT(((not s(0)) and (not s(2))) or (s(1) and (not s(0))));
        z(5) <= NOT((s(2) and (not s(1))) or (s(2) and (not s(0))) or s(3) or ((not s(1)) and (not s(0))));
        z(6) <= NOT((s(2) and (not s(1))) or s(3) or ((not s(2)) and s(1)) or (s(1) and (not s(0))));
end ckt;



