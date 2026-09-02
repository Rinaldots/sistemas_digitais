LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MUX2X1 IS
    PORT (
        I0, I1, S : IN STD_LOGIC;
        Z : OUT STD_LOGIC
    );
END MUX2X1;

ARCHITECTURE CKT OF MUX2X1 IS
BEGIN
    Z <= (I0 AND (NOT S)) OR (I1 AND S);
END CKT;