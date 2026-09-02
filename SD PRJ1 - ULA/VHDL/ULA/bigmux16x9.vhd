LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY BIGMUX IS
    PORT (
        -- Entradas de 8 bits (resultados das opera��es da ULA)
        I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

        -- Entradas de carry (s� 6 fun��es t�m carry)
        C0, C1, C2, C3, C4, C5 : IN STD_LOGIC;

        -- Sele��o
        S : IN STD_LOGIC_VECTOR(3 DOWNTO 0);

        -- Sa�das
        Z : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        C : OUT STD_LOGIC
    );
END BIGMUX;

ARCHITECTURE CKT OF BIGMUX IS

    COMPONENT MUX16X1 IS
        PORT (
            I0, I1, I2, I3, I4, I5, I6, I7,
            I8, I9, I10, I11, I12, I13, I14, I15 : IN STD_LOGIC;
            S : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            Z : OUT STD_LOGIC
        );
    END COMPONENT;

BEGIN
    -- 8 muxes para os bits do resultado
    gen_mux : FOR i IN 0 TO 7 GENERATE
        U : MUX16X1 PORT MAP(
            '0', I0(i), I1(i), I2(i), I3(i), I4(i),'0','0', I5(i), I6(i),
            I7(i),I8(i), I9(i), I10(i), I11(i), I12(i), -- entradas extras zero
            S, Z(i)
            
        );
    END GENERATE;

    -- 1 mux para o carry (somente 6 fun��es t�m carry)
    Ucarry : MUX16X1 PORT MAP(
        '0', C0, C1, C2, C3, C4,'0','0', C5,'0',
        '0', '0', '0', '0', '0', '0', -- entradas extras zero
        S, C
    );

END CKT;