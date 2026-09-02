library ieee;
use ieee.std_logic_1164.all;

entity decodificador4x16 is
   port(
      A  : in  std_logic_vector(3 downto 0);  -- Entradas de seleção
      EN : in  std_logic;                     -- Enable
      Y  : out std_logic_vector(15 downto 0)  -- Saídas decodificadas
   );
end decodificador4x16;

architecture logica of decodificador4x16 is
begin

   -- Cada saída é o AND lógico entre o enable e a combinação dos bits A3..A0
   Y(0)  <= EN and (not A(3)) and (not A(2)) and (not A(1)) and (not A(0));
   Y(1)  <= EN and (not A(3)) and (not A(2)) and (not A(1)) and (    A(0));
   Y(2)  <= EN and (not A(3)) and (not A(2)) and (    A(1)) and (not A(0));
   Y(3)  <= EN and (not A(3)) and (not A(2)) and (    A(1)) and (    A(0));
   Y(4)  <= EN and (not A(3)) and (    A(2)) and (not A(1)) and (not A(0));
   Y(5)  <= EN and (not A(3)) and (    A(2)) and (not A(1)) and (    A(0));
   Y(6)  <= EN and (not A(3)) and (    A(2)) and (    A(1)) and (not A(0));
   Y(7)  <= EN and (not A(3)) and (    A(2)) and (    A(1)) and (    A(0));
   Y(8)  <= EN and (    A(3)) and (not A(2)) and (not A(1)) and (not A(0));
   Y(9)  <= EN and (    A(3)) and (not A(2)) and (not A(1)) and (    A(0));
   Y(10) <= EN and (    A(3)) and (not A(2)) and (    A(1)) and (not A(0));
   Y(11) <= EN and (    A(3)) and (not A(2)) and (    A(1)) and (    A(0));
   Y(12) <= EN and (    A(3)) and (    A(2)) and (not A(1)) and (not A(0));
   Y(13) <= EN and (    A(3)) and (    A(2)) and (not A(1)) and (    A(0));
   Y(14) <= EN and (    A(3)) and (    A(2)) and (    A(1)) and (not A(0));
   Y(15) <= EN and (    A(3)) and (    A(2)) and (    A(1)) and (    A(0));

end logica;
