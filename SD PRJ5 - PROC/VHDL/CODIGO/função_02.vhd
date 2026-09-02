LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Subtrator8Bits IS
    PORT (
        A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        Bn : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0); -- guarda o NOT de B
        Cout : OUT STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END Subtrator8Bits;

ARCHITECTURE CKT OF Subtrator8Bits IS
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
    SIGNAL Cin_interno : STD_LOGIC := '1';

BEGIN
    -- gera o complemento de B
    Bn <= NOT B;

    U0 : Somador1Bits PORT MAP(A => A(0), B => Bn(0), Cin => Cin_interno, Cout => C1, S => S(0));
    U1 : Somador1Bits PORT MAP(A => A(1), B => Bn(1), Cin => C1, Cout => C2, S => S(1));
    U2 : Somador1Bits PORT MAP(A => A(2), B => Bn(2), Cin => C2, Cout => C3, S => S(2));
    U3 : Somador1Bits PORT MAP(A => A(3), B => Bn(3), Cin => C3, Cout => C4, S => S(3));
    U4 : Somador1Bits PORT MAP(A => A(4), B => Bn(4), Cin => C4, Cout => C5, S => S(4));
    U5 : Somador1Bits PORT MAP(A => A(5), B => Bn(5), Cin => C5, Cout => C6, S => S(5));
    U6 : Somador1Bits PORT MAP(A => A(6), B => Bn(6), Cin => C6, Cout => C7, S => S(6));
    U7 : Somador1Bits PORT MAP(A => A(7), B => Bn(7), Cin => C7, Cout => Cout, S => S(7));

END CKT;