LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY shl_8bit IS
  PORT (
    e : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    z : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    c_out : OUT STD_LOGIC);
END shl_8bit;

ARCHITECTURE ckt OF shl_8bit IS
  COMPONENT mux2x1_r
    PORT (
      e : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      s : IN STD_LOGIC;
      z : OUT STD_LOGIC);
  END COMPONENT;

  SIGNAL t2, t1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL c_temp : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN

  UI30 : mux2x1_r PORT MAP(
    e(1) => e(0),
    e(0) => '0',
    s => s(2),
    z => t2(0)
  );
  UI31 : mux2x1_r PORT MAP(
    e(1) => e(1),
    e(0) => '0',
    s => s(2),
    z => t2(1)
  );
  UI32 : mux2x1_r PORT MAP(
    e(1) => e(2),
    e(0) => '0',
    s => s(2),
    z => t2(2)
  );
  UI33 : mux2x1_r PORT MAP(
    e(1) => e(3),
    e(0) => '0',
    s => s(2),
    z => t2(3)
  );
  UI34 : mux2x1_r PORT MAP(
    e(1) => e(4),
    e(0) => e(0),
    s => s(2),
    z => t2(4)
  );
  UI35 : mux2x1_r PORT MAP(
    e(1) => e(5),
    e(0) => e(1),
    s => s(2),
    z => t2(5)
  );
  UI36 : mux2x1_r PORT MAP(
    e(1) => e(6),
    e(0) => e(2),
    s => s(2),
    z => t2(6)
  );
  UI37 : mux2x1_r PORT MAP(
    e(1) => e(7),
    e(0) => e(3),
    s => s(2),
    z => t2(7)
  );
  UI38 : mux2x1_r PORT MAP(
    e(1) => '0',
    e(0) => e(4),
    s => s(2),
    z => c_temp(2)
  );

  UI20 : mux2x1_r PORT MAP(
    e(1) => t2(0),
    e(0) => '0',
    s => s(1),
    z => t1(0)
  );
  UI21 : mux2x1_r PORT MAP(
    e(1) => t2(1),
    e(0) => '0',
    s => s(1),
    z => t1(1)
  );
  UI22 : mux2x1_r PORT MAP(
    e(1) => t2(2),
    e(0) => t2(0),
    s => s(1),
    z => t1(2)
  );
  UI23 : mux2x1_r PORT MAP(
    e(1) => t2(3),
    e(0) => t2(1),
    s => s(1),
    z => t1(3)
  );
  UI24 : mux2x1_r PORT MAP(
    e(1) => t2(4),
    e(0) => t2(2),
    s => s(1),
    z => t1(4)
  );
  UI25 : mux2x1_r PORT MAP(
    e(1) => t2(5),
    e(0) => t2(3),
    s => s(1),
    z => t1(5)
  );
  UI26 : mux2x1_r PORT MAP(
    e(1) => t2(6),
    e(0) => t2(4),
    s => s(1),
    z => t1(6)
  );
  UI27 : mux2x1_r PORT MAP(
    e(1) => t2(7),
    e(0) => t2(5),
    s => s(1),
    z => t1(7)
  );
  UI28 : mux2x1_r PORT MAP(
    e(1) => '0',
    e(0) => t2(6),
    s => s(1),
    z => c_temp(1)
  );

  UI10 : mux2x1_r PORT MAP(
    e(1) => t1(0),
    e(0) => '0',
    s => s(0),
    z => z(0)
  );
  UI11 : mux2x1_r PORT MAP(
    e(1) => t1(1),
    e(0) => t1(0),
    s => s(0),
    z => z(1)
  );
  UI12 : mux2x1_r PORT MAP(
    e(1) => t1(2),
    e(0) => t1(1),
    s => s(0),
    z => z(2)
  );
  UI13 : mux2x1_r PORT MAP(
    e(1) => t1(3),
    e(0) => t1(2),
    s => s(0),
    z => z(3)
  );
  UI14 : mux2x1_r PORT MAP(
    e(1) => t1(4),
    e(0) => t1(3),
    s => s(0),
    z => z(4)
  );
  UI15 : mux2x1_r PORT MAP(
    e(1) => t1(5),
    e(0) => t1(4),
    s => s(0),
    z => z(5)
  );
  UI16 : mux2x1_r PORT MAP(
    e(1) => t1(6),
    e(0) => t1(5),
    s => s(0),
    z => z(6)
  );
  UI17 : mux2x1_r PORT MAP(
    e(1) => t1(7),
    e(0) => t1(6),
    s => s(0),
    z => z(7)
  );
  UI18 : mux2x1_r PORT MAP(
    e(1) => '0',
    e(0) => t1(7),
    s => s(0),
    z => c_temp(0)
  );
  c_out <= (c_temp(0) OR c_temp(1) OR c_temp(2));
END ckt;