library ieee;
use ieee.std_logic_1164.all;

entity MUX2X1 is
    port (
        I0, I1 : in  std_logic;
        S      : in  std_logic;
        Z      : out std_logic
    );
end MUX2X1;

architecture CKT of MUX2X1 is
begin
    -- Implementa��o com express�es booleanas
    Z <= (I0 and (not S)) or (I1 and S);
end CKT;
