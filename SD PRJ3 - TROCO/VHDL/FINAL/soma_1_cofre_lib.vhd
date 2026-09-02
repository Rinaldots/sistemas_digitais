library ieee;
use ieee.std_logic_1164.all;
 
 entity soma_1_cofre is
     port (
         M1, M2, M3, M4, M5, M6         : in  std_logic;
         S1, S2, S3, S4, S5, S6         : in  std_logic_vector(2 downto 0);
         NEG                            : in  std_logic;
         C                                              : in    std_logic_vector(2 downto 0);
         S_out1, S_out2, S_out3, S_out4, S_out5, S_out6 : out std_logic_vector(2 downto 0)
     );
    end soma_1_cofre;

    architecture CKT of soma_1_cofre is

    signal A_S, P_S : std_logic_vector(2 downto 0);
    signal S_1, S_2, S_3, S_4, S_5, S_6 : std_logic_vector(2 downto 0);
    signal M_1, M_2, M_3, M_4, M_5, M_6 : std_logic;

    component MUX3X3 is
        port (
            I0, I1, I2, I3, I4, I5, I6, I7 : in  std_logic_vector(2 downto 0);
            S                              : in  std_logic_vector(2 downto 0);
            Z                              : out std_logic_vector(2 downto 0)
        );
    end component;

    component MUX2X3 is
        port (
            I0, I1         : in  std_logic_vector(2 downto 0);
            S              : in  std_logic;
            Z              : out std_logic_vector(2 downto 0)
        );
    end component;

    component DEMUX3X8 is
        port (
            I  : in  std_logic_vector(2 downto 0);
            S  : in  std_logic_vector(2 downto 0);
            Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7 : out std_logic_vector(2 downto 0)
        );
    end component;

    component adder_3bit is
        port (
            a     : in std_logic_vector(2 downto 0);
            b     : in std_logic_vector(2 downto 0);
            c_out : out std_logic;
            z     : out std_logic_vector(2 downto 0));
    end component;

    begin

    M_1 <= M1 OR NEG;
    M_2 <= M2 OR NEG;
    M_3 <= M3 OR NEG;
    M_4 <= M4 OR NEG;
    M_5 <= M5 OR NEG;
    M_6 <= M6 OR NEG;
    
    U1: MUX3X3 port map(
        I0 => S1,
        I1 => S2,
        I2 => S3,
        I3 => S4,
        I4 => S5,
        I5 => S6,
        I6 => "000",
        I7 => "000",
        S  => C,
        Z  => A_S
    );

    U3: adder_3bit port map(
        a     => A_S,
        b     => "001",  -- 1 
        c_out => open,
        z     => P_S
    );

    U2: DEMUX3X8 port map(
        I  => P_S,
        S  => C,
        Z0 => S_1,
        Z1 => S_2,
        Z2 => S_3,
        Z3 => S_4,
        Z4 => S_5,
        Z5 => S_6,
        Z6 => open,
        Z7 => open
    );

    U4: MUX2X3 port map(
        I0 => S_1,
        I1 => S1,
        S  => M_1,
        Z  => S_out1
    );
    U5: MUX2X3 port map(
        I0 => S_2,
        I1 => S2,
        S  => M_2,
        Z  => S_out2
    );
    U6: MUX2X3 port map(
        I0 => S_3,
        I1 => S3,
        S  => M_3,
        Z  => S_out3
    );
    U7: MUX2X3 port map(
        I0 => S_4,
        I1 => S4,
        S  => M_4,
        Z  => S_out4
    );
    U8: MUX2X3 port map(
        I0 => S_5,
        I1 => S5,
        S  => M_5,
        Z  => S_out5
    );
    U9: MUX2X3 port map(
        I0 => S_6,
        I1 => S6,
        S  => M_6,
        Z  => S_out6
    );
        
    end CKT;