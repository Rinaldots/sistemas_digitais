LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY flipd_d IS
    PORT (
        ENTRADA, DIREITA, ESQUERDA, clr, ck : IN STD_LOGIC;
        S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        Z : OUT STD_LOGIC
    );
END flipd_d;

ARCHITECTURE CKT OF flipd_d IS

    COMPONENT MUX4X1 IS
        PORT (
            I0, I1, I2, I3 : IN STD_LOGIC;
            S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            Z : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT ffd IS
        PORT (
            ck, clr, set, d : IN STD_LOGIC;
            q : OUT STD_LOGIC
        );
    END COMPONENT;

    -- clr ativo em nivel baixo
    SIGNAL n_set, n_rst : STD_LOGIC;
    SIGNAL SAIDA, REALIMENTACA : STD_LOGIC;
BEGIN
    Z <= REALIMENTACA;
    U0 : MUX4X1 PORT MAP(REALIMENTACA, DIREITA, ESQUERDA, ENTRADA, S, SAIDA);

    n_set <= clr OR NOT ENTRADA;
    n_rst <= clr OR ENTRADA;

    FF0 : ffd PORT MAP(ck, n_rst, n_set, SAIDA, REALIMENTACA);
END CKT;