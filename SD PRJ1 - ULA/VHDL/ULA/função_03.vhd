LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mult_8bit IS
  PORT (
    a, b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    c_out : OUT STD_LOGIC);
END mult_8bit;

ARCHITECTURE ckt OF mult_8bit IS
  COMPONENT adder_16bit

    PORT (
      a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      c_out : OUT STD_LOGIC;
      z : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
  END COMPONENT;

  COMPONENT and_64bit
    PORT (
      a, b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s0, s1, s2, s3, s4, s5, s6, s7 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
  END COMPONENT;

  SIGNAL t0, t1, t2, t3, t4, t5, t6 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7 : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN

  A0 : and_64bit PORT MAP(
    a(7 DOWNTO 0) => a(7 DOWNTO 0),
    b(7 DOWNTO 0) => b(7 DOWNTO 0),
    s0(7 DOWNTO 0) => temp0(7 DOWNTO 0),
    s1(7 DOWNTO 0) => temp1(7 DOWNTO 0),
    s2(7 DOWNTO 0) => temp2(7 DOWNTO 0),
    s3(7 DOWNTO 0) => temp3(7 DOWNTO 0),
    s4(7 DOWNTO 0) => temp4(7 DOWNTO 0),
    s5(7 DOWNTO 0) => temp5(7 DOWNTO 0),
    s6(7 DOWNTO 0) => temp6(7 DOWNTO 0),
    s7(7 DOWNTO 0) => temp7(7 DOWNTO 0)
  );

  U0 : adder_16bit PORT MAP(
    a(7 DOWNTO 0) => temp0(7 DOWNTO 0),
    a(15 DOWNTO 8) => (OTHERS => '0'),
    b(0) => '0',
    b(8 DOWNTO 1) => temp1(7 DOWNTO 0),
    b(15 DOWNTO 9) => (OTHERS => '0'),
    z(15 DOWNTO 0) => t0(15 DOWNTO 0)
  );
  U1 : adder_16bit PORT MAP(
    a(15 DOWNTO 0) => t0(15 DOWNTO 0),
    b(1 DOWNTO 0) => (OTHERS => '0'),
    b(9 DOWNTO 2) => temp2(7 DOWNTO 0),
    b(15 DOWNTO 10) => (OTHERS => '0'),
    z(15 DOWNTO 0) => t1(15 DOWNTO 0)
  );
  U2 : adder_16bit PORT MAP(
    a(15 DOWNTO 0) => t1(15 DOWNTO 0),
    b(2 DOWNTO 0) => (OTHERS => '0'),
    b(10 DOWNTO 3) => temp3(7 DOWNTO 0),
    b(15 DOWNTO 11) => (OTHERS => '0'),
    z(15 DOWNTO 0) => t2(15 DOWNTO 0)
  );
  U3 : adder_16bit PORT MAP(
    a(15 DOWNTO 0) => t2(15 DOWNTO 0),
    b(3 DOWNTO 0) => (OTHERS => '0'),
    b(11 DOWNTO 4) => temp4(7 DOWNTO 0),
    b(15 DOWNTO 12) => (OTHERS => '0'),
    z(15 DOWNTO 0) => t3(15 DOWNTO 0)
  );
  U4 : adder_16bit PORT MAP(
    a(15 DOWNTO 0) => t3(15 DOWNTO 0),
    b(4 DOWNTO 0) => (OTHERS => '0'),
    b(12 DOWNTO 5) => temp5(7 DOWNTO 0),
    b(15 DOWNTO 13) => (OTHERS => '0'),
    z(15 DOWNTO 0) => t4(15 DOWNTO 0)
  );
  U5 : adder_16bit PORT MAP(
    a(15 DOWNTO 0) => t4(15 DOWNTO 0),
    b(5 DOWNTO 0) => (OTHERS => '0'),
    b(13 DOWNTO 6) => temp6(7 DOWNTO 0),
    b(15 DOWNTO 14) => (OTHERS => '0'),
    z(15 DOWNTO 0) => t5(15 DOWNTO 0)
  );
  U6 : adder_16bit PORT MAP(
    a(15 DOWNTO 0) => t5(15 DOWNTO 0),
    b(6 DOWNTO 0) => (OTHERS => '0'),
    b(14 DOWNTO 7) => temp7(7 DOWNTO 0),
    b(15) => '0',
    z(15 DOWNTO 0) => t6(15 DOWNTO 0)
  );

  s <= t6(7 DOWNTO 0);
  c_out <= '0';

END ckt;