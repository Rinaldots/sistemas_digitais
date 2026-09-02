LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Incrementador8Bits IS
    PORT (
        A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        Cout : OUT STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END Incrementador8Bits;

ARCHITECTURE CKT OF Incrementador8Bits IS
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
    SIGNAL Cin_interno4 : STD_LOGIC := '1';

BEGIN
    -- A + 1 = A + 00000001
    U0 : Somador1Bits PORT MAP(A(0), '0', Cin_interno4, C1, S(0));
    U1 : Somador1Bits PORT MAP(A(1), '0', C1, C2, S(1));
    U2 : Somador1Bits PORT MAP(A(2), '0', C2, C3, S(2));
    U3 : Somador1Bits PORT MAP(A(3), '0', C3, C4, S(3));
    U4 : Somador1Bits PORT MAP(A(4), '0', C4, C5, S(4));
    U5 : Somador1Bits PORT MAP(A(5), '0', C5, C6, S(5));
    U6 : Somador1Bits PORT MAP(A(6), '0', C6, C7, S(6));
    U7 : Somador1Bits PORT MAP(A(7), '0', C7, Cout, S(7));

END CKT;