LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MUX16X1 IS
    PORT (
        I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15 : IN STD_LOGIC;
        S : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Z : OUT STD_LOGIC
    );
END MUX16X1;

ARCHITECTURE CKT OF MUX16X1 IS

    COMPONENT MUX2X1 IS
        PORT (
            I0, I1, S : IN STD_LOGIC;
            Z : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT MUX8X1 IS
        PORT (
            I0, I1, I2, I3, I4, I5, I6, I7 : IN STD_LOGIC;
            S : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            Z : OUT STD_LOGIC
        );
    END COMPONENT;
    SIGNAL ZX0, ZX1 : STD_LOGIC;

BEGIN
    U0 : MUX8X1 PORT MAP(I0, I1, I2, I3, I4, I5, I6, I7, S(2 DOWNTO 0), ZX0);
    U1 : MUX8X1 PORT MAP(I8, I9, I10, I11, I12, I13, I14, I15, S(2 DOWNTO 0), ZX1);
    U2 : MUX2X1 PORT MAP(ZX0, ZX1, S(3), Z);

END CKT;