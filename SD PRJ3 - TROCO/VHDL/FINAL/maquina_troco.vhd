library ieee;
use ieee.std_logic_1164.all;

entity maquina_troco is
    port (
        CLOCK : in std_logic;
        CLEAR : in std_logic;
        BUTTON : in std_logic;
        V : in std_logic_vector(9 downto 0);
        I1, I2, I3, I4, I5, I6 : out std_logic;
        C1, C2, C3, C4, C5, C6 : out std_logic;
		  LED_L 						 : out std_logic;
		  LED_CLOCK 				 : out std_logic;
		  LED_ERROR					 : out std_logic
    );
end maquina_troco;

architecture CKT of maquina_troco is
    component reg_1_10_bit is
        port (
            ck : in std_logic;
            S_0 : in std_logic_vector(1 downto 0);
            V, S_out_TOT : in std_logic_vector(9 downto 0);
            TOT_out : out std_logic_vector(9 downto 0)
        );
    end component;

    component reg_6_3_bit_moedas is
        port (
            ck : in std_logic;
            S_0 : in std_logic_vector(1 downto 0);
            S_out1, S_out2, S_out3, S_out4, S_out5, S_out6 : in std_logic_vector(2 downto 0);
            B_out1, B_out2, B_out3, B_out4, B_out5, B_out6 : out std_logic_vector(2 downto 0)
        );
    end component;

    component reg_6_3_bit_libera is
        port (
            ck : in std_logic;
            S_0 : in std_logic_vector(1 downto 0);
            S_out1, S_out2, S_out3, S_out4, S_out5, S_out6 : in std_logic_vector(2 downto 0);
            L_out1, L_out2, L_out3, L_out4, L_out5, L_out6 : in std_logic_vector(2 downto 0);
            B_out1, B_out2, B_out3, B_out4, B_out5, B_out6 : out std_logic_vector(2 downto 0)
        );
    end component;

    component subtrator is
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
    end component;

    component LIBERADOR is
        port (
            E : in std_logic;
            S1, S2, S3, S4, S5, S6 : in std_logic_vector(2 downto 0);
            S1_out, S2_out, S3_out, S4_out, S5_out, S6_out : out std_logic_vector(2 downto 0);
            I : out std_logic_vector(1 to 6);
            FIM : out std_logic
        );
    end component;

    component bloco_controle is
        port (
            ck : in std_logic;
            rst : in std_logic;
            e_ERROR : in std_logic;
            T : in std_logic;
            C_Z : in std_logic;
            FIM : in std_logic;
            CRL : in std_logic;
            q : out std_logic_vector(1 downto 0);
				LED   : out std_logic;
				LED_ERROR					 : out std_logic
            
        );
    end component;

    component botao is
        port (
            ck, rst, s : in std_logic;
            q : out std_logic);
    end component;

    component ck_div is
        port (
            ck_in : in std_logic;
            ck_out : out std_logic);
    end component;

    component comparador_mag_3bits is
        port (
            A : in std_logic_vector(2 downto 0);
            O : out std_logic
        );
    end component;

    component DEMUX4X1 is
        port (
            I : in std_logic;
            S : in std_logic_vector(1 downto 0);
            Z0, Z1, Z2, Z3 : out std_logic
        );
    end component;

    signal CK_S, BUTTON_S, CLEAR_S : std_logic; -- BUTTON_S == T_S, CLEAR_S = CRL
    signal e_ERROR_S, C_Z_S, FIM_S : std_logic;
    signal Q_S : std_logic_vector(1 downto 0);
    signal TOT_S, S_out_TOT_S : std_logic_vector(9 downto 0);
    signal B1_S, B2_S, B3_S, B4_S, B5_S, B6_S : std_logic_vector(2 downto 0);
    signal S1_S, S2_S, S3_S, S4_S, S5_S, S6_S : std_logic_vector(2 downto 0);
    signal S_out_B1_S, S_out_B2_S, S_out_B3_S, S_out_B4_S, S_out_B5_S, S_out_B6_S : std_logic_vector(2 downto 0);
    signal S_out_S1_S, S_out_S2_S, S_out_S3_S, S_out_S4_S, S_out_S5_S, S_out_S6_S : std_logic_vector(2 downto 0);
    signal L_out_S1_S, L_out_S2_S, L_out_S3_S, L_out_S4_S, L_out_S5_S, L_out_S6_S : std_logic_vector(2 downto 0);
    signal I_S : std_logic_vector(1 to 6);
    signal ENABLE_S_S, ENABLE_L_S : std_logic;
