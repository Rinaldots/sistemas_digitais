library ieee;
use ieee.std_logic_1164.all;

entity ContadorBCD is
	port (
		clk, up_dw, mx_mi, clr, step, load : in std_logic;
		A                                  : in std_logic_vector(11 downto 0); -- ENTRADA PARALELA A
		led, ck                            : out std_logic;
		D0, D1, D2                         : out std_logic_vector(6 downto 0)
	);
end ContadorBCD;

architecture CKT of ContadorBCD is
	component Registrador12Bits is
		port (
			ck, clr, set : in std_logic;
			S            : in std_logic_vector (1 downto 0); --ENTRADA DO SELETOR DO MUX
			A            : in std_logic_vector(11 downto 0); -- ENTRADA PARALELA A
			Z, W         : in std_logic_vector(11 downto 0); -- ENTRADAS CLEAR
			Q            : out std_logic_vector(11 downto 0) -- SA�DA DO REGISTRADO
		);
	end component;

	component RegistradordePasso is
		port (
			ck : in std_logic;
			S  : in std_logic_vector(1 downto 0); -- SELETOR DO MUX
			Z  : in std_logic_vector(3 downto 0); -- ENTRADAS CLEAR
			A  : in std_logic_vector(3 downto 0); -- ENTRADA PARALELA A
			Q  : out std_logic_vector(3 downto 0) -- SAIDA DO REGISTRADOR
		);
	end component;

	component RegistradordeMaximo is
		port (
			ck : in std_logic;
			S  : in std_logic_vector (1 downto 0);
			A  : in std_logic_vector (11 downto 0);
			Q  : out std_logic_vector(11 downto 0)
		);
	end component;
	component RegistradordeMinimo is
		port (
			ck : in std_logic;
			S  : in std_logic_vector (1 downto 0);
			A  : in std_logic_vector (11 downto 0);
			Q  : out std_logic_vector(11 downto 0)
		);
	end component;

	component comparador is
		port (
			centena0, dezena0, unidade0, centena1, dezena1, unidade1 : in std_logic_vector(3 downto 0);
			AigualB, AmenorB, AmaiorB                                : out std_logic
		);
	end component;

	component somador_bcd is
		port (
			a     : in std_logic_vector(11 downto 0);
			b     : in std_logic_vector(11 downto 0);
			c_in  : in std_logic;
			c_out : out std_logic;
			z     : out std_logic_vector(11 downto 0)
		);
	end component;

	component subtrator_bcd is
		port (
			a    : in std_logic_vector(11 downto 0);
			b    : in std_logic_vector(11 downto 0);
			c_in : in std_logic;
			EAC  : out std_logic;
			z    : out std_logic_vector(11 downto 0)
		);
	end component;

	component MUX4x12 is
		port (
			i0, i1, i2, i3 : in std_logic_vector(11 downto 0);
			S              : in std_logic_vector(1 downto 0);
			Z              : out std_logic_vector(11 downto 0)
		);
	end component;

	component bcd_7seg is
		port (
			s : in std_logic_vector(3 downto 0);
			z : out std_logic_vector(6 downto 0)
		);
	end component;

	component ck_div is
		port (
			ck_in  : in std_logic;
			ck_out : out std_logic
		);
	end component;

	signal n_atual, n_max, n_min, n_passo, n_soma, n_subtracao, n_mux : std_logic_vector(11 downto 0);
	signal stop_max,stop_max1,stop_max2, stop_min, stop_min1, stop_min2, eac, c_out, clock : std_logic;
	signal s_max, s_min, s_step, s_mux                                : std_logic_vector(1 downto 0);
	signal step_1, clr_1, load_1                                      : std_logic;
begin

	led <= (eac or stop_max or stop_min or c_out);
	stop_max <= (stop_max1 or stop_max2);
	stop_min <= (stop_min1 or stop_min2);
	ck_div1 : ck_div port map(ck_in => clk, ck_out => clock);

	ck       <= clock;
	
	step_1 <= NOT(step);
	clr_1  <= NOT(clr);
	load_1 <= NOT(load);
	
	s_mux(0) <= (stop_max or c_out or (not(up_dw) and eac and not(stop_min)));
	s_mux(1) <= (stop_max or c_out or stop_min or not(eac));
	mux4_12 : MUX4x12
	port map(
		i0 => n_soma, 
		i1 => n_subtracao,
		i2 => n_min,
		i3 => n_max,
		S  => s_mux,
		Z  => n_mux
	);

	s_max(0) <= (not(mx_mi) and load_1);
	s_max(1) <= clr;
	reg_max : RegistradordeMaximo
	port map(
		ck => clock, A => A, Q => n_max,
		S => s_max
	);

	s_min(0) <= (mx_mi and load_1);
	s_min(1) <= clr_1;
	reg_min : RegistradordeMinimo
	port map(
		ck => clock, 
		A => A, 
		Q => n_min,
		S => s_min
	);

	reg_atual : Registrador12Bits
	port map(ck => clock, clr => '1', set => '1', S => "01", A => n_mux, Z => n_atual, W => n_atual, Q => n_atual);

	s_step(0) <= (step_1 and load_1);
	s_step(1) <= clr_1;
	reg_passo : RegistradordePasso
	port map(
		Z => "0001", A => A(3 downto 0), Q => n_passo(3 downto 0), ck => clock,
		S => s_step
	);

	comp_max : comparador
	port map(
		centena0 => n_max(11 downto 8),
		dezena0  => n_max(7 downto 4),
		unidade0 => n_max(3 downto 0),
		centena1 => n_atual(11 downto 8),
		dezena1  => n_atual(7 downto 4),
		unidade1 => n_atual(3 downto 0),
		AmenorB  => stop_max1,
		AigualB  => stop_max2
	);

	comp_min : comparador
	port map(
		centena0 => n_atual(11 downto 8),
		dezena0  => n_atual(7 downto 4),
		unidade0 => n_atual(3 downto 0),
		centena1 => n_min(11 downto 8),
		dezena1  => n_min(7 downto 4),
		unidade1 => n_min(3 downto 0),
		AmenorB  => stop_min1,
		AigualB  => stop_min2
	);

	somador : somador_bcd
	port map(
		a     => n_atual,
		b     => n_passo,
		c_in  => '0',
		c_out => c_out,
		z     => n_soma
	);

	subtrador : subtrator_bcd
	port map(
		a    => n_atual,
		b    => n_passo,
		c_in => '0',
		EAC  => eac,
		z    => n_subtracao
	);

	Dig1 : bcd_7seg port map(s => n_atual(3 downto 0), z => D0(6 downto 0));
	Dig2 : bcd_7seg port map(s => n_atual(7 downto 4), z => D1(6 downto 0));
	Dig3 : bcd_7seg port map(s => n_atual(11 downto 8), z => D2(6 downto 0));

end CKT;