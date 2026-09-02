library ieee;
use ieee.std_logic_1164.all;
entity bloco_controle is
   port (
     ck    : in  std_logic;
     rst   : in  std_logic;
     e_ERROR : in  std_logic;
     T     : in  std_logic;
     C_Z   : in  std_logic;
     FIM   : in  std_logic;
     CRL   : in  std_logic;
     q     : out std_logic_vector(1 downto 0);
     LED   : out std_logic;
	  LED_ERROR: out std_logic
   );
end bloco_controle;

architecture logica of bloco_controle is
  type st is (I, S, L, C);
  signal estado : st := I;
  signal P_ERROR : std_logic;
begin
  process (ck, rst)
    variable next_st : st;
  begin
    if rst = '1' then
      estado <= I;
    elsif (ck'event and ck = '1') then
      next_st := estado;
      case estado is
        when I =>
          if (T = '1' and CRL = '0' and P_ERROR = '0') then
            next_st := S;
          elsif (CRL = '1' and T = '0') then
            next_st := C;
          else
            next_st := I;
          end if;

        when S =>
          if (e_ERROR = '1' and C_Z = '0') then
            next_st := I;
          elsif (C_Z = '0') then
            next_st := S;
          else
            next_st := L;
          end if;

        when L =>
          if (FIM = '0') then
            next_st := L;
          else
            next_st := I;
          end if;

        when C =>
          if (CRL = '0') then
            next_st := I;
          else
            next_st := C;
          end if;

      end case;

      -- atualiza o estado
      estado <= next_st;

      -- P_ERROR logica:
      -- se o proximo estado for C, limpa a flag de erro; caso contrario, se e_ERROR
      -- estiver ativo, seta a flag e mantem seu valor, caso contrario
      if next_st = C then
        P_ERROR <= '0';
      elsif estado = S and e_ERROR = '1' and C_Z = '0' then
        P_ERROR <= e_ERROR;
		else 
		  P_ERROR <= P_ERROR;
      end if;

    end if;
  end process;
  with estado select
    q <= "00" when I,
         "01" when S,
         "10" when L,
         "11" when C;
  with estado select
    LED <= '1' when L,
           '1' when S,
           '0' when others;

	LED_ERROR <= P_ERROR;
	
end logica;
