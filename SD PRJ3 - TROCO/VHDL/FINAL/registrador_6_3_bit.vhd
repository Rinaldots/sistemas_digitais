library ieee;
use ieee.std_logic_1164.all;
 
 entity reg_6_3_bit_moedas is
     port (
        ck                                             : in   std_logic;
        S_0                                            : in   std_logic_vector(1 downto 0);
        S_out1, S_out2, S_out3, S_out4, S_out5, S_out6 : in   std_logic_vector(2 downto 0);       
        B_out1, B_out2, B_out3, B_out4, B_out5, B_out6 : out  std_logic_vector(2 downto 0)
     );
    end reg_6_3_bit_moedas;

    architecture CKT of reg_6_3_bit_moedas is

    signal REG1, REG2, REG3, REG4, REG5, REG6 : std_logic_vector(2 downto 0);
    signal S1, S2, S3, S4, S5, S6 : std_logic_vector(2 downto 0);
    signal A10 : std_logic_vector(2 downto 0);

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

    A10 <= "111";

    U1: MUX2X3_3 port map(
        I0 => REG1,
        I1 => S_out1,
        I2 => REG1,
        I3 => A10,
        S  => S_0,
        Z  => S1
    );

    U2: bit3_flip_d port map(
        ck => ck,
        E  => S1,
        S  => REG1
    );

    U3: MUX2X3_3 port map(
        I0 => REG2,
        I1 => S_out2,
        I2 => REG2,
        I3 => A10,
        S  => S_0,
        Z  => S2
    );

    U4: bit3_flip_d port map(
        ck => ck,
        E  => S2,
        S  => REG2
    );

    U5: MUX2X3_3 port map(
        I0 => REG3,
        I1 => S_out3,
        I2 => REG3,
        I3 => A10,
        S  => S_0,
        Z  => S3
    );

    U6: bit3_flip_d port map(
        ck => ck,
        E  => S3,
        S  => REG3
    );

    U7: MUX2X3_3 port map(
        I0 => REG4,
        I1 => S_out4,
        I2 => REG4,
        I3 => A10,
        S  => S_0,
        Z  => S4
    );

    U8: bit3_flip_d port map(
        ck => ck,
        E  => S4,
        S  => REG4
    );

    U9: MUX2X3_3 port map(
        I0 => REG5,
        I1 => S_out5,
        I2 => REG5,
        I3 => A10,
        S  => S_0,
        Z  => S5
    );

    U10: bit3_flip_d port map(
        ck => ck,
        E  => S5,
        S  => REG5
    );

    U11: MUX2X3_3 port map(
        I0 => REG6,
        I1 => S_out6,
        I2 => REG6,
        I3 => A10,
        S  => S_0,
        Z  => S6
    );

    U12: bit3_flip_d port map(
        ck => ck,
        E  => S6,
        S  => REG6
    );

    -- drive outputs from internal registers
    B_out1 <= REG1;
    B_out2 <= REG2;
    B_out3 <= REG3;
    B_out4 <= REG4;
    B_out5 <= REG5;
    B_out6 <= REG6;

    end CKT;