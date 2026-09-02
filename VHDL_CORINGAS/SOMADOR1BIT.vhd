library ieee;
use ieee.std_logic_1164.all;

entity Somador1Bits is
    port(
        A    : in  std_logic;
        B   : in  std_logic;
        Cin  : in  std_logic;
        Cout : out std_logic;
        S    : out std_logic
    );
end Somador1Bits;

architecture CKT of Somador1Bits is
begin
    S <= (A) xor (B) xor (Cin); 
    Cout <= (A and Cin) or (B and Cin) or (A and B);
end CKT;
