library ieee;
use ieee.std_logic_1164.all;

entity bit13_flip_d is
    port (
        ck           : in std_logic;               -- CLOCK
        enable       : in std_logic;               -- ENABLE
        E            : in std_logic_vector(12 downto 0); -- ENTRADA
        clr          : in std_logic;               -- CLEAR
        S            : out std_logic_vector(12 downto 0) -- SAIDA
    );
end bit13_flip_d;

architecture CKT of bit13_flip_d is

    component ffd is
        port (
            ck, clr, set, d : in std_logic; 
            q               : out std_logic 
        );
    end component;
    signal n_clr : std_logic;
begin

    n_clr <= not clr;

    FF0 : ffd port map(ck, n_clr, '1', E(0), S(0));

    FF1 : ffd port map(ck, n_clr, '1', E(1), S(1));

    FF2 : ffd port map(ck, n_clr, '1', E(2), S(2));

    FF3 : ffd port map(ck, n_clr, '1', E(3), S(3));

    FF4 : ffd port map(ck, n_clr, '1', E(4), S(4));

    FF5 : ffd port map(ck, n_clr, '1', E(5), S(5));

    FF6 : ffd port map(ck, n_clr, '1', E(6), S(6));

    FF7 : ffd port map(ck, n_clr, '1', E(7), S(7));

    FF8 : ffd port map(ck, n_clr, '1', E(8), S(8));

    FF9 : ffd port map(ck, n_clr, '1', E(9), S(9));

    FF10 : ffd port map(ck, n_clr, '1', E(10), S(10));

    FF11 : ffd port map(ck, n_clr, '1', E(11), S(11));

    FF12 : ffd port map(ck, n_clr, '1', E(12), S(12));

end CKT;


