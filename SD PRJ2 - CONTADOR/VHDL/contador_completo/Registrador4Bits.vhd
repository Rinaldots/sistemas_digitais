library ieee;
use ieee.std_logic_1164.all;

entity Registrador4Bits is
    port (
        ck, clr, set : in std_logic;
        S            : in std_logic_vector(1 downto 0); -- SELETOR DO MUX
        Z, W         : in std_logic_vector(3 downto 0); -- ENTRADAS CLEAR
        A            : in std_logic_vector(3 downto 0); -- ENTRADA PARALELA A
        Q            : out std_logic_vector(3 downto 0) -- SAIDA DO REGISTRADOR
    );
end Registrador4Bits;

architecture CKT of Registrador4Bits is

    component MUX4X1 is
        port (
            I0, I1, I2, I3 : in std_logic;                    --ENTRADAS DO MUX
            S              : in std_logic_vector(1 downto 0); --SELETOR DO MUX
            Z              : out std_logic                    --SA�DA DO MUX
        );
    end component;

    component ffd is
        port (
            ck, clr, set, d : in std_logic; --ENTRADAS DO FF
            q               : out std_logic --SA�DA DO FF
        );
    end component;

    signal X : std_logic_vector(3 downto 0); -- SINAL DE SAIDA DOS FLIP-FLOPS
    signal D : std_logic_vector(3 downto 0); -- SINAL DE ENTRADA DOS FLIP-FLOPS

begin

    M0  : MUX4X1 port map(X(0), A(0), Z(0), W(0), S, D(0)); --BIT 0
    FF0 : ffd port map(ck, '1', '1', D(0), X(0));

    M1  : MUX4X1 port map(X(1), A(1), Z(1), W(1), S, D(1)); --BIT 1
    FF1 : ffd port map(ck, '1', '1', D(1), X(1));

    M2  : MUX4X1 port map(X(2), A(2), Z(2), W(2), S, D(2)); --BIT 2
    FF2 : ffd port map(ck, '1', '1', D(2), X(2));

    M3  : MUX4X1 port map(X(3), A(3), Z(3), W(3), S, D(3)); --BIT 3
    FF3 : ffd port map(ck, '1', '1', D(3), X(3));

    Q <= X; --SA�DA DO REGISTRADOR

end CKT;