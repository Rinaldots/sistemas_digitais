library ieee;
use ieee.std_logic_1164.all;

entity comparador_4bits is
    port (
        A, B      : in  std_logic_vector(3 downto 0);
        AigualB   : out std_logic;
        AmaiorB   : out std_logic;
        AmenorB   : out std_logic
    );
end comparador_4bits;

architecture rtl of comparador_4bits is
    signal x : std_logic_vector(3 downto 0);
    signal igual, maior, menor : std_logic;
begin
    -- x(i) = 1 quando A(i) = B(i)
    x <= not (A xor B);

    -- A igual a B se todos os bits forem iguais
    igual <= x(3) and x(2) and x(1) and x(0);

    -- A maior que B (do bit mais significativo para o menos)
    maior <= (A(3) and not B(3)) or
             (x(3) and A(2) and not B(2)) or
             (x(3) and x(2) and A(1) and not B(1)) or
             (x(3) and x(2) and x(1) and A(0) and not B(0));

    -- A menor que B (simetricamente)
    menor <= (not A(3) and B(3)) or
             (x(3) and not A(2) and B(2)) or
             (x(3) and x(2) and not A(1) and B(1)) or
             (x(3) and x(2) and x(1) and not A(0) and B(0));

    -- Saídas finais
    AigualB <= igual;
    AmaiorB <= maior;
    AmenorB <= menor;
end rtl;
