--

--

library ieee;
use ieee.std_logic_1164.all;

entity mde_moore2p is
   port (ck, rst, w : in  std_logic;
                  z : out std_logic);
end mde_moore2p;

architecture logica of mde_moore2p is
   type state_type is (a, b, c);                           
   signal y_present, y_next : state_type;

begin
   process (w, y_present)
   begin
      case y_present is
         when a =>
            if w = '0' then y_next <= a;
            else            y_next <= b; end if;
         when b =>
            if w = '0' then y_next <= a;
            else            y_next <= c; end if; 
         when c =>
            if w = '0' then y_next <= a;
            else            y_next <= c; end if;
      end case;
   end process;

   process (ck, rst)
   begin
      if rst = '0' then
         y_present <= a;
      elsif (ck'event and ck = '1') then
         y_present <= y_next;
      end if;
   end process;

   z <= '1' when y_present = c else '0';
end logica;