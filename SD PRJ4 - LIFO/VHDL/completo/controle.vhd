LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY controle IS
  PORT (
    ck, wr, rd, clr_lifo, comp : IN STD_LOGIC;
    s_in, clr_reg, w_reg, r_reg, fu, em : OUT STD_LOGIC
  );
END controle;

ARCHITECTURE logica OF controle IS
  type st is (I, G, L, C);  
  signal estado : st;    

BEGIN
  PROCESS (ck)
  BEGIN
    IF (ck'event AND ck = '1') THEN
      CASE estado IS
        WHEN I =>
          fu <= '0';
          em <= '0';
          IF clr_lifo = '1' THEN
            estado <= C;
            w_reg <= '0';
            r_reg <= '0';
            clr_reg <= '1';
            s_in <= '0';
            fu <= '0';
            em <= '1';
          ELSE
            IF wr = '1' THEN
              w_reg <= '1';
              r_reg <= '0';
              clr_reg <= '0';
              s_in <= '0';
              estado <= G;
            ELSE
              IF rd = '1' THEN
                estado <= L;
                w_reg <= '0';
                r_reg <= '1';
                clr_reg <= '0';
                s_in <= '1';
              ELSE
                estado <= I;
                w_reg <= '0';
                r_reg <= '0';
                clr_reg <= '0';
                s_in <= '0';
              END IF;
            END IF;
          END IF;
        WHEN G =>
          estado <= I;
          IF comp = '1' THEN
            fu <= '1';
            em <= '0';
          ELSE
            fu <= '0';
            em <= '0';
          END IF;
        WHEN L =>
          estado <= I;
          IF comp = '1' THEN
            fu <= '0';
            em <= '1';
          ELSE
            fu <= '0';
            em <= '0';
          END IF;
        WHEN C =>
          estado <= I;

      END CASE;
    END IF;
  END PROCESS;
  
END logica;