LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Somador1Bits IS
    PORT (
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        Cin : IN STD_LOGIC;
        Cout : OUT STD_LOGIC;
        S : OUT STD_LOGIC
    );
END Somador1Bits;

ARCHITECTURE CKT OF Somador1Bits IS
BEGIN
    S <= (A) XOR (B) XOR (Cin);
    Cout <= (A AND Cin) OR (B AND Cin) OR (A AND B);
END CKT;