LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux2x1_r IS
  PORT (
    e : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s : IN STD_LOGIC;
    z : OUT STD_LOGIC);
END mux2x1_r;

ARCHITECTURE ckt OF mux2x1_r IS
BEGIN
  z <= (e(0) AND s) OR (e(1) AND (NOT s));
END ckt;