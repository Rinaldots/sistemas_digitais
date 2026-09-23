LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ATV_4 IS
    PORT (
        ck : IN STD_LOGIC; -- CLOCK
        CIMA, BAIXO, ESQUERDA, DIREITA : IN STD_LOGIC; -- ENTRADA
        clr : IN STD_LOGIC; -- CLEAR
        SAIDA_HOR, SAIDA_VERT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- SAIDA
    );
END ATV_4;

ARCHITECTURE CKT OF ATV_4 IS

    COMPONENT bit8_flip_d IS
        PORT (
            ck : IN STD_LOGIC; -- CLOCK
            S : IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- ENTRADA
            clr : IN STD_LOGIC; -- CLEAR
            SAIDA : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- SAIDA
        );
    END COMPONENT;

    COMPONENT ck_div IS
        PORT (
            ck_in : IN STD_LOGIC;
            ck_out : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL HOZ_SIGNAL, VER_SIGNAL : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL CLOCK : STD_LOGIC;
BEGIN

    -- Entrada 00 mantem 10 esquerda/cima e 01 direita/baixo 11 nao existe;
    HOZ_SIGNAL(0) <= DIREITA AND NOT(ESQUERDA);
    HOZ_SIGNAL(1) <= ESQUERDA AND NOT (DIREITA);

    VER_SIGNAL(0) <= BAIXO AND NOT(CIMA);
    VER_SIGNAL(1) <= CIMA AND NOT(BAIXO);

    CK0 : ck_div PORT MAP(ck, CLOCK);
    HOR0 : bit8_flip_d PORT MAP(CLOCK, HOZ_SIGNAL, clr, SAIDA_HOR);
    VET0 : bit8_flip_d PORT MAP(CLOCK, VER_SIGNAL, clr, SAIDA_VERT);
END CKT;