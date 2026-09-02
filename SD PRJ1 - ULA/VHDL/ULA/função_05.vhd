LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Decrementador8Bits IS
    PORT (
        A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        Cout : OUT STD_LOGIC
    );
END Decrementador8Bits;

ARCHITECTURE CKT OF Decrementador8Bits IS
    COMPONENT Somador1Bits IS
        PORT (
            A : IN STD_LOGIC;
            B : IN STD_LOGIC;
            Cin : IN STD_LOGIC;
            Cout : OUT STD_LOGIC;
            S : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL C1, C2, C3, C4, C5, C6, C7 : STD_LOGIC;
    SIGNAL Cin_interno5 : STD_LOGIC := '0';

BEGIN

    -- A - 1 = A + 11111111
    U0 : Somador1Bits PORT MAP(A(0), '1', Cin_interno5, C1, S(0));
    U1 : Somador1Bits PORT MAP(A(1), '1', C1, C2, S(1));
    U2 : Somador1Bits PORT MAP(A(2), '1', C2, C3, S(2));
    U3 : Somador1Bits PORT MAP(A(3), '1', C3, C4, S(3));
    U4 : Somador1Bits PORT MAP(A(4), '1', C4, C5, S(4));
    U5 : Somador1Bits PORT MAP(A(5), '1', C5, C6, S(5));
    U6 : Somador1Bits PORT MAP(A(6), '1', C6, C7, S(6));
    U7 : Somador1Bits PORT MAP(A(7), '1', C7, Cout, S(7));

END CKT;