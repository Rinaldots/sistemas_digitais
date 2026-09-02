library ieee;
use ieee.std_logic_1164.all;

entity Comparar is
    port(
        E    : in  std_logic;                                 
        S1, S2, S3, S4, S5, S6 : in  std_logic_vector(2 downto 0);    
        M1, M2, M3, M4, M5, M6           : out std_logic
    );
end Comparar;

architecture CKT of Comparar is
begin
    --M1 <= E AND (NOT Sin1(0)) AND (NOT Sin1(1)) AND (NOT Sin1(2));
    --M2 <= E AND (NOT Sin2(0)) AND (NOT Sin2(1)) AND (NOT Sin2(2));
    --M3 <= E AND (NOT Sin3(0)) AND (NOT Sin3(1)) AND (NOT Sin3(2));
    --M4 <= E AND (NOT Sin4(0)) AND (NOT Sin4(1)) AND (NOT Sin4(2));
    --M5 <= E AND (NOT Sin5(0)) AND (NOT Sin5(1)) AND (NOT Sin5(2));
    --M6 <= E AND (NOT Sin6(0)) AND (NOT Sin6(1)) AND (NOT Sin6(2));

    M1 <= E AND (S1(0) OR S1(1) OR S1(2) OR '0');
    M2 <= E AND (S2(0) OR S2(1) OR S2(2) OR '0');
    M3 <= E AND (S3(0) OR S3(1) OR S3(2) OR '0');
    M4 <= E AND (S4(0) OR S4(1) OR S4(2) OR '0');
    M5 <= E AND (S5(0) OR S5(1) OR S5(2) OR '0');
    M6 <= E AND (S6(0) OR S6(1) OR S6(2) OR '0');

end CKT;
