library ieee;
use ieee.std_logic_1164.all;

entity comp_moeda is
    port (
        TOT       : in  std_logic_vector(9 downto 0);
        B1, B2, B3, B4, B5, B6       : in  std_logic_vector(2 downto 0);
        C1, C2, C3, C4, C5, C6       : out std_logic
    );
end comp_moeda;

architecture CKT of comp_moeda is

    component comparador_10bits is
        port (
            A, B           : in  std_logic_vector(9 downto 0);
            AigualB        : out std_logic;
            AmaiorB        : out std_logic;
            AmenorB        : out std_logic
        );
    end component;

    component comparador_mag_3bits is
        port (
            A       : in  std_logic_vector(2 downto 0);
            O       : out std_logic
        );
    end component;

    signal S1, S2, S3, S4, S5, S6, M1, M2, M3, M4, M5, M6 : std_logic;
    
    begin
    U1 : comparador_10bits port map(
        A      => TOT,
        B      => "0000000001",
        AigualB => open,
        AmaiorB => open,
        AmenorB => S6
    );
    U2 : comparador_10bits port map(
        A      => TOT,
        B      => "0000000101",
        AigualB => open,
        AmaiorB => open,
        AmenorB => S5
    );
    U3 : comparador_10bits port map(
        A      => TOT,
        B      => "0000001010",
        AigualB => open,
        AmaiorB => open,
        AmenorB => S4
    );
    U4 : comparador_10bits port map(
        A      => TOT,
        B      => "0000011001",
        AigualB => open,
        AmaiorB => open,
        AmenorB => S3
    );
    U5 : comparador_10bits port map(
        A      => TOT,
        B      => "0000110010",
        AigualB => open,
        AmaiorB => open,
        AmenorB => S2
    );
    U6 : comparador_10bits port map(
        A      => TOT,
        B      => "0001100100",
        AigualB => open,
        AmaiorB => open,
        AmenorB => S1
    );
    U7 : comparador_mag_3bits port map(
        A      => B1,
        O      => M1
    );
    U8 : comparador_mag_3bits port map(
        A      => B2,
        O      => M2
    );
    U9 : comparador_mag_3bits port map(
        A      => B3,
        O      => M3
    );
    U10 : comparador_mag_3bits port map(
        A      => B4,
        O      => M4
    );
    U11 : comparador_mag_3bits port map(
        A      => B5,
        O      => M5
    );
    U12 : comparador_mag_3bits port map(
        A      => B6,
        O      => M6
    );
    C1 <= NOT(S1) AND NOT(M1);
    C2 <= NOT(S2) AND NOT(M2);
    C3 <= NOT(S3) AND NOT(M3);
    C4 <= NOT(S4) AND NOT(M4);
    C5 <= NOT(S5) AND NOT(M5);
    C6 <= NOT(S6) AND NOT(M6);

    end CKT;