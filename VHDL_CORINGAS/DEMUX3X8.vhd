library ieee;
use ieee.std_logic_1164.all;

entity DEMUX3X8 is
    port (
        I  : in  std_logic_vector(2 downto 0);
        S  : in  std_logic_vector(2 downto 0);
        Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7 : out std_logic_vector(2 downto 0)
    );
end DEMUX3X8;

architecture CKT of DEMUX3X8 is

    component DEMUX2X1 is
        port (
            I, S : in  std_logic;
            Z0, Z1 : out std_logic
        );
    end component;

    signal L0_0, L0_1, L0_2, L0_3 : std_logic_vector(2 downto 0);
    signal L1_0, L1_1 : std_logic_vector(2 downto 0);

begin

    U0 : DEMUX2X1 port map(I(0), S(2), L1_0(0), L1_1(0));

    U1 : DEMUX2X1 port map(L1_0(0), S(1), L0_0(0), L0_1(0));
    U2 : DEMUX2X1 port map(L1_1(0), S(1), L0_2(0), L0_3(0));

    U3 : DEMUX2X1 port map(L0_0(0), S(0), Z0(0), Z1(0));
    U4 : DEMUX2X1 port map(L0_1(0), S(0), Z2(0), Z3(0));
    U5 : DEMUX2X1 port map(L0_2(0), S(0), Z4(0), Z5(0));
    U6 : DEMUX2X1 port map(L0_3(0), S(0), Z6(0), Z7(0));

    U7 : DEMUX2X1 port map(I(1), S(2), L1_0(1), L1_1(1));

    U8 : DEMUX2X1 port map(L1_0(1), S(1), L0_0(1), L0_1(1));
    U9 : DEMUX2X1 port map(L1_1(1), S(1), L0_2(1), L0_3(1));

    U10 : DEMUX2X1 port map(L0_0(1), S(0), Z0(1), Z1(1));
    U11 : DEMUX2X1 port map(L0_1(1), S(0), Z2(1), Z3(1));
    U12 : DEMUX2X1 port map(L0_2(1), S(0), Z4(1), Z5(1));
    U13 : DEMUX2X1 port map(L0_3(1), S(0), Z6(1), Z7(1));

    U14 : DEMUX2X1 port map(I(2), S(2), L1_0(2), L1_1(2));

    U15 : DEMUX2X1 port map(L1_0(2), S(1), L0_0(2), L0_1(2));
    U16 : DEMUX2X1 port map(L1_1(2), S(1), L0_2(2), L0_3(2));

    U17 : DEMUX2X1 port map(L0_0(2), S(0), Z0(2), Z1(2));
    U18 : DEMUX2X1 port map(L0_1(2), S(0), Z2(2), Z3(2));
    U19 : DEMUX2X1 port map(L0_2(2), S(0), Z4(2), Z5(2));
    U20 : DEMUX2X1 port map(L0_3(2), S(0), Z6(2), Z7(2));

end CKT;
