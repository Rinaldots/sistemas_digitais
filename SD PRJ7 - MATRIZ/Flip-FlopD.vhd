LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ffd IS
   PORT (
      ck, clr, set, d : IN STD_LOGIC;
      q : OUT STD_LOGIC);
END ffd;

ARCHITECTURE logica OF ffd IS

BEGIN
   PROCESS (ck, clr, set)
   BEGIN
      IF (set = '0') THEN
         q <= '1';
      ELSIF (clr = '0') THEN
         q <= '0';
      ELSIF (ck'event AND ck = '1') THEN
         q <= d;
      END IF;
   END PROCESS;
END logica;