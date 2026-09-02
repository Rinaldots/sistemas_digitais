library ieee;
use ieee.std_logic_1164.all;

entity bin_7_seg is
  port(s : in  std_logic_vector(7 downto 0);
       a,b,c,d,e,f,g : out std_logic_vector(2 downto 0));
end bin_7_seg;

architecture ckt of bin_7_seg is
  
  component double_dabble is
    port(a                      : in std_logic_vector(7 downto 0);
         a_out, b_out, c_out    : out std_logic_vector(3 downto 0)
         );
  end component;
  
  component bcd_7seg is
  port(s : in  std_logic_vector(3 downto 0);
       z : out std_logic_vector(6 downto 0));
  end component; 
  
  signal a_carry, b_carry, c_carry : std_logic_vector(3 downto 0);
  
  begin
  
  U1: double_dabble port map(
    a(7 downto 0)     => s(7 downto 0),
    a_out(3 downto 0) => a_carry(3 downto 0),
    b_out(3 downto 0) => b_carry(3 downto 0),
    c_out(3 downto 0) => c_carry(3 downto 0)
    );
  U2: bcd_7seg port map(
    s(3 downto 0) => a_carry(3 downto 0),
    z(0) => a(0),
    z(1) => b(0),
    z(2) => c(0),
    z(3) => d(0),
    z(4) => e(0),
    z(5) => f(0),
    z(6) => g(0)
    );
  U3: bcd_7seg port map(
    s(3 downto 0) => b_carry(3 downto 0),
    z(0) => a(1),
    z(1) => b(1),
    z(2) => c(1),
    z(3) => d(1),
    z(4) => e(1),
    z(5) => f(1),
    z(6) => g(1)
    );
  U4: bcd_7seg port map(
    s(3 downto 0) => c_carry(3 downto 0),
    z(0) => a(2),
    z(1) => b(2),
    z(2) => c(2),
    z(3) => d(2),
    z(4) => e(2),
    z(5) => f(2),
    z(6) => g(2)
    );
        
end ckt;




