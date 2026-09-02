library ieee;
use ieee.std_logic_1164.all;

entity comparador_mag_3bits is
    port (
        A       : in  std_logic_vector(2 downto 0);
        O       : out std_logic
    );
end comparador_mag_3bits;

architecture CKT of comparador_mag_3bits is
begin
    O <= NOT(A(0) OR A(1) OR A(2) OR '0');
end CKT;
