library ieee;
use ieee.std_logic_1164.all;

entity bit4_flip_d is
    port(
         ck   : in  std_logic;
         clr  : in  std_logic;
         en   : in  std_logic;
         d    : in  std_logic_vector(3 downto 0);
         q    : out std_logic_vector(3 downto 0)
      );
end bit4_flip_d;

architecture CKT of bit4_flip_d is

    component ffd is
        port (
            ck, clr, set, d : in std_logic; 
            q               : out std_logic 
        );
    end component;
    signal n_clr : std_logic;
begin

    n_clr <= not clr;

    FF0 : ffd port map(ck, n_clr, '1', d(0), q(0));

    FF1 : ffd port map(ck, n_clr, '1', d(1), q(1));

    FF2 : ffd port map(ck, n_clr, '1', d(2), q(2));
    
    FF3 : ffd port map(ck, n_clr, '1', d(3), q(3));

end CKT;

