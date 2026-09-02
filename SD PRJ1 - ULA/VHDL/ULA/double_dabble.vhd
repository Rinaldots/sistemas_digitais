library ieee;
use ieee.std_logic_1164.all;

entity double_dabble is
  port(a                      : in std_logic_vector(7 downto 0);
       a_out, b_out, c_out    : out std_logic_vector(3 downto 0));
end double_dabble;

architecture ckt of double_dabble is
  component four_or_three
    port(a        : in std_logic_vector(3 downto 0);
         s        : out std_logic_vector(3 downto 0)
         );
  end component;
  
  signal t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11 : std_logic_vector(3 downto 0);
  
  begin

  U0: four_or_three port map(
    a(0)          => a(7),
    a(1)          => '0',
    a(2)          => '0',
    a(3)          => '0',
    s(3 downto 0) => t0(3 downto 0)
    );
  U1: four_or_three port map(
    a(0)          => a(6),
    a(3 downto 1) => t0(2 downto 0),
    s(3 downto 0) => t1(3 downto 0)
    );  
  U2: four_or_three port map(
    a(0)          => a(5),
    a(3 downto 1) => t1(2 downto 0),
    s(3 downto 0) => t2(3 downto 0)
    );
  U3: four_or_three port map(
    a(3)          => '0',
    a(2)          => t0(3),
    a(1)          => t1(3),
    a(0)          => t2(3),
    s(3 downto 0) => t3(3 downto 0)
    );
  U4: four_or_three port map(
    a(0)          => a(4),
    a(3 downto 1) => t2(2 downto 0),
    s(3 downto 0) => t4(3 downto 0)
    );
  U5: four_or_three port map(
    a(0)          => t4(3),
    a(3 downto 1) => t3(2 downto 0),
    s(3 downto 0) => t5(3 downto 0)
    );
  U6: four_or_three port map(
    a(0)          => a(3),
    a(3 downto 1) => t4(2 downto 0),
    s(3 downto 0) => t6(3 downto 0)
    );
  U7: four_or_three port map(
    a(0)          => t6(3),
    a(3 downto 1) => t5(2 downto 0),
    s(3 downto 0) => t7(3 downto 0)
    );
  U8: four_or_three port map(
    a(0)          => a(2),
    a(3 downto 1) => t6(2 downto 0),
    s(3 downto 0) => t8(3 downto 0)
    );
  U9: four_or_three port map(
    a(3)          => '0',
    a(2)          => t3(3),
    a(1)          => t5(3),
    a(0)          => t7(3),
    s(3 downto 0) => t9(3 downto 0)
    );
  U10: four_or_three port map(
    a(3 downto 1) => t7(2 downto 0),
    a(0)          => t8(3),
    s(3 downto 0) => t10(3 downto 0)
    );
  U11: four_or_three port map(
    a(0)          => a(1),
    a(3 downto 1) => t8(2 downto 0),
    s(3 downto 0) => t11(3 downto 0)
    
    );
  
  a_out(3 downto 1) <= t9(2 downto 0);
  a_out(0) <= t10(3);
  b_out(3 downto 1) <= t10(2 downto 0);
  b_out(0) <= t11(3);
  c_out(3 downto 1) <= t11(2 downto 0);
  c_out(0) <= a(0);
end ckt;




