library ieee;
use ieee.std_logic_1164.all;

entity bit10_flip_d is
    port (
        ck           : in std_logic;
        E            : in std_logic_vector(9 downto 0); -- ENTRADA
        S            : out std_logic_vector(9 downto 0) -- SAIDA
    );
end bit10_flip_d;

architecture CKT of bit10_flip_d is

    component ffd is
        port (
            ck, clr, set, d : in std_logic; 
            q               : out std_logic 
        );
    end component;

begin

    FF0 : ffd port map(ck, '1', '1', E(0), S(0));

    FF1 : ffd port map(ck, '1', '1', E(1), S(1));

    FF2 : ffd port map(ck, '1', '1', E(2), S(2));
    
    FF3 : ffd port map(ck, '1', '1', E(3), S(3));

    FF4 : ffd port map(ck, '1', '1', E(4), S(4));

    FF5 : ffd port map(ck, '1', '1', E(5), S(5));

    FF6 : ffd port map(ck, '1', '1', E(6), S(6));

    FF7 : ffd port map(ck, '1', '1', E(7), S(7));

    FF8 : ffd port map(ck, '1', '1', E(8), S(8));

    FF9 : ffd port map(ck, '1', '1', E(9), S(9));    

end CKT;


