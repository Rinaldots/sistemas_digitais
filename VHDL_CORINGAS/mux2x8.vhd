LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux_8_bit IS
    PORT (
        D_0, D_1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        s_in : IN STD_LOGIC;
        D_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END mux_8_bit;

ARCHITECTURE CKT OF mux_8_bit IS
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
    
END CKT;