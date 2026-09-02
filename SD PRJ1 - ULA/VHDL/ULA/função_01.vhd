LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Somador8Bits IS
    PORT (
        A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        Cin : IN STD_LOGIC;
        Cout : OUT STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END Somador8Bits;

ARCHITECTURE CKT OF Somador8Bits IS
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

BEGIN
    U0 : Somador1Bits PORT MAP(A(0), B(0), Cin, C1, S(0));
    U1 : Somador1Bits PORT MAP(A(1), B(1), C1, C2, S(1));
    U2 : Somador1Bits PORT MAP(A(2), B(2), C2, C3, S(2));
    U3 : Somador1Bits PORT MAP(A(3), B(3), C3, C4, S(3));
    U4 : Somador1Bits PORT MAP(A(4), B(4), C4, C5, S(4));
    U5 : Somador1Bits PORT MAP(A(5), B(5), C5, C6, S(5));
    U6 : Somador1Bits PORT MAP(A(6), B(6), C6, C7, S(6));
    U7 : Somador1Bits PORT MAP(A(7), B(7), C7, Cout, S(7));
END CKT;