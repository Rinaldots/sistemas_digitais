LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY LETRAS IS
    PORT (
        SEL : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        COL : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        LEDR : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        LEDG : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END LETRAS;

ARCHITECTURE CKT OF LETRAS IS

    COMPONENT MUX16X35 IS
        PORT (
            I0, I1, I2, I3, I4, I5, I6, I7,
            I8, I9, I10, I11, I12, I13, I14, I15 : IN STD_LOGIC_VECTOR(34 DOWNTO 0);
            S : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            Z : OUT STD_LOGIC_VECTOR(34 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT MUX8X8 IS
        PORT (
            I0, I1, I2, I3, I4, I5, I6, I7 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            S : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            Z : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    CONSTANT DIGITO_0 : STD_LOGIC_VECTOR(34 DOWNTO 0) :=    "0111110" &
                                                            "1000101" &
                                                            "1001001" &
                                                            "1010001" &
                                                            "0111110";

    CONSTANT DIGITO_1 : STD_LOGIC_VECTOR(34 DOWNTO 0) :=    "0000000" &
                                                            "1000000" &
                                                            "1111111" &
                                                            "1000010" &
                                                            "0000000";

    CONSTANT DIGITO_2 : STD_LOGIC_VECTOR(34 DOWNTO 0) :=    "1000110" &
                                                            "1001001" &
                                                            "1001001" &
                                                            "1010001" &
                                                            "1100010";

    CONSTANT DIGITO_3 : STD_LOGIC_VECTOR(34 DOWNTO 0) :=    "0110110" &
                                                            "1001001" &
                                                            "1001001" &
                                                            "1001001" &
                                                            "0100010";

    CONSTANT DIGITO_4 : STD_LOGIC_VECTOR(34 DOWNTO 0) :=    "0010000" &
                                                            "1111111" &
                                                            "0010010" &
                                                            "0010100" &
                                                            "0011000";

    CONSTANT DIGITO_5 : STD_LOGIC_VECTOR(34 DOWNTO 0) :=    "0111001" &
                                                            "1000101" &
                                                            "1000101" &
                                                            "1000101" &
                                                            "0100111";

    CONSTANT DIGITO_6 : STD_LOGIC_VECTOR(34 DOWNTO 0) :=    "0110000" &
                                                            "1001001" &
                                                            "1001001" &
                                                            "1001010" &
                                                            "0111100";

    CONSTANT DIGITO_7 : STD_LOGIC_VECTOR(34 DOWNTO 0) :=    "0000011" &
                                                            "0000101" &
                                                            "0001001" &
                                                            "1110001" &
                                                            "0000001";

    CONSTANT DIGITO_8 : STD_LOGIC_VECTOR(34 DOWNTO 0) :=    "0110110" &
                                                            "1001001" &
                                                            "1001001" &
                                                            "0110110" &
                                                            "0000000";

    CONSTANT DIGITO_9 : STD_LOGIC_VECTOR(34 DOWNTO 0) :=    "0011110" &
                                                            "0101001" &
                                                            "1001001" &
                                                            "1001001" &
                                                            "0000110";

    CONSTANT DIGITO_A : STD_LOGIC_VECTOR(34 DOWNTO 0) :=    "1000000" &
                                                            "1111000" &
                                                            "1010100" &
                                                            "1010100" &
                                                            "0100000";

    CONSTANT DIGITO_B : STD_LOGIC_VECTOR(34 DOWNTO 0) :=    "0111000" &
                                                            "1000100" &
                                                            "1000100" &
                                                            "1001000" &
                                                            "1111111";

    CONSTANT DIGITO_C : STD_LOGIC_VECTOR(34 DOWNTO 0) :=    "0100000" &
                                                            "1000100" &
                                                            "1000100" &
                                                            "1000100" &
                                                            "0111000";

    CONSTANT DIGITO_D : STD_LOGIC_VECTOR(34 DOWNTO 0) :=    "1111111" &
                                                            "1001000" &
                                                            "1000100" &
                                                            "1000100" &
                                                            "0111000";

    CONSTANT DIGITO_E : STD_LOGIC_VECTOR(34 DOWNTO 0) :=    "0001000" &
                                                            "1010100" &
                                                            "1010100" &
                                                            "1010100" &
                                                            "0111000";

    CONSTANT DIGITO_F : STD_LOGIC_VECTOR(34 DOWNTO 0) :=    "0000010" &
                                                            "0001001" &
                                                            "1111110" &
                                                            "0001000" &
                                                            "0000000";

    CONSTANT VALOR_BRANCO : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";

    SIGNAL DIGITO_SEL : STD_LOGIC_VECTOR(34 DOWNTO 0);

    SIGNAL COL0, COL1, COL2, COL3, COL4, BRANCO : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
    
    U0 : MUX16X35 PORT MAP(
        DIGITO_0, DIGITO_1, DIGITO_2, DIGITO_3, DIGITO_4, DIGITO_5, DIGITO_6, DIGITO_7,
        DIGITO_8, DIGITO_9, DIGITO_A, DIGITO_B, DIGITO_C, DIGITO_D, DIGITO_E, DIGITO_F,
        SEL, 
        DIGITO_SEL
    );

    
    COL0 <= DIGITO_SEL(34 DOWNTO 28) & '0';
    COL1 <= DIGITO_SEL(27 DOWNTO 21) & '0';
    COL2 <= DIGITO_SEL(20 DOWNTO 14) & '0';
    COL3 <= DIGITO_SEL(13 DOWNTO 7) & '0';
    COL4 <= DIGITO_SEL(6 DOWNTO 0) & '0';
    

    U1 : MUX8X8 PORT MAP(
        VALOR_BRANCO, VALOR_BRANCO, COL0, COL1, COL2, COL3, COL4, VALOR_BRANCO,
        COL, 
        LEDR
    );
    LEDG <= '0' & '0' & COL0(0) & COL1(0) & COL2(0) & COL3(0) & COL4(0) & '0'; 


END CKT;
