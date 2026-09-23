LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bit8_flip_d IS
    PORT (
        ck : IN STD_LOGIC; -- CLOCK
        S : IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- ENTRADA
        clr : IN STD_LOGIC; -- CLEAR
        SAIDA : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- SAIDA
    );
END bit8_flip_d;
ARCHITECTURE CKT OF bit8_flip_d IS

    COMPONENT flipd_d IS
        PORT (
            ENTRADA, DIREITA, ESQUERDA, clr, ck : IN STD_LOGIC;
            S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            Z : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL numero : STD_LOGIC_VECTOR(7 DOWNTO 0); -- CLONE
BEGIN
    SAIDA <= numero;

    FF0 : flipd_d PORT MAP('1', numero(7), numero(1), clr, ck, S, numero(0));

    FF1 : flipd_d PORT MAP('0', numero(0), numero(2), clr, ck, S, numero(1));

    FF2 : flipd_d PORT MAP('0', numero(1), numero(3), clr, ck, S, numero(2));

    FF3 : flipd_d PORT MAP('0', numero(2), numero(4), clr, ck, S, numero(3));

    FF4 : flipd_d PORT MAP('0', numero(3), numero(5), clr, ck, S, numero(4));

    FF5 : flipd_d PORT MAP('0', numero(4), numero(6), clr, ck, S, numero(5));

    FF6 : flipd_d PORT MAP('0', numero(5), numero(7), clr, ck, S, numero(6));

    FF7 : flipd_d PORT MAP('0', numero(6), numero(0), clr, ck, S, numero(7));

END CKT;