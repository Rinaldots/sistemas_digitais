library ieee;
use ieee.std_logic_1164.all;

entity MUX4x12 is
    port (
        i0, i1, i2, i3 : in std_logic_vector(11 downto 0);
        S              : in std_logic_vector(1 downto 0);
        Z              : out std_logic_vector(11 downto 0)
    );
end MUX4x12;

architecture CKT of MUX4x12 is
    component MUX4X1 is
        port (
            I0, I1, I2, I3 : in std_logic;
            S              : in std_logic_vector(1 downto 0);
            Z              : out std_logic
        );
    end component;
begin
    U0  : MUX4X1 port map(i0(0), i1(0), i2(0), i3(0), S(1 downto 0), Z(0));
    U1  : MUX4X1 port map(i0(1), i1(1), i2(1), i3(1), S(1 downto 0), Z(1));
    U2  : MUX4X1 port map(i0(2), i1(2), i2(2), i3(2), S(1 downto 0), Z(2));
    U3  : MUX4X1 port map(i0(3), i1(3), i2(3), i3(3), S(1 downto 0), Z(3));
    U4  : MUX4X1 port map(i0(4), i1(4), i2(4), i3(4), S(1 downto 0), Z(4));
    U5  : MUX4X1 port map(i0(5), i1(5), i2(5), i3(5), S(1 downto 0), Z(5));
    U6  : MUX4X1 port map(i0(6), i1(6), i2(6), i3(6), S(1 downto 0), Z(6));
    U7  : MUX4X1 port map(i0(7), i1(7), i2(7), i3(7), S(1 downto 0), Z(7));
    U8  : MUX4X1 port map(i0(8), i1(8), i2(8), i3(8), S(1 downto 0), Z(8));
    U9  : MUX4X1 port map(i0(9), i1(9), i2(9), i3(9), S(1 downto 0), Z(9));
    U10 : MUX4X1 port map(i0(10), i1(10), i2(10), i3(10), S(1 downto 0), Z(10));
    U11 : MUX4X1 port map(i0(11), i1(11), i2(11), i3(11), S(1 downto 0), Z(11));

end CKT;