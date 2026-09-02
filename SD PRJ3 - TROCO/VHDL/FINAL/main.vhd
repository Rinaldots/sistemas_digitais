library ieee;
use ieee.std_logic_1164.all;

entity main is
    port (
        CLOCK : in std_logic;
        CLEAR : in std_logic;
        BUTTON : in std_logic;
        V : in std_logic_vector(9 downto 0);
        I1, I2, I3, I4, I5, I6 : out std_logic;
        C1, C2, C3, C4, C5, C6 : out std_logic;
		  LED_L						 : out std_logic;
		  LED_CLOCK					 : out std_logic;
		  LED_ERROR					 : out std_logic
    );
end main;

architecture CKT of main is
    component maquina_troco is
        port (
            CLOCK : in std_logic;
            CLEAR : in std_logic;
            BUTTON : in std_logic;
            V : in std_logic_vector(9 downto 0);
            I1, I2, I3, I4, I5, I6 : out std_logic;
            C1, C2, C3, C4, C5, C6 : out std_logic;
				LED_L 					  : out std_logic;
				LED_CLOCK				  : out std_logic;
				LED_ERROR					 : out std_logic
        );
    end component;

    signal CLEAR_S, BUTTON_S : std_logic;
    signal V_S : std_logic_vector(9 downto 0);
    signal I1_S, I2_S, I3_S, I4_S, I5_S, I6_S : std_logic;
    signal C1_S, C2_S, C3_S, C4_S, C5_S, C6_S : std_logic;
	 signal LED                                : std_logic;
begin
    
    CLEAR_S <= not(CLEAR);
    BUTTON_S <= not(BUTTON);
    V_S <= V;
    U0 : maquina_troco
    port map(
        CLOCK => CLOCK,
        CLEAR => CLEAR_S,
        BUTTON => BUTTON_S,
        V => V_S,
        I1 => I1_S,
        I2 => I2_S,
        I3 => I3_S,
        I4 => I4_S,
        I5 => I5_S,
        I6 => I6_S,
        C1 => C1_S,
        C2 => C2_S,
        C3 => C3_S,
        C4 => C4_S,
        C5 => C5_S,
        C6 => C6_S,
		  LED_L => LED,
		  LED_CLOCK => LED_CLOCK,
		  LED_ERROR => LED_ERROR
    );
	 LED_L <= LED;
    I1 <= I1_S;
    I2 <= I2_S;
    I3 <= I3_S;
    I4 <= I4_S;
    I5 <= I5_S;
    I6 <= I6_S;
    C1 <= C1_S;
    C2 <= C2_S;
    C3 <= C3_S;
    C4 <= C4_S;
    C5 <= C5_S;
    C6 <= C6_S;
end CKT;