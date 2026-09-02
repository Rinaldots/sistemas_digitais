library ieee;
use ieee.std_logic_1164.all;

entity logica_passo is
    port (
        C1, C2, C3, C4, C5, C6, ENABLE : in  std_logic;
        C                              : out std_logic_vector(2 downto 0);
        PASSO                          : out std_logic_vector(9 downto 0);
        E_error                        : out std_logic;
        M_1, M_2, M_3, M_4, M_5, M_6   : out std_logic
    );
end logica_passo;

architecture CKT of logica_passo is
begin

    --------------------------------------------------------------------
    -- SINAIS C (C[2:0])
    --------------------------------------------------------------------
    C(2) <= ((not C1) and (not C2) and (not C3) and (not C4)) or (not ENABLE);

    C(1) <= ((not C1) and (not C2) and (not C5) and (not C6)) or
             (not ENABLE) or
             ((not C1) and (not C2) and C4) or
             ((not C1) and (not C2) and C3);

    C(0) <= ((not C1) and (not C3) and (not C5)) or
             (not ENABLE) or
             ((not C1) and (not C3) and C4) or
             ((not C1) and C2);

    --------------------------------------------------------------------
    -- SINAIS PASSO (PASSO[9:0])
    --------------------------------------------------------------------
    PASSO(9) <= '0';
    PASSO(8) <= '0';
    PASSO(7) <= '0';

    PASSO(6) <= (C1 and ENABLE);

    PASSO(5) <= (C1 and ENABLE) or (C2 and ENABLE);

    PASSO(4) <= ((not C1) and C2 and ENABLE) or
                 ((not C1) and C3 and ENABLE);

    PASSO(3) <= ((not C1) and (not C2) and C3 and ENABLE) or
                 ((not C1) and (not C2) and C4 and ENABLE);

    PASSO(2) <= (C1 and ENABLE) or
                 ((not C2) and (not C3) and (not C4) and C5 and ENABLE);

    PASSO(1) <= ((not C1) and C2 and ENABLE) or
                 ((not C1) and (not C3) and C4 and ENABLE);

    PASSO(0) <= ((not C1) and (not C2) and C3 and ENABLE) or
                 ((not C1) and (not C2) and (not C4) and C6 and ENABLE) or
                 ((not C1) and (not C2) and (not C4) and C5 and ENABLE);

    --------------------------------------------------------------------
    -- SINAL DE ERRO
    --------------------------------------------------------------------
    E_error <= ((not C1) and (not C2) and (not C3) and (not C4) and (not C5) and (not C6) and ENABLE);

    --------------------------------------------------------------------
    -- SINAIS M (M[1:6])
    --------------------------------------------------------------------
    M_1 <= (not C1) or (not ENABLE);
    M_2 <= (not C2) or (not ENABLE) or C1;
    M_3 <= (not C3) or (not ENABLE) or C2 or C1;
    M_4 <= (not C4) or (not ENABLE) or C3 or C2 or C1;
    M_5 <= (not C5) or (not ENABLE) or C4 or C3 or C2 or C1;
    M_6 <= (not C6) or (not ENABLE) or C5 or C4 or C3 or C2 or C1;

end CKT;
  