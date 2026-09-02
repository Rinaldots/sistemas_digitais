library ieee;
use ieee.std_logic_1164.all;

entity MUX3X3 is
    port (
        I0, I1, I2, I3, I4, I5, I6, I7 : in  std_logic_vector(2 downto 0);
        S                              : in  std_logic_vector(2 downto 0);
        Z                              : out std_logic_vector(2 downto 0)
    );
end MUX3X3;

architecture CKT of MUX3X3 is

    component MUX2X3 is
      port (
          I0, I1         : in  std_logic_vector(2 downto 0);
          S              : in  std_logic;
          Z              : out std_logic_vector(2 downto 0)
        );
    end component;

    signal ZX0, ZX1, ZX2, ZX3: std_logic_vector(2 downto 0);
    signal ZX4, ZX5: std_logic_vector(2 downto 0);

begin
    U0 : MUX2X3 port map(I0, I1, S(0), ZX0);
    U1 : MUX2X3 port map(I2, I3, S(0), ZX1);
    U2 : MUX2X3 port map(I4, I5, S(0), ZX2);
    U3 : MUX2X3 port map(I6, I7, S(0), ZX3);

    U4 : MUX2X3 port map(ZX0, ZX1, S(1), ZX4);
    U5 : MUX2X3 port map(ZX2, ZX3, S(1), ZX5);

    U6 : MUX2X3 port map(ZX4, ZX5, S(2), Z);

end CKT;

