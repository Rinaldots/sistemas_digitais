LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adder_2bit IS
  PORT (
    a, b, c_int : IN STD_LOGIC;
    s, c_out : OUT STD_LOGIC);
END adder_2bit;

ARCHITECTURE ckt OF adder_2bit IS
BEGIN
  s <= ((a XOR b) XOR c_int);
  c_out <= ((a AND b) OR (a AND c_int) OR (b AND c_int));
END ckt;