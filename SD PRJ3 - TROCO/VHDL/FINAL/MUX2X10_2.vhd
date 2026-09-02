library ieee;
use ieee.std_logic_1164.all;

entity MUX2X10_2 is
    port (
        I0, I1, I2, I3         : in  std_logic_vector(9 downto 0);
        S                      : in  std_logic_vector(1 downto 0);
        Z                      : out std_logic_vector(9 downto 0)
    );
end MUX2X10_2;

architecture CKT of MUX2X10_2 is

    component MUX2X10 is
        port (
        I0, I1         : in  std_logic_vector(9 downto 0);
        S              : in  std_logic;
        Z              : out std_logic_vector(9 downto 0)
    );  
    end component;

    signal ZX0, ZX1 : std_logic_vector(9 downto 0);

begin

    U0 : MUX2X10 port map(I0, I1, S(0), ZX0);
    U1 : MUX2X10 port map(I2, I3, S(0), ZX1);
    U2 : MUX2X10 port map(ZX0, ZX1, S(1), Z);

end CKT;
