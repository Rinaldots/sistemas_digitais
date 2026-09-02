library ieee;
use ieee.std_logic_1164.all;

entity subtrator is
    port (
    TOT : in std_logic_vector(9 downto 0);
    B1, B2, B3, B4, B5, B6 : in std_logic_vector(2 downto 0);
    S1, S2, S3, S4, S5, S6 : in std_logic_vector(2 downto 0);
    ENABLE : in std_logic;
    B_out1, B_out2, B_out3, B_out4, B_out5, B_out6 : out std_logic_vector(2 downto 0);
    S_out1, S_out2, S_out3, S_out4, S_out5, S_out6 : out std_logic_vector(2 downto 0);
    TOT_out : out std_logic_vector(9 downto 0);
    C_Z, e_ERROR : out std_logic
    );
end subtrator;

architecture CKT of subtrator is

    component sub_1_cofre is
        port (
            M1, M2, M3, M4, M5, M6 : in std_logic;
            B1, B2, B3, B4, B5, B6 : in std_logic_vector(2 downto 0);
            NEG : in std_logic;
            C : in std_logic_vector(2 downto 0);
            B_out1, B_out2, B_out3, B_out4, B_out5, B_out6 : out std_logic_vector(2 downto 0)
        );
    end component;

    component soma_1_cofre is
        port (
            M1, M2, M3, M4, M5, M6 : in std_logic;
            S1, S2, S3, S4, S5, S6 : in std_logic_vector(2 downto 0);
            NEG : in std_logic;
            C : in std_logic_vector(2 downto 0);
            S_out1, S_out2, S_out3, S_out4, S_out5, S_out6 : out std_logic_vector(2 downto 0)
        );
    end component;

    component logica_passo is
        port (
            C1, C2, C3, C4, C5, C6, ENABLE : in std_logic;
            C : out std_logic_vector(2 downto 0);
            PASSO : out std_logic_vector(9 downto 0);
            E_error : out std_logic;
            M_1, M_2, M_3, M_4, M_5, M_6 : out std_logic
        );
    end component;

    component MUX2X10 is
        port (
            I0, I1 : in std_logic_vector(9 downto 0);
            S : in std_logic;
            Z : out std_logic_vector(9 downto 0)
        );
    end component;

    component sub_10bit is
        port (
            a : in std_logic_vector(9 downto 0);
            b : in std_logic_vector(9 downto 0);
            z : out std_logic_vector(9 downto 0);
            c_out : out std_logic
        );
    end component;

    component comp_moeda is
        port (
            TOT : in std_logic_vector(9 downto 0);
            B1, B2, B3, B4, B5, B6 : in std_logic_vector(2 downto 0);
            C1, C2, C3, C4, C5, C6 : out std_logic
        );
    end component;

    component comparador_mag_10bits is
        port (
            A : in std_logic_vector(9 downto 0);
            O : out std_logic
        );
    end component;

    signal O_S : std_logic;
    signal E_errorS : std_logic;
    signal C_1, C_2, C_3, C_4, C_5, C_6 : std_logic;
    signal M_1S, M_2S, M_3S, M_4S, M_5S, M_6S : std_logic;
    signal NEG_S : std_logic;
    signal PASSO_S : std_logic_vector(9 downto 0);
    signal SUB_S : std_logic_vector(9 downto 0);
    signal COMAND : std_logic_vector(2 downto 0);
    signal C_Z_S : std_logic;
begin
    U0 : comp_moeda
    port map(
        TOT => TOT,
        B1 => B1,
        B2 => B2,
        B3 => B3,
        B4 => B4,
        B5 => B5,
        B6 => B6,
        C1 => C_1,
        C2 => C_2,
        C3 => C_3,
        C4 => C_4,
        C5 => C_5,
        C6 => C_6
    );

    U1 : comparador_mag_10bits
    port map(
        A => TOT,
        O => O_S
    );

    U2 : logica_passo
    port map(
        C1 => C_1,
        C2 => C_2,
        C3 => C_3,
        C4 => C_4,
        C5 => C_5,
        C6 => C_6,
        ENABLE => ENABLE,
        C => COMAND,
        PASSO => PASSO_S,
        E_error => E_errorS,
        M_1 => M_1S,
        M_2 => M_2S,
        M_3 => M_3S,
        M_4 => M_4S,
        M_5 => M_5S,
        M_6 => M_6S
    );
    U3 : sub_10bit
    port map(
        a => TOT,
        b => PASSO_S,
        z => SUB_S,
        c_out => NEG_S
    );
    U4 : MUX2X10
    port map(
        I0 => SUB_S,
        I1 => "0000000000",
        S => NEG_S,
        Z => TOT_out
    );

    U5 : sub_1_cofre
    port map(
        M1 => M_1S,
        M2 => M_2S,
        M3 => M_3S,
        M4 => M_4S,
        M5 => M_5S,
        M6 => M_6S,
        B1 => B1,
        B2 => B2,
        B3 => B3,
        B4 => B4,
        B5 => B5,
        B6 => B6,
        NEG => NEG_S,
        C => COMAND,
        B_out1 => B_out1,
        B_out2 => B_out2,
        B_out3 => B_out3,
        B_out4 => B_out4,
        B_out5 => B_out5,
        B_out6 => B_out6
    );

    U6 : soma_1_cofre
    port map(
        M1 => M_1S,
        M2 => M_2S,
        M3 => M_3S,
        M4 => M_4S,
        M5 => M_5S,
        M6 => M_6S,
        S1 => S1,
        S2 => S2,
        S3 => S3,
        S4 => S4,
        S5 => S5,
        S6 => S6,
        NEG => NEG_S,
        C => COMAND,
        S_out1 => S_out1,
        S_out2 => S_out2,
        S_out3 => S_out3,
        S_out4 => S_out4,
        S_out5 => S_out5,
        S_out6 => S_out6
    );

    C_Z_S <= NEG_S or not(O_S);
    C_Z <= C_Z_S;
    e_ERROR <= E_errorS;
end CKT;