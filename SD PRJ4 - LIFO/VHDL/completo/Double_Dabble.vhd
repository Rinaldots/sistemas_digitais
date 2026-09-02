library ieee;
use ieee.std_logic_1164.all;

entity double_dabble is
  port(a                      : in std_logic_vector(12 downto 0);
       a_out, b_out, c_out, d_out    : out std_logic_vector(3 downto 0));
end double_dabble;

architecture ckt of double_dabble is
  component four_or_three
    port(a        : in std_logic_vector(3 downto 0);
         s        : out std_logic_vector(3 downto 0)
         );
  end component;
  
  signal t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28 : std_logic_vector(3 downto 0);
  
  begin

  U0: four_or_three port map(
    a(0)          => a(12),
    a(1)          => '0',
    a(2)          => '0',
    a(3)          => '0',
    s(3 downto 0) => t0(3 downto 0)
    );
  U1: four_or_three port map(
    a(0)          => a(11),
    a(3 downto 1) => t0(2 downto 0),
    s(3 downto 0) => t1(3 downto 0)
    );  
  U2: four_or_three port map(
    a(0)          => a(10),
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
    a(0)          => a(9),
    a(3 downto 1) => t2(2 downto 0),
    s(3 downto 0) => t4(3 downto 0)
    );
  U5: four_or_three port map(
    a(0)          => t4(3),
    a(3 downto 1) => t3(2 downto 0),
    s(3 downto 0) => t5(3 downto 0)
    );
  U6: four_or_three port map(
    a(0)          => a(8),
    a(3 downto 1) => t4(2 downto 0),
    s(3 downto 0) => t6(3 downto 0)
    );
  U7: four_or_three port map(
    a(0)          => t6(3),
    a(3 downto 1) => t5(2 downto 0),
    s(3 downto 0) => t7(3 downto 0)
    );
  U8: four_or_three port map(
    a(0)          => a(7),
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
    a(0)          => a(6),
    a(3 downto 1) => t8(2 downto 0),
    s(3 downto 0) => t11(3 downto 0)
  );

  U12: four_or_three port map(
    a(0)          => t10(3),
    a(3 downto 1) => t9(2 downto 0),
    s(3 downto 0) => t12(3 downto 0)
  );

  U13: four_or_three port map(
    a(0)          => t11(3),
    a(3 downto 1) => t10(2 downto 0),
    s(3 downto 0) => t13(3 downto 0)
  );

  U14: four_or_three port map(
    a(0)          => a(5),
    a(3 downto 1) => t11(2 downto 0),
    s(3 downto 0) => t14(3 downto 0)
  );

  U15: four_or_three port map(
    a(0)          => t13(3),
    a(3 downto 1) => t12(2 downto 0),
    s(3 downto 0) => t15(3 downto 0)
  );

  U16: four_or_three port map(
    a(0)          => t14(3),
    a(3 downto 1) => t13(2 downto 0),
    s(3 downto 0) => t16(3 downto 0)
  );

  U17: four_or_three port map(
    a(0)          => a(4),
    a(3 downto 1) => t14(2 downto 0),
    s(3 downto 0) => t17(3 downto 0)
  );

  U18: four_or_three port map(
    a(0)          => t16(3),
    a(3 downto 1) => t15(2 downto 0),
    s(3 downto 0) => t18(3 downto 0)
  );

  U19: four_or_three port map(
    a(0)          => t17(3),
    a(3 downto 1) => t16(2 downto 0),
    s(3 downto 0) => t19(3 downto 0)
  );

  U20: four_or_three port map(
    a(0)          => a(3),
    a(3 downto 1) => t17(2 downto 0),
    s(3 downto 0) => t20(3 downto 0)
  );

  U21: four_or_three port map(
    a(3)          => '0',
    a(2)          => t12(3),
    a(1)          => t15(3),
    a(0)          => t18(3),
    s(3 downto 0) => t21(3 downto 0)
    );
  U22: four_or_three port map(
    a(3 downto 1) => t18(2 downto 0),
    a(0)          => t19(3),
    s(3 downto 0) => t22(3 downto 0)
    );
  U23: four_or_three port map(
    a(3 downto 1) => t19(2 downto 0),
    a(0)          => t20(3),
    s(3 downto 0) => t23(3 downto 0)
    );
  U24: four_or_three port map(
    a(0)          => a(2),
    a(3 downto 1) => t20(2 downto 0),
    s(3 downto 0) => t24(3 downto 0)
  );

  U25: four_or_three port map(
    a(3 downto 1) => t21(2 downto 0),
    a(0)          => t22(3),
    s(3 downto 0) => t25(3 downto 0)
    );
  U26: four_or_three port map(
    a(3 downto 1) => t22(2 downto 0),
    a(0)          => t23(3),
    s(3 downto 0) => t26(3 downto 0)
    );
  U27: four_or_three port map(
    a(3 downto 1) => t23(2 downto 0),
    a(0)          => t24(3),
    s(3 downto 0) => t27(3 downto 0)
    );
  U28: four_or_three port map(
    a(0)          => a(1),
    a(3 downto 1) => t24(2 downto 0),
    s(3 downto 0) => t28(3 downto 0)
  );

  
  a_out(3 downto 1) <= t25(2 downto 0);
  a_out(0) <= t26(3);
  b_out(3 downto 1) <= t26(2 downto 0);
  b_out(0) <= t27(3);
  c_out(3 downto 1) <= t27(2 downto 0);
  c_out(0) <= t28(3);
  d_out(3 downto 1) <= t28(2 downto 0);
  d_out(0) <= a(0);
end ckt;