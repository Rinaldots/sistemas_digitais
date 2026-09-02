library ieee;
use ieee.std_logic_1164.all;

entity banco_registradores is
   port(
      w_reg  : in  std_logic;                      -- habilita escrita
      r_reg   : in  std_logic;                      -- habilita leitura
      clr    : in  std_logic;                      -- reset global
      ck     : in  std_logic;                      -- clock
      count  : in  std_logic_vector(3 downto 0);   -- endere�o do registrador
      w_data : in  std_logic_vector(12 downto 0);  -- dados de entrada
      r_data  : out std_logic_vector(12 downto 0)   -- dados de sa�da
   );
end banco_registradores;

architecture estrutural of banco_registradores is

   -------------------------------------------------------------------
   -- Componentes
   -------------------------------------------------------------------
   component reg_13_bit
      port(
         ck   : in  std_logic;
         clr  : in  std_logic;
         en   : in  std_logic;
         d    : in  std_logic_vector(12 downto 0);
         q    : out std_logic_vector(12 downto 0)
      );
   end component;

   component decodificador4x16
      port(
         A  : in  std_logic_vector(3 downto 0);
         EN : in  std_logic;
         Y  : out std_logic_vector(15 downto 0)
      );
   end component;

   COMPONENT mux_4_13_bit
    PORT (
        D_0, D_1, D_2, D_3, D_4, D_5, D_6, D_7, D_8, D_9, D_10, D_11, D_12, D_13, D_14, D_15 : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
        s_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        D_out : OUT STD_LOGIC_VECTOR(12 DOWNTO 0)
    );
   END COMPONENT;

   component mux_13_bit
        PORT (
            D_0, D_1 : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
            s_in : IN STD_LOGIC;
            D_out : OUT STD_LOGIC_VECTOR(12 DOWNTO 0)
        );
    END COMPONENT;
   -------------------------------------------------------------------
   -- Sinais internos
   -------------------------------------------------------------------
   signal EN_REG : std_logic_vector(15 downto 0);  -- enable de cada registrador

   signal Q_REG0, Q_REG1, Q_REG2, Q_REG3,
          Q_REG4, Q_REG5, Q_REG6, Q_REG7,
          Q_REG8, Q_REG9, Q_REG10, Q_REG11,
          Q_REG12, Q_REG13, Q_REG14, Q_REG15 : std_logic_vector(12 downto 0);

   signal SEL, ZERO : std_logic_vector(12 downto 0);

begin
   -------------------------------------------------------------------
   -- Decodificador: habilita apenas um registrador de acordo com count
   -------------------------------------------------------------------
   DEC : decodificador4x16
      port map(
         A  => count,
         EN => w_reg,
         Y  => EN_REG
      );

   -------------------------------------------------------------------
   -- 16 registradores de 13 bits
   -------------------------------------------------------------------
   REG0  : reg_13_bit port map(ck, clr, EN_REG(0),  w_data, Q_REG0);
   REG1  : reg_13_bit port map(ck, clr, EN_REG(1),  w_data, Q_REG1);
   REG2  : reg_13_bit port map(ck, clr, EN_REG(2),  w_data, Q_REG2);
   REG3  : reg_13_bit port map(ck, clr, EN_REG(3),  w_data, Q_REG3);
   REG4  : reg_13_bit port map(ck, clr, EN_REG(4),  w_data, Q_REG4);
   REG5  : reg_13_bit port map(ck, clr, EN_REG(5),  w_data, Q_REG5);
   REG6  : reg_13_bit port map(ck, clr, EN_REG(6),  w_data, Q_REG6);
   REG7  : reg_13_bit port map(ck, clr, EN_REG(7),  w_data, Q_REG7);
   REG8  : reg_13_bit port map(ck, clr, EN_REG(8),  w_data, Q_REG8);
   REG9  : reg_13_bit port map(ck, clr, EN_REG(9),  w_data, Q_REG9);
   REG10 : reg_13_bit port map(ck, clr, EN_REG(10), w_data, Q_REG10);
   REG11 : reg_13_bit port map(ck, clr, EN_REG(11), w_data, Q_REG11);
   REG12 : reg_13_bit port map(ck, clr, EN_REG(12), w_data, Q_REG12);
   REG13 : reg_13_bit port map(ck, clr, EN_REG(13), w_data, Q_REG13);
   REG14 : reg_13_bit port map(ck, clr, EN_REG(14), w_data, Q_REG14);
   REG15 : reg_13_bit port map(ck, clr, EN_REG(15), w_data, Q_REG15);

   -------------------------------------------------------------------
   -- MUX 1: Seleciona a sa�da conforme o endere�o (count)
   -------------------------------------------------------------------
   MUX1 : mux_4_13_bit
   PORT MAP(
       D_0 => Q_REG0,
       D_1 => Q_REG1,
       D_2 => Q_REG2,
       D_3 => Q_REG3,
       D_4 => Q_REG4,
       D_5 => Q_REG5,
       D_6 => Q_REG6,
       D_7 => Q_REG7,
       D_8 => Q_REG8,
       D_9 => Q_REG9,
       D_10 => Q_REG10,
       D_11 => Q_REG11,
       D_12 => Q_REG12,
       D_13 => Q_REG13,
       D_14 => Q_REG14,
       D_15 => Q_REG15,
       s_in => count,
       D_out => SEL
   );

   -------------------------------------------------------------------
   -- MUX 2: Ativa a sa�da apenas se READ = '1'
   -------------------------------------------------------------------
   ZERO <= ('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
   
   MUX2 : mux_13_bit
   PORT MAP(
       D_0 => ZERO,
       D_1 => SEL,
       s_in => r_reg,
       D_out => r_data
   );

end estrutural;

