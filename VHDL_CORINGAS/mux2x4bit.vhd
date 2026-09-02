library ieee;
use ieee.std_logic_1164.all;
 
 entity mux_4_bit is
     port (
        D_0,D_1                                            : in   std_logic_vector(3 downto 0);
        s_in                                         : in     std_logic;       
        D_out                                          : out  std_logic_vector(3 downto 0)
     );
    end mux_4_bit;

    architecture CKT of mux_4_bit is

    component MUX2X1 is
        port (
        I0, I1 : in  std_logic;
        S      : in  std_logic;
        Z      : out std_logic
        );
    end component;
    begin
      U1: MUX2X1 port map (I0 => D_0(0), I1 => D_1(0), S => s_in, Z => D_out(0));
      U2: MUX2X1 port map (I0 => D_0(1), I1 => D_1(1), S => s_in, Z => D_out(1));
      U3: MUX2X1 port map (I0 => D_0(2), I1 => D_1(2), S => s_in, Z => D_out(2));
      U4: MUX2X1 port map (I0 => D_0(3), I1 => D_1(3), S => s_in, Z => D_out(3));
  end CKT;