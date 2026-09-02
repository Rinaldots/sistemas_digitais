library ieee;
use ieee.std_logic_1164.all;

entity Subtrair is
    port(
        Sin1, Sin2, Sin3, Sin4, Sin5, Sin6 : in  std_logic_vector(2 downto 0);
        M1, M2, M3, M4, M5, M6             : in  std_logic;
        Sout1, Sout2, Sout3, Sout4, Sout5, Sout6 : out std_logic_vector(2 downto 0)
    );
end Subtrair;

architecture CKT of Subtrair is

    component Subtrator3Bits is
        port(
            A    : in  std_logic_vector(2 downto 0);
            B    : in  std_logic_vector(2 downto 0);
            Bn   : buffer std_logic_vector(2 downto 0);
            Cout : out std_logic;
            S    : out std_logic_vector(2 downto 0)
        );
    end component;

    component MUX2X3 is
    port (
        I0, I1 : in std_logic_vector(2 downto 0);
        S      : in std_logic;
        Z      : out std_logic_vector(2 downto 0)
   	 );
	end component;

    signal S1_sub, S2_sub, S3_sub, S4_sub, S5_sub, S6_sub : std_logic_vector(2 downto 0);
    signal Bn1, Bn2, Bn3, Bn4, Bn5, Bn6 : std_logic_vector(2 downto 0);
    signal Cout1, Cout2, Cout3, Cout4, Cout5, Cout6 : std_logic;

begin
    U1: Subtrator3Bits port map (A => Sin1, B => "001", Bn => Bn1, Cout => Cout1, S => S1_sub);
    U2: Subtrator3Bits port map (A => Sin2, B => "001", Bn => Bn2, Cout => Cout2, S => S2_sub);
    U3: Subtrator3Bits port map (A => Sin3, B => "001", Bn => Bn3, Cout => Cout3, S => S3_sub);
    U4: Subtrator3Bits port map (A => Sin4, B => "001", Bn => Bn4, Cout => Cout4, S => S4_sub);
    U5: Subtrator3Bits port map (A => Sin5, B => "001", Bn => Bn5, Cout => Cout5, S => S5_sub);
    U6: Subtrator3Bits port map (A => Sin6, B => "001", Bn => Bn6, Cout => Cout6, S => S6_sub);

    Z1: MUX2X3 port map (I0 => Sin1, I1 => S1_sub, S => M1, Z => Sout1);
    Z2: MUX2X3 port map (I0 => Sin2, I1 => S2_sub, S => M2, Z => Sout2);
    Z3: MUX2X3 port map (I0 => Sin3, I1 => S3_sub, S => M3, Z => Sout3);
    Z4: MUX2X3 port map (I0 => Sin4, I1 => S4_sub, S => M4, Z => Sout4);
    Z5: MUX2X3 port map (I0 => Sin5, I1 => S5_sub, S => M5, Z => Sout5);
    Z6: MUX2X3 port map (I0 => Sin6, I1 => S6_sub, S => M6, Z => Sout6);


end CKT;

