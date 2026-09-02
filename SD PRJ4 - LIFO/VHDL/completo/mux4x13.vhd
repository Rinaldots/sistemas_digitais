LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux_4_13_bit IS
    PORT (
        D_0, D_1, D_2, D_3, D_4, D_5, D_6, D_7, D_8, D_9, D_10, D_11, D_12, D_13, D_14, D_15 : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
        s_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        D_out : OUT STD_LOGIC_VECTOR(12 DOWNTO 0)
    );
END mux_4_13_bit;

ARCHITECTURE CKT OF mux_4_13_bit IS

    COMPONENT mux_13_bit IS
        PORT (
            D_0, D_1 : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
            s_in : IN STD_LOGIC;
            D_out : OUT STD_LOGIC_VECTOR(12 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL MUX1_OUT0, MUX1_OUT1, MUX1_OUT2, MUX1_OUT3, MUX1_OUT4, MUX1_OUT5, MUX1_OUT6, MUX1_OUT7 : STD_LOGIC_VECTOR(12 DOWNTO 0);
    SIGNAL MUX2_OUT0, MUX2_OUT1, MUX2_OUT2, MUX2_OUT3 : STD_LOGIC_VECTOR(12 DOWNTO 0);
    SIGNAL MUX3_OUT0, MUX3_OUT1 : STD_LOGIC_VECTOR(12 DOWNTO 0);
BEGIN
    U1 : mux_13_bit
    PORT MAP(
        D_0 => D_0,
        D_1 => D_1,
        s_in => s_in(0),
        D_out => MUX1_OUT0
    );

    U2 : mux_13_bit
    PORT MAP(
        D_0 => D_2,
        D_1 => D_3,
        s_in => s_in(0),
        D_out => MUX1_OUT1
    );

    U3 : mux_13_bit
    PORT MAP(
        D_0 => D_4,
        D_1 => D_5,
        s_in => s_in(0),
        D_out => MUX1_OUT2
    );
    U4 : mux_13_bit
    PORT MAP(
        D_0 => D_6,
        D_1 => D_7,
        s_in => s_in(0),
        D_out => MUX1_OUT3
    );
    U5 : mux_13_bit
    PORT MAP(
        D_0 => D_8,
        D_1 => D_9,
        s_in => s_in(0),
        D_out => MUX1_OUT4
    );
    U6 : mux_13_bit
    PORT MAP(
        D_0 => D_10,
        D_1 => D_11,
        s_in => s_in(0),
        D_out => MUX1_OUT5
    );
    U7 : mux_13_bit
    PORT MAP(
        D_0 => D_12,
        D_1 => D_13,
        s_in => s_in(0),
        D_out => MUX1_OUT6
    );
    U8 : mux_13_bit
    PORT MAP(
        D_0 => D_14,
        D_1 => D_15,
        s_in => s_in(0),
        D_out => MUX1_OUT7
    );
    U9 : mux_13_bit
    PORT MAP(
        D_0 => MUX1_OUT0,
        D_1 => MUX1_OUT1,
        s_in => s_in(1),
        D_out => MUX2_OUT0
    );
    U10 : mux_13_bit
    PORT MAP(
        D_0 => MUX1_OUT2,
        D_1 => MUX1_OUT3,
        s_in => s_in(1),
        D_out => MUX2_OUT1
    );
    U11 : mux_13_bit
    PORT MAP(
        D_0 => MUX1_OUT4,
        D_1 => MUX1_OUT5,
        s_in => s_in(1),
        D_out => MUX2_OUT2
    );
    U12 : mux_13_bit
    PORT MAP(
        D_0 => MUX1_OUT6,
        D_1 => MUX1_OUT7,
        s_in => s_in(1),
        D_out => MUX2_OUT3
    );
    U13 : mux_13_bit
    PORT MAP(
        D_0 => MUX2_OUT0,
        D_1 => MUX2_OUT1,
        s_in => s_in(2),
        D_out => MUX3_OUT0
    );
    U14 : mux_13_bit
    PORT MAP(
        D_0 => MUX2_OUT2,
        D_1 => MUX2_OUT3,
        s_in => s_in(2),
        D_out => MUX3_OUT1
    );
    U15 : mux_13_bit
    PORT MAP(
        D_0 => MUX3_OUT0,
        D_1 => MUX3_OUT1,
        s_in => s_in(3),
        D_out => D_out
    );

END CKT;