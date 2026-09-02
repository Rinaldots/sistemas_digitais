library ieee;
use ieee.std_logic_1164.all;

entity LIBERADOR is
    port(
        E : in std_logic; 
        S1, S2, S3, S4, S5, S6 : in std_logic_vector(2 downto 0); 
        S1_out, S2_out, S3_out, S4_out, S5_out, S6_out : out std_logic_vector(2 downto 0); 
        I : out std_logic_vector(1 to 6); 
        FIM : out std_logic
    );
end LIBERADOR;

architecture CKT of LIBERADOR is
    
    component comparador_mag_3bits
        port (
            A       : in  std_logic_vector(2 downto 0);
            O       : out std_logic
        );
    end component;

    component MUX2X3 is
        port (
            I0, I1         : in  std_logic_vector(2 downto 0);
            S              : in  std_logic;
            Z              : out std_logic_vector(2 downto 0)
        );
    end component;

    component adder_3bit is
        port (
            a     : in std_logic_vector(2 downto 0);
            b     : in std_logic_vector(2 downto 0);
            c_out : out std_logic;
            z     : out std_logic_vector(2 downto 0));
    end component;


    signal M : std_logic_vector(1 to 6);
    signal M_S : std_logic_vector(1 to 6);
    signal M1_S, M2_S, M3_S, M4_S, M5_S, M6_S : std_logic_vector(2 downto 0);

begin

    U_COMP1: comparador_mag_3bits
        port map (
            A    => S1,
            O    => M(1)
        );

    U_COMP2: comparador_mag_3bits
        port map (
            A    => S2,
            O    => M(2)
        );

    U_COMP3: comparador_mag_3bits
        port map (
            A    => S3,
            O    => M(3)
        );

    U_COMP4: comparador_mag_3bits
        port map (
            A    => S4,
            O    => M(4)
        );

    U_COMP5: comparador_mag_3bits
        port map (
            A    => S5,
            O    => M(5)
        );

    U_COMP6: comparador_mag_3bits
        port map (
            A    => S6,
            O    => M(6)
        );
    M_S(1) <= NOT(M(1)) AND E;
    M_S(2) <= NOT(M(2)) AND E;
    M_S(3) <= NOT(M(3)) AND E;
    M_S(4) <= NOT(M(4)) AND E;
    M_S(5) <= NOT(M(5)) AND E;
    M_S(6) <= NOT(M(6)) AND E;

    U_SUB1: adder_3bit
        port map (
            a     => S1,
            b     => "111",
            c_out => open,
            z     => M1_S
        );
    U_SUB2: adder_3bit
        port map (
            a     => S2,
            b     => "111",
            c_out => open,
            z     => M2_S
        );
    U_SUB3: adder_3bit
        port map (
            a     => S3,
            b     => "111",
            c_out => open,
            z     => M3_S
        );
    U_SUB4: adder_3bit
        port map (
            a     => S4,
            b     => "111",
            c_out => open,
            z     => M4_S
        );
    U_SUB5: adder_3bit
        port map (
            a     => S5,
            b     => "111",
            c_out => open,
            z     => M5_S
        );
    U_SUB6: adder_3bit
        port map (
            a     => S6,
            b     => "111",
            c_out => open,
            z     => M6_S
        );
    U_MUX1: MUX2X3
        port map (
            I0 => S1,
            I1 => M1_S,
            S  => M_S(1),
            Z  => S1_out
        );
    U_MUX2: MUX2X3
        port map (
            I0 => S2,
            I1 => M2_S,
            S  => M_S(2),
            Z  => S2_out
        );
    U_MUX3: MUX2X3
        port map (
            I0 => S3,
            I1 => M3_S,
            S  => M_S(3),
            Z  => S3_out
        );
    U_MUX4: MUX2X3
        port map (
            I0 => S4,
            I1 => M4_S,
            S  => M_S(4),
            Z  => S4_out
        );
    U_MUX5: MUX2X3
        port map (
            I0 => S5,
            I1 => M5_S,
            S  => M_S(5),
            Z  => S5_out
        );
    U_MUX6: MUX2X3
        port map (
            I0 => S6,
            I1 => M6_S,
            S  => M_S(6),
            Z  => S6_out
        );
    I(1) <= M_S(1);
    I(2) <= M_S(2);
    I(3) <= M_S(3);
    I(4) <= M_S(4);
    I(5) <= M_S(5);
    I(6) <= M_S(6);
    FIM <= not(M_S(1) or M_S(2) or M_S(3) or M_S(4) or M_S(5) or M_S(6)) AND E;
end CKT;

