library ieee;
use ieee.std_logic_1164.all;

entity DEMUX2X1 is
    port (
        I                   : in  std_logic;
        S                   : in  std_logic;
        Z0, Z1              : out std_logic
    );
end DEMUX2X1;

architecture CKT of DEMUX2X1 is begin
    Z0 <= I when S = '0' else '0';
    Z1 <= I when S = '1' else '0';      
end CKT;