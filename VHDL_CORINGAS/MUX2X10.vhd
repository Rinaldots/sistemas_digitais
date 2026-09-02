library ieee;
use ieee.std_logic_1164.all;

entity MUX2X10 is
    port (
        I0, I1         : in  std_logic_vector(9 downto 0);
        S              : in  std_logic;
        Z              : out std_logic_vector(9 downto 0)
    );
end MUX2X10;

architecture CKT of MUX2X10 is

    component MUX2X1 is
        port (
            I0, I1, S : in std_logic;
            Z         : out std_logic);
    end component;

    signal ZX0, ZX1 : std_logic;

begin
    U0 : MUX2X1 port map(I0(0), I1(0), S, Z(0));
    U1 : MUX2X1 port map(I0(1), I1(1), S, Z(1));
    U2 : MUX2X1 port map(I0(2), I1(2), S, Z(2));
    U3 : MUX2X1 port map(I0(3), I1(3), S, Z(3));
    U4 : MUX2X1 port map(I0(4), I1(4), S, Z(4));
    U5 : MUX2X1 port map(I0(5), I1(5), S, Z(5));
    U6 : MUX2X1 port map(I0(6), I1(6), S, Z(6));
    U7 : MUX2X1 port map(I0(7), I1(7), S, Z(7));
    U8 : MUX2X1 port map(I0(8), I1(8), S, Z(8));
    U9 : MUX2X1 port map(I0(9), I1(9), S, Z(9));
      
end CKT;

