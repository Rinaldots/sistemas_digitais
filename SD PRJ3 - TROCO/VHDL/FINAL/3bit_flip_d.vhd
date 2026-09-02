library ieee;
use ieee.std_logic_1164.all;

entity bit3_flip_d is
    port (
        ck           : in std_logic;               -- CLOCK
        E            : in std_logic_vector(2 downto 0); -- ENTRADA
        S            : out std_logic_vector(2 downto 0) -- SAIDA
    );
end bit3_flip_d;

architecture CKT of bit3_flip_d is

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

end CKT;

