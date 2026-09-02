library ieee;
use ieee.std_logic_1164.all;

entity comparador_mag_10bits is
    port (
        A       : in  std_logic_vector(9 downto 0);
        O       : out std_logic
    );
end comparador_mag_10bits;

architecture CKT of comparador_mag_10bits is
begin
    O <= (A(0) OR A(1) OR A(2) OR A(3) OR A(4) OR A(5) OR A(6) OR A(7) OR A(8) OR A(9) OR '0');
end CKT;