library ieee;
use ieee.std_logic_1164.all;

entity mult_8bit is
  port(a, b     : in std_logic_vector(7 downto 0);
       s        : out std_logic_vector(7 downto 0);
       c_out    : out std_logic);
end mult_8bit;

architecture ckt of mult_8bit is
  component adder_16bit
    
  port(a     : in std_logic_vector(15 downto 0);
       b     : in std_logic_vector(15 downto 0); 
       c_out : out std_logic;
       z     : out std_logic_vector(15 downto 0));
  end component;
  
  component and_64bit
    port( a, b                              : in std_logic_vector(7 downto 0);
          s0, s1, s2, s3, s4, s5, s6, s7    : out std_logic_vector(7 downto 0));
  end component;
  
  signal t0,t1,t2,t3,t4,t5,t6 : std_logic_vector(15 downto 0);
  signal temp0,temp1,temp2,temp3,temp4,temp5,temp6,temp7 : std_logic_vector(7 downto 0);
  begin

  A0: and_64bit port map(
    a(7 downto 0) => a(7 downto 0),
    b(7 downto 0) => b(7 downto 0),
    s0(7 downto 0) => temp0(7 downto 0),
    s1(7 downto 0) => temp1(7 downto 0),
    s2(7 downto 0) => temp2(7 downto 0),
    s3(7 downto 0) => temp3(7 downto 0),
    s4(7 downto 0) => temp4(7 downto 0),
    s5(7 downto 0) => temp5(7 downto 0),
    s6(7 downto 0) => temp6(7 downto 0),
    s7(7 downto 0) => temp7(7 downto 0)
  );

  U0: adder_16bit port map(
    a(7 downto 0) => temp0(7 downto 0),
    a(15 downto 8) => (others => '0'),
    b(0) => '0',
    b(8 downto 1) => temp1(7 downto 0),
    b(15 downto 9) => (others => '0'),
    z(15 downto 0) => t0(15 downto 0)
  );     
U1: adder_16bit port map(
    a(15 downto 0) => t0(15 downto 0),
    b(1 downto 0) => (others => '0'),
    b(9 downto 2) => temp2(7 downto 0),
    b(15 downto 10) => (others => '0'),
    z(15 downto 0) => t1(15 downto 0)
    );
U2: adder_16bit port map(
    a(15 downto 0) => t1(15 downto 0),
    b(2 downto 0) => (others => '0'),
    b(10 downto 3) => temp3(7 downto 0),
    b(15 downto 11) => (others => '0'),
    z(15 downto 0) => t2(15 downto 0)
    );
U3: adder_16bit port map(
    a(15 downto 0) => t2(15 downto 0),
    b(3 downto 0) => (others => '0'),
    b(11 downto 4) => temp4(7 downto 0),
    b(15 downto 12) => (others => '0'),
    z(15 downto 0) => t3(15 downto 0)
    );
U4: adder_16bit port map(
    a(15 downto 0) => t3(15 downto 0),
    b(4 downto 0) => (others => '0'),
    b(12 downto 5) => temp5(7 downto 0),
    b(15 downto 13) => (others => '0'),
    z(15 downto 0) => t4(15 downto 0)
    );
U5: adder_16bit port map(
    a(15 downto 0) => t4(15 downto 0),
    b(5 downto 0) => (others => '0'),
    b(13 downto 6) => temp6(7 downto 0),
    b(15 downto 14) => (others => '0'),
    z(15 downto 0) => t5(15 downto 0)
    );
U6: adder_16bit port map(
    a(15 downto 0) => t5(15 downto 0),
    b(6 downto 0) => (others => '0'),
    b(14 downto 7) => temp7(7 downto 0),
    b(15) => '0',
    z(15 downto 0) => t6(15 downto 0)
    );

    s <= t6(7 downto 0);
    c_out <= '0';

end ckt;