begin

    U0 : ck_div
    port map(
        ck_in => CLOCK,
        ck_out => CK_S
    );
	 LED_CLOCK <= CK_S;
    U1 : botao
    port map(
        ck => CK_S,
        rst => '0',
        s => BUTTON,
        q => BUTTON_S
    );

    U2 : botao
    port map(
        ck => CK_S,
        rst => '0',
        s => CLEAR,
        q => CLEAR_S
    );

    M1: DEMUX4X1
    port map(
        I => '1',
        S => Q_S,
        Z0 => OPEN,
        Z1 => ENABLE_S_S,
        Z2 => ENABLE_L_S,
        Z3 => OPEN
    );
    U3 : bloco_controle
	 
    port map(
        ck => CK_S,
        rst => '0',
        e_ERROR => e_ERROR_S,
        T => BUTTON_S,
        C_Z => C_Z_S,
        FIM => FIM_S,
        CRL => CLEAR_S,
        q => Q_S,
		  LED => LED_L,
		  LED_ERROR => LED_ERROR
    );

    U4 : reg_1_10_bit
    port map(
        ck => CK_S,
        S_0 => Q_S,
        V => V,
        S_out_TOT => S_out_TOT_S,
        TOT_out => TOT_S
    );

    U5 : reg_6_3_bit_moedas
    port map(
        ck => CK_S,
        S_0 => Q_S,
        S_out1 => S_out_B1_S,
        S_out2 => S_out_B2_S,
        S_out3 => S_out_B3_S,
        S_out4 => S_out_B4_S,
        S_out5 => S_out_B5_S,
        S_out6 => S_out_B6_S,
        B_out1 => B1_S,
        B_out2 => B2_S,
        B_out3 => B3_S,
        B_out4 => B4_S,
        B_out5 => B5_S,
        B_out6 => B6_S
    );

    U6 : reg_6_3_bit_libera
    port map(
        ck => CK_S,
        S_0 => Q_S,
        S_out1 => S_out_S1_S,
        S_out2 => S_out_S2_S,
        S_out3 => S_out_S3_S,
        S_out4 => S_out_S4_S,
        S_out5 => S_out_S5_S,
        S_out6 => S_out_S6_S,
        L_out1 => L_out_S1_S,
        L_out2 => L_out_S2_S,
        L_out3 => L_out_S3_S,
        L_out4 => L_out_S4_S,
        L_out5 => L_out_S5_S,
        L_out6 => L_out_S6_S,
        B_out1 => S1_S,
        B_out2 => S2_S,
        B_out3 => S3_S,
        B_out4 => S4_S,
        B_out5 => S5_S,
        B_out6 => S6_S
    );

    U7 : subtrator
    port map(
        TOT => TOT_S,
        TOT_out => S_out_TOT_S,
        B1 => B1_S,
        B2 => B2_S,
        B3 => B3_S,
        B4 => B4_S,
        B5 => B5_S,
        B6 => B6_S,
        S1 => S1_S,
        S2 => S2_S,
        S3 => S3_S,
        S4 => S4_S,
        S5 => S5_S,
        S6 => S6_S,
        ENABLE => ENABLE_S_S,
        C_Z => C_Z_S,
        e_ERROR => e_ERROR_S,
        B_out1 => S_out_B1_S,
        B_out2 => S_out_B2_S,
        B_out3 => S_out_B3_S,
        B_out4 => S_out_B4_S,
        B_out5 => S_out_B5_S,
        B_out6 => S_out_B6_S,
        S_out1 => S_out_S1_S,
        S_out2 => S_out_S2_S,
        S_out3 => S_out_S3_S,
        S_out4 => S_out_S4_S,
        S_out5 => S_out_S5_S,
        S_out6 => S_out_S6_S
    );

    U8 : LIBERADOR
    port map(
        E => ENABLE_L_S,
        S1 => S1_S,
        S2 => S2_S,
        S3 => S3_S,
        S4 => S4_S,
        S5 => S5_S,
        S6 => S6_S,
        S1_out => L_out_S1_S,
        S2_out => L_out_S2_S,
        S3_out => L_out_S3_S,
        S4_out => L_out_S4_S,
        S5_out => L_out_S5_S,
        S6_out => L_out_S6_S,
        I => I_S,
        FIM => FIM_S
    );

    I1 <= I_S(1);
    I2 <= I_S(2);
    I3 <= I_S(3);
    I4 <= I_S(4);
    I5 <= I_S(5);
    I6 <= I_S(6);

    U9 : comparador_mag_3bits
    port map(
        A => B1_S,
        O => C1
    );

    U10 : comparador_mag_3bits
    port map(
        A => B2_S,
        O => C2
    );

    U11 : comparador_mag_3bits
    port map(
        A => B3_S,
        O => C3
    );

    U12 : comparador_mag_3bits
    port map(
        A => B4_S,
        O => C4
    );

    U13 : comparador_mag_3bits
    port map(
        A => B5_S,
        O => C5
    );

    U14 : comparador_mag_3bits
    port map(
        A => B6_S,
        O => C6
    );
end CKT;