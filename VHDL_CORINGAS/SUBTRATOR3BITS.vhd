library ieee;
use ieee.std_logic_1164.all;

entity Subtrator3Bits is
    port(
        A    : in  std_logic_vector(2 downto 0);
        B    : in  std_logic_vector(2 downto 0);
        Bn   : buffer std_logic_vector(2 downto 0); -- guarda o NOT de B
        Cout : out std_logic;
        S    : out std_logic_vector(2 downto 0)
    );
end Subtrator3Bits;

architecture CKT of Subtrator3Bits is
    component Somador1Bits is
        port(
            A   : in  std_logic;
            B   : in  std_logic;
            Cin : in  std_logic;
            Cout: out std_logic;
            S   : out std_logic
        );
    end component;

    signal C1, C2 : std_logic;
    signal Cin_interno : std_logic := '1'; 

begin
    -- gera o complemento de B
    Bn <= not B;

    U0: Somador1Bits port map (A=>A(0), B=>Bn(0), Cin=>Cin_interno, Cout=>C1, S=>S(0));
    U1: Somador1Bits port map (A=>A(1), B=>Bn(1), Cin=>C1, Cout=>C2, S=>S(1));
    U2: Somador1Bits port map (A=>A(2), B=>Bn(2), Cin=>C2, Cout=>Cout, S=>S(2));

end CKT;

