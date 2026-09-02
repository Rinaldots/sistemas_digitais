LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux_13_bit IS
    PORT (
        D_0, D_1 : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
        s_in : IN STD_LOGIC;
        D_out : OUT STD_LOGIC_VECTOR(12 DOWNTO 0)
    );
END mux_13_bit;

ARCHITECTURE CKT OF mux_13_bit IS

    COMPONENT MUX2X1 IS
        PORT (
            I0, I1 : IN STD_LOGIC;
            S : IN STD_LOGIC;
            Z : OUT STD_LOGIC
        );
    END COMPONENT;
BEGIN
    U1 : MUX2X1 PORT MAP(I0 => D_0(0), I1 => D_1(0), S => s_in, Z => D_out(0));
    U2 : MUX2X1 PORT MAP(I0 => D_0(1), I1 => D_1(1), S => s_in, Z => D_out(1));
    U3 : MUX2X1 PORT MAP(I0 => D_0(2), I1 => D_1(2), S => s_in, Z => D_out(2));
    U4 : MUX2X1 PORT MAP(I0 => D_0(3), I1 => D_1(3), S => s_in, Z => D_out(3));
    U5 : MUX2X1 PORT MAP(I0 => D_0(4), I1 => D_1(4), S => s_in, Z => D_out(4));
    U6 : MUX2X1 PORT MAP(I0 => D_0(5), I1 => D_1(5), S => s_in, Z => D_out(5));
    U7 : MUX2X1 PORT MAP(I0 => D_0(6), I1 => D_1(6), S => s_in, Z => D_out(6));
    U8 : MUX2X1 PORT MAP(I0 => D_0(7), I1 => D_1(7), S => s_in, Z => D_out(7));
    U9 : MUX2X1 PORT MAP(I0 => D_0(8), I1 => D_1(8), S => s_in, Z => D_out(8));
    U10 : MUX2X1 PORT MAP(I0 => D_0(9), I1 => D_1(9), S => s_in, Z => D_out(9));
    U11 : MUX2X1 PORT MAP(I0 => D_0(10), I1 => D_1(10), S => s_in, Z => D_out(10));
    U12 : MUX2X1 PORT MAP(I0 => D_0(11), I1 => D_1(11), S => s_in, Z => D_out(11));
    U13 : MUX2X1 PORT MAP(I0 => D_0(12), I1 => D_1(12), S => s_in, Z => D_out(12));
END CKT;