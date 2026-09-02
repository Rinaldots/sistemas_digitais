library ieee;
use ieee.std_logic_1164.all;
 
 entity reg_6_3_bit_libera is
     port (
        ck                                              : in   std_logic;
        S_0                                            : in   std_logic_vector(1 downto 0);
        S_out1, S_out2, S_out3, S_out4, S_out5, S_out6 : in   std_logic_vector(2 downto 0);
        L_out1, L_out2, L_out3, L_out4, L_out5, L_out6 : in   std_logic_vector(2 downto 0);       
        B_out1, B_out2, B_out3, B_out4, B_out5, B_out6 : out  std_logic_vector(2 downto 0)
     );
    end reg_6_3_bit_libera;

    architecture CKT of reg_6_3_bit_libera is

    signal S1, S2, S3, S4, S5, S6 : std_logic_vector(2 downto 0);
    signal A0 : std_logic_vector(2 downto 0);

    component MUX2X3_3 is
        port (
            I0, I1, I2, I3                 : in  std_logic_vector(2 downto 0);
            S                              : in  std_logic_vector(1 downto 0);
            Z                              : out std_logic_vector(2 downto 0)
        );
    end component;

    component  bit3_flip_d is
        port (
            ck           : in std_logic;
            E            : in std_logic_vector(2 downto 0); -- ENTRADA
            S            : out std_logic_vector(2 downto 0) -- SAIDA
        );
    end component;



    begin
    A0 <= "000";
    U1: MUX2X3_3 port map(
        I0 => A0,
        I1 => S_out1,
        I2 => L_out1,
        I3 => A0,
        S  => S_0,
        Z  => S1
    );

    U2: bit3_flip_d port map(
        ck => ck,
        E  => S1,
        S  => B_out1
    );

    U3: MUX2X3_3 port map(
        I0 => A0,
        I1 => S_out2,
        I2 => L_out2,
        I3 => A0,
        S  => S_0,
        Z  => S2
        
    );

    U4: bit3_flip_d port map(
        ck => ck,
        E  => S2,
        S  => B_out2
    );

    U5: MUX2X3_3 port map(
        I0 => A0,
        I1 => S_out3,
        I2 => L_out3,
        I3 => A0,
        S  => S_0,
        Z  => S3

    );

    U6: bit3_flip_d port map(
        ck => ck,
        E  => S3,
        S  => B_out3
    );

    U7: MUX2X3_3 port map(
        I0 => A0,
        I1 => S_out4,
        I2 => L_out4,
        I3 => A0,
        S  => S_0,
        Z  => S4

    );

    U8: bit3_flip_d port map(
        ck => ck,
        E  => S4,
        S  => B_out4
    );

    U9: MUX2X3_3 port map(
        I0 => A0,
        I1 => S_out5,
        I2 => L_out5,
        I3 => A0,
        S  => S_0,
        Z  => S5

    );

    U10: bit3_flip_d port map(
        ck => ck,
        E  => S5,
        S  => B_out5
    );

    U11: MUX2X3_3 port map(
        I0 => A0,
        I1 => S_out6,
        I2 => L_out6,
        I3 => A0,
        S  => S_0,
        Z  => S6

    );

    U12: bit3_flip_d port map(
        ck => ck,
        E  => S6,
        S  => B_out6
    );

    end CKT;