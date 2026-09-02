library ieee;
use ieee.std_logic_1164.all;

entity shl_8bit is
  port(e : in std_logic_vector(7 downto 0);
       s : in std_logic_vector(2 downto 0);
       z : out std_logic_vector(7 downto 0));
end shl_8bit;

architecture ckt of shl_8bit is
  component mux2x1
    port(e : in std_logic_vector(1 downto 0);
         s : in std_logic;
         z : out std_logic);
  end component;

signal t2, t1 : std_logic_vector(7 downto 0);

begin
  UI30: mux2x1 port map(
    e(1) => e(0),
    e(0) => '0',
    s => s(2),
    z => t2(0)
    );
  UI31: mux2x1 port map(
    e(1) => e(1),
    e(0) => '0',
    s => s(2),
    z => t2(1)
    );
  UI32: mux2x1 port map(
    e(1) => e(2),
    e(0) => '0',
    s => s(2),
    z => t2(2)
    );
  UI33: mux2x1 port map(
    e(1) => e(3),
    e(0) => '0',
    s => s(2),
    z => t2(3)
    );
  UI34: mux2x1 port map(
    e(1) => e(4),
    e(0) => e(0),
    s => s(2),
    z => t2(4)
    );
  UI35: mux2x1 port map(
    e(1) => e(5),
    e(0) => e(1),
    s => s(2),
    z => t2(5)
    );
  UI36: mux2x1 port map(
    e(1) => e(6),
    e(0) => e(2),
    s => s(2),
    z => t2(6)
    );
  UI37: mux2x1 port map(
    e(1) => e(7),
    e(0) => e(3),
    s => s(2),
    z => t2(7)
    );


  
  UI20: mux2x1 port map(
    e(1) => t2(0),
    e(0) => '0',
    s => s(1),
    z => t1(0)
    );
  UI21: mux2x1 port map(
    e(1) => t2(1),
    e(0) => '0',
    s => s(1),
    z => t1(1)
    );
  UI22: mux2x1 port map(
    e(1) => t2(2),
    e(0) => t2(0),
    s => s(1),
    z => t1(2)
    );
  UI23: mux2x1 port map(
    e(1) => t2(3),
    e(0) => t2(1),
    s => s(1),
    z => t1(3)
    );
  UI24: mux2x1 port map(
    e(1) => t2(4),
    e(0) => t2(2),
    s => s(1),
    z => t1(4)
    );
  UI25: mux2x1 port map(
    e(1) => t2(5),
    e(0) => t2(3),
    s => s(1),
    z => t1(5)
    );
  UI26: mux2x1 port map(
    e(1) => t2(6),
    e(0) => t2(4),
    s => s(1),
    z => t1(6)
    );
  UI27: mux2x1 port map(
    e(1) => t2(7),
    e(0) => t2(5),
    s => s(1),
    z => t1(7)
    );
  
  UI10: mux2x1 port map(
    e(1) => t1(0),
    e(0) => '0',
    s => s(0),
    z => z(0)
    );
  UI11: mux2x1 port map(
    e(1) => t1(1),
    e(0) => t1(0),
    s => s(0),
    z => z(1)
    );
  UI12: mux2x1 port map(
    e(1) => t1(2),
    e(0) => t1(1),
    s => s(0),
    z => z(2)
    );
  UI13: mux2x1 port map(
    e(1) => t1(3),
    e(0) => t1(2),
    s => s(0),
    z => z(3)
    );
  UI14: mux2x1 port map(
    e(1) => t1(4),
    e(0) => t1(3),
    s => s(0),
    z => z(4)
    );
  UI15: mux2x1 port map(
    e(1) => t1(5),
    e(0) => t1(4),
    s => s(0),
    z => z(5)
    );
  UI16: mux2x1 port map(
    e(1) => t1(6),
    e(0) => t1(5),
    s => s(0),
    z => z(6)
    );
  UI17: mux2x1 port map(
    e(1) => t1(7),
    e(0) => t1(6),
    s => s(0),
    z => z(7)
    );
  
end ckt;

