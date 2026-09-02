LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY lifo IS
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
END lifo;

ARCHITECTURE CKT OF lifo IS
    COMPONENT data_path IS
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
    END COMPONENT;
    COMPONENT controle IS
        PORT (
            ck, wr, rd, clr_lifo, comp : IN STD_LOGIC;
            s_in, clr_reg, w_reg, r_reg, fu, em : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL s_in1, clr_reg1, w_reg1, r_reg1, comp1 : STD_LOGIC;
BEGIN
    U1 : data_path
    PORT MAP(
        ck => ck,
        clr_reg => clr_reg1,
        w_data => w_data,
        w_reg => w_reg1,
        r_reg => r_reg1,
        s_in => s_in1,
        r_data => r_data,
        comp => comp1
    );

    U2 : controle
    PORT MAP(
        ck => ck,
        wr => wr,
        rd => rd,
        clr_lifo => clr_lifo,
        comp => comp1,
        s_in => s_in1,
        clr_reg => clr_reg1,
        w_reg => w_reg1,
        r_reg => r_reg1,
        fu => fu,
        em => em
    );
END CKT;