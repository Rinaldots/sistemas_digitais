LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY data_path IS
    PORT (
        ck : IN STD_LOGIC;
        clr_reg : IN STD_LOGIC;
        w_data : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
        w_reg : IN STD_LOGIC;
        r_reg : IN STD_LOGIC;
        s_in : IN STD_LOGIC;
        r_data : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
        comp : OUT STD_LOGIC
    );
END data_path;

ARCHITECTURE CKT OF data_path IS
    COMPONENT reg_4_bit is
    PORT (
		ck : IN STD_LOGIC;
		clr : IN STD_LOGIC;
		en : IN STD_LOGIC;
		d : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
    end COMPONENT;
    COMPONENT MUX2X1 IS
        PORT (
            I0, I1 : IN STD_LOGIC;
            S : IN STD_LOGIC;
            Z : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT adder_4bit IS
        PORT (
            a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            z : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT mux_4_bit IS
        PORT (
            D_0, D_1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            s_in : IN STD_LOGIC;
            D_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT comparador_zero IS
        PORT (
            a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            z : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT banco_registradores IS
        PORT (
            w_reg : IN STD_LOGIC; -- habilita escrita
            r_reg : IN STD_LOGIC; -- habilita leitura
            clr : IN STD_LOGIC; -- reset global
            ck : IN STD_LOGIC; -- clock
            count : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- endereço do registrador
            w_data : IN STD_LOGIC_VECTOR(12 DOWNTO 0); -- dados de entrada
            r_data : OUT STD_LOGIC_VECTOR(12 DOWNTO 0) -- dados de saída
        );
    END COMPONENT;

    SIGNAL enable_counter : STD_LOGIC;
    SIGNAL c_1, c_9,pass, index, c_dt, count1 : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    c_1(0) <= '1';
    c_1(1) <= '0';
    c_1(2) <= '0';
    c_1(3) <= '0';
    c_9(0) <= '1';
    c_9(1) <= '1';
    c_9(2) <= '1';
    c_9(3) <= '1';
    enable_counter <= w_reg OR r_reg;

    U1 : mux_4_bit
    PORT MAP(
        D_0 => c_1,
        D_1 => c_9,
        s_in => s_in,
        D_out => pass
    );
    U2 : mux_4_bit
    PORT MAP(
        D_0 => count1,
        D_1 => c_dt,
        s_in => s_in,
        D_out => index
    );
    U3 : reg_4_bit
    PORT MAP(
        ck => ck,
        en => enable_counter,
        clr => clr_reg,
        d => c_dt,
        q => count1
    );
    U4 : adder_4bit
    PORT MAP(
        a => count1,
        b => pass,
        z => c_dt
    );
    u5 : comparador_zero
    PORT MAP(
        a => count1,
        z => comp
    );
    u6 : banco_registradores
    PORT MAP(
        w_reg => w_reg,
        r_reg => r_reg,
        clr => clr_reg,
        ck => ck,
        count => index,
        w_data => w_data,
        r_data => r_data
    );

END CKT;