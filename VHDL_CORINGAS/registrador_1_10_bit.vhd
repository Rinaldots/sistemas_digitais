library ieee;
use ieee.std_logic_1164.all;
 
 entity reg_1_10_bit is
     port (
        ck                                             : in   std_logic;
        S_0                                            : in   std_logic_vector(1 downto 0);
        V     ,S_out_TOT                               : in   std_logic_vector(9 downto 0);
        TOT_out                                        : out  std_logic_vector(9 downto 0)
     );
    end reg_1_10_bit;

    architecture CKT of reg_1_10_bit is

    signal REG1 : std_logic_vector(9 downto 0);
    signal S1   : std_logic_vector(9 downto 0);

    component MUX2X10_2 is
        port (
            I0, I1, I2, I3         : in  std_logic_vector(9 downto 0);
            S                      : in  std_logic_vector(1 downto 0);
            Z                      : out std_logic_vector(9 downto 0)
        );
    end component;

    component  bit10_flip_d is
        port (
            ck           : in std_logic;
            E            : in std_logic_vector(9 downto 0); -- ENTRADA
            S            : out std_logic_vector(9 downto 0) -- SAIDA
        );
    end component;

    begin

    U1: MUX2X10_2 port map(
        I0 => V,
        I1 => S_out_TOT,
        I2 => REG1,
        I3 => V,
        S  => S_0,
        Z  => S1
    );

    U2: bit10_flip_d port map(
        ck  => ck,
        E   => S1,
        S   => REG1
    );
    TOT_out <= REG1;



    end CKT;