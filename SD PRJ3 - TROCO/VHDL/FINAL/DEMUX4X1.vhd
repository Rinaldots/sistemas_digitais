library ieee;
use ieee.std_logic_1164.all;

entity DEMUX4X1 is
    port (
        I                   : in  std_logic;
        S                   : in  std_logic_vector(1 downto 0);
        Z0, Z1, Z2, Z3      : out std_logic
    );
end DEMUX4X1;

architecture CKT of DEMUX4X1 is begin
    Z0 <= I when S = "00" else '0';
    Z1 <= I when S = "01" else '0';
    Z2 <= I when S = "10" else '0';
    Z3 <= I when S = "11" else '0';
end CKT;