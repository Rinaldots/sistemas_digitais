LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adder_16bit IS
  PORT (
    a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    c_out : OUT STD_LOGIC;
    z : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END adder_16bit;

ARCHITECTURE ckt OF adder_16bit IS

  COMPONENT adder_2bit
    PORT (
      a, b, c_int : IN STD_LOGIC;
      s, c_out : OUT STD_LOGIC);
  END COMPONENT;

  SIGNAL carry : STD_LOGIC_VECTOR(14 DOWNTO 0);

BEGIN

  U0 : adder_2bit PORT MAP(
    a => a(0),
    b => b(0),
    c_int => '0',
    s => z(0),
    c_out => carry(0)
  );
  U1 : adder_2bit PORT MAP(
    a => a(1),
    b => b(1),
    c_int => carry(0),
    s => z(1),
    c_out => carry(1)
  );
  U2 : adder_2bit PORT MAP(
    a => a(2),
    b => b(2),
    c_int => carry(1),
    s => z(2),
    c_out => carry(2)
  );
  U3 : adder_2bit PORT MAP(
    a => a(3),
    b => b(3),
    c_int => carry(2),
    s => z(3),
    c_out => carry(3)
  );
  U4 : adder_2bit PORT MAP(
    a => a(4),
    b => b(4),
    c_int => carry(3),
    s => z(4),
    c_out => carry(4)
  );
  U5 : adder_2bit PORT MAP(
    a => a(5),
    b => b(5),
    c_int => carry(4),
    s => z(5),
    c_out => carry(5)
  );
  U6 : adder_2bit PORT MAP(
    a => a(6),
    b => b(6),
    c_int => carry(5),
    s => z(6),
    c_out => carry(6)
  );
  U7 : adder_2bit PORT MAP(
    a => a(7),
    b => b(7),
    c_int => carry(6),
    s => z(7),
    c_out => carry(7)
  );
  U8 : adder_2bit PORT MAP(
    a => a(8),
    b => b(8),
    c_int => carry(7),
    s => z(8),
    c_out => carry(8)
  );
  U9 : adder_2bit PORT MAP(
    a => a(9),
    b => b(9),
    c_int => carry(8),
    s => z(9),
    c_out => carry(9)
  );
  U10 : adder_2bit PORT MAP(
    a => a(10),
    b => b(10),
    c_int => carry(9),
    s => z(10),
    c_out => carry(10)
  );
  U11 : adder_2bit PORT MAP(
    a => a(11),
    b => b(11),
    c_int => carry(10),
    s => z(11),
    c_out => carry(11)
  );
  U12 : adder_2bit PORT MAP(
    a => a(12),
    b => b(12),
    c_int => carry(11),
    s => z(12),
    c_out => carry(12)
  );
  U13 : adder_2bit PORT MAP(
    a => a(13),
    b => b(13),
    c_int => carry(12),
    s => z(13),
    c_out => carry(13)
  );
  U14 : adder_2bit PORT MAP(
    a => a(14),
    b => b(14),
    c_int => carry(13),
    s => z(14),
    c_out => carry(14)
  );
  U15 : adder_2bit PORT MAP(
    a => a(15),
    b => b(15),
    c_int => carry(14),
    s => z(15),
    c_out => c_out
  );
END ckt;