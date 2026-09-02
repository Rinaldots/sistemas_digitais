LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY lifo_completo IS
    PORT (
        ck : IN STD_LOGIC;
        wr : IN STD_LOGIC;
        rd : IN STD_LOGIC;
        clr_lifo : IN STD_LOGIC;
        w_data : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
        fu : OUT STD_LOGIC;
        em : OUT STD_LOGIC;
        a, b, c, d : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END lifo_completo;

ARCHITECTURE CKT OF lifo_completo IS
    COMPONENT lifo IS
        PORT (
            ck : IN STD_LOGIC;
            wr : IN STD_LOGIC;
            rd : IN STD_LOGIC;
            clr_lifo : IN STD_LOGIC;
            w_data : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
            r_data : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
            fu : OUT STD_LOGIC;
            em : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT botao
        PORT (
            ck, rst, s : IN STD_LOGIC;
            q : OUT STD_LOGIC);
    END COMPONENT;
    COMPONENT double_dabble
        PORT (
            a : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
            a_out, b_out, c_out, d_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;
    COMPONENT bcd_7seg
        PORT (
            s : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            z : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
    END COMPONENT;

    COMPONENT ck_div IS
        PORT (
            ck_in : IN STD_LOGIC;
            ck_out : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL wr1, rd1, clr_lifo1, ck1 : STD_LOGIC;
    SIGNAL a_out1, b_out1, c_out1, d_out1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL r_data1 : STD_LOGIC_VECTOR(12 DOWNTO 0);

BEGIN

    U10 : ck_div
    PORT MAP(
        ck_in => ck,
        ck_out => ck1
    );
    U1 : lifo
    PORT MAP(
        ck => ck,
        wr => wr1,
        rd => rd1,
        clr_lifo => clr_lifo1,
        w_data => w_data,
        r_data => r_data1,
        fu => fu,
        em => em
    );
    -- Botão de escrita
    U2 : botao
    PORT MAP(
        ck => ck,
        rst => '0',
        s => wr,
        q => wr1
    );
    -- Botão de leitura
    U3 : botao
    PORT MAP(
        ck => ck,
        rst => '0',
        s => rd,
        q => rd1
    );
    -- Botão de CLEAR
    U4 : botao
    PORT MAP(
        ck => ck,
        rst => '0',
        s => clr_lifo,
        q => clr_lifo1
    );
    U5 : double_dabble
    PORT MAP(
        a => r_data1,
        a_out => a_out1,
        b_out => b_out1,
        c_out => c_out1,
        d_out => d_out1
    );
    U6 : bcd_7seg
    PORT MAP(
        s => a_out1,
        z => a
    );
    U7 : bcd_7seg
    PORT MAP(
        s => b_out1,
        z => b
    );
    U8 : bcd_7seg
    PORT MAP(
        s => c_out1,
        z => c
    );
    U9 : bcd_7seg
    PORT MAP(
        s => d_out1,
        z => d
    );

END CKT;