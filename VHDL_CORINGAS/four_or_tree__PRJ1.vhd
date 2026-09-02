library ieee;
use ieee.std_logic_1164.all;

entity four_or_three is
  port(a        : in std_logic_vector(3 downto 0);
       s        : out std_logic_vector(3 downto 0));
end four_or_three;

architecture ckt of four_or_three is
  begin
  s(0) <= not((not a(0)) and a(3)) or ((not a(0)) and a(1) and a(2)) or (a(0) and (not a(2)) and (not a(3)));

  s(1) <= not((not a(0)) and (not a(1)) and a(3)) or (a(1) and (not a(2)) and (not a(3))) or (a(0) and a(1));
  
  s(2) <= not((not a(0)) and (not a(1)) and a(2)) or (a(1) and (not a(2)) and a(3)) or (a(0) and (not a(2)) and a(3));
 
  s(3) <= not((not a(0)) and (not a(1)) and a(3)) or ((not a(2)) and a(3)) or (a(1) and a(2) and (not a(3))) or (a(0) and a(2) and (not a(3)));
    
end ckt;



