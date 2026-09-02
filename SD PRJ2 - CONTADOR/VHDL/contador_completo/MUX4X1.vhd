library ieee;
use ieee.std_logic_1164.all;

entity MUX4X1 is
    port (
        I0, I1, I2, I3 : in std_logic;
        S              : in std_logic_vector(1 downto 0);
        Z              : out std_logic
    );
end MUX4X1;

architecture CKT of MUX4X1 is

    component MUX2X1 is
        port (
            I0, I1, S : in std_logic;
            Z         : out std_logic);
    end component;

    signal ZX0, ZX1 : std_logic;

begin
    U0 : MUX2X1 port map(I0, I1, S(0), ZX0);
    U1 : MUX2X1 port map(I2, I3, S(0), ZX1);
    U2 : MUX2X1 port map(ZX0, ZX1, S(1), Z);
end CKT;