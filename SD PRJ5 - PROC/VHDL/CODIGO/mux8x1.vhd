LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MUX8X1 IS
    PORT (
        I0, I1, I2, I3, I4, I5, I6, I7 : IN STD_LOGIC;
        S : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        Z : OUT STD_LOGIC
    );
END MUX8X1;

ARCHITECTURE CKT OF MUX8X1 IS

    COMPONENT MUX2X1 IS
        PORT (
            I0, I1, S : IN STD_LOGIC;
            Z : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT MUX4X1 IS
        PORT (
            I0, I1, I2, I3 : IN STD_LOGIC;
            S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            Z : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL ZX0, ZX1 : STD_LOGIC;

BEGIN
    U0 : MUX4X1 PORT MAP(I0, I1, I2, I3, S(1 DOWNTO 0), ZX0);
    U1 : MUX4X1 PORT MAP(I4, I5, I6, I7, S(1 DOWNTO 0), ZX1);
    U2 : MUX2X1 PORT MAP(ZX0, ZX1, S(2), Z);

END CKT;