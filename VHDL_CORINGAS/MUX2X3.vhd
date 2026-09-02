library ieee;
use ieee.std_logic_1164.all;

entity MUX2X3 is
    port (
        I0, I1         : in  std_logic_vector(2 downto 0);
        S              : in  std_logic;
        Z              : out std_logic_vector(2 downto 0)
    );
end MUX2X3;

architecture CKT of MUX2X3 is

begin
    -- Implement each bit of the 3-bit mux directly to avoid nested component binding issues
    Z(0) <= (I0(0) and (not S)) or (I1(0) and S);
    Z(1) <= (I0(1) and (not S)) or (I1(1) and S);
    Z(2) <= (I0(2) and (not S)) or (I1(2) and S);

end CKT;
