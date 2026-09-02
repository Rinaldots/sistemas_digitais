
-- Bloco de controle do processador Projeto 5 - Implementação
library ieee;
use ieee.std_logic_1164.all;

entity bloco_controle is
    port (
        ck, rst, alu_carry, alu_zero               : in  std_logic;
        data                                       : in  std_logic_vector(15 downto 0);
        PC_w, PC_clr, S_pc, RW_wr, RP_rd, RQ_rd,
        S0, S1, D_rd, D_wr                        : out std_logic;
        D_addr                                     : out std_logic_vector(7 downto 0);
        RW_addr, RP_addr, RQ_addr                  : out std_logic_vector(3 downto 0);
        S_ula                                      : out std_logic_vector(3 downto 0)
    );
end bloco_controle;

architecture logica of bloco_controle is

   type state_type is (INIC, BUSC, DECO, DLDR, DSTR, DMOV, DADD, DSUB, DAND, 
                       DOR, DNOT, DXOR, DCMP, DJMP, DJNC, DJC, DJNZ, DJZ, HALT);

   signal y_present, y_next : state_type;

    begin

    -- lógica combinacional
    process (y_present, data, alu_zero, alu_carry)
    begin
        -- valores default
        PC_w    <= '0';
        PC_clr  <= '0';
        RW_wr   <= '0';
        RP_rd   <= '0';
        RQ_rd   <= '0';
        D_rd    <= '0';
        D_wr    <= '0';
        S0      <= '0';
        S1      <= '0';
        S_pc    <= '0';
        D_addr  <= (others => '0');
        RW_addr <= (others => '0');
        RP_addr <= (others => '0');
        RQ_addr <= (others => '0');
        S_ula   <= "0000";

        y_next <= BUSC;

        case y_present is
            when INIC =>
                y_next <= BUSC;

            when BUSC =>
                y_next <= DECO;

            when DECO =>
                case data(15 downto 12) is
                when "0000" => y_next <= HALT;
                when "0001" => y_next <= DLDR;
                when "0010" => y_next <= DSTR;
                when "0011" => y_next <= DMOV;
                when "0100" => y_next <= DADD;
                when "0101" => y_next <= DSUB;
                when "0110" => y_next <= DAND;
                when "0111" => y_next <= DOR;
                when "1000" => y_next <= DNOT;
                when "1001" => y_next <= DXOR;
                when "1010" => y_next <= DCMP;
                when "1011" => y_next <= DJMP;
                when "1100" => y_next <= DJNC;
                when "1101" => y_next <= DJC;
                when "1110" => y_next <= DJNZ;
                when "1111" => y_next <= DJZ;
                when others => y_next <= HALT;
                end case;

         when HALT =>
            y_next <= HALT;
            PC_w   <= '1';
            S_pc   <= '1';
            when DLDR =>
                D_addr          <= data(7 downto 0);
                D_wr            <= '1';
                D_rd            <= '0';
                S0              <= '1';
                RW_addr         <= data(11 downto 8);
                RW_wr           <= '1';
                y_next          <= BUSC;
            when DSTR =>
                D_addr          <= data(7 downto 0);
                D_wr            <= '1';
                D_rd            <= '0';
                S0              <= '0';
                RP_addr         <= data(11 downto 8);
                RP_rd           <= '1';
                y_next          <= BUSC;
            when DMOV =>
                RW_addr         <= data(3 downto 0);
                RW_wr           <= '1';
                RQ_addr         <= data(7 downto 4);
                RQ_rd           <= '1';
                S0              <= '0';
                S1              <= '0';
                y_next          <= BUSC;
            -- Funçoes da ULA
            when DADD =>
                RW_addr         <= data(11 downto 8);
                RW_wr           <= '1';
                RP_addr         <= data(7 downto 4);
                RP_rd           <= '1';
                RQ_addr         <= data(3 downto 0);
                RQ_rd           <= '1';
                S0              <= '1';
                S1              <= '0';
                y_next          <= BUSC;
                S_ula           <= "0001";
            when DSUB =>
                RW_addr         <= data(11 downto 8);
                RW_wr           <= '1';
                RP_addr         <= data(7 downto 4);
                RP_rd           <= '1';
                RQ_addr         <= data(3 downto 0);
                RQ_rd           <= '1';
                S0              <= '1';
                S1              <= '0';
                y_next          <= BUSC;
                S_ula           <= "0010";
            when DAND =>
                RW_addr         <= data(11 downto 8);
                RW_wr           <= '1';
                RP_addr         <= data(7 downto 4);
                RP_rd           <= '1';
                RQ_addr         <= data(3 downto 0);
                RQ_rd           <= '1';
                S0              <= '1';
                S1              <= '0';
                y_next          <= BUSC;
                S_ula           <= "0011";
            when DOR =>
                RW_addr         <= data(11 downto 8);
                RW_wr           <= '1';
                RP_addr         <= data(7 downto 4);
                RP_rd           <= '1';
                RQ_addr         <= data(3 downto 0);
                RQ_rd           <= '1';
                S0              <= '1';
                S1              <= '0';
                y_next          <= BUSC;
                S_ula           <= "0100";
            when DNOT =>
                RW_addr         <= data(11 downto 8);
                RW_wr           <= '1';
                RP_addr         <= data(7 downto 4);
                RP_rd           <= '1';
                RQ_addr         <= data(3 downto 0);
                RQ_rd           <= '1';
                S0              <= '1';
                S1              <= '0';
                y_next          <= BUSC;
                S_ula           <= "0101";
            when DXOR =>
                RW_addr         <= data(11 downto 8);
                RW_wr           <= '1';
                RP_addr         <= data(7 downto 4);
                RP_rd           <= '1';
                RQ_addr         <= data(3 downto 0);
                RQ_rd           <= '1';
                S0              <= '1';
                S1              <= '0';
                y_next          <= BUSC;
                S_ula           <= "0110";
            when DCMP =>
                RW_addr         <= data(11 downto 8);
                RW_wr           <= '1';
                RP_addr         <= data(7 downto 4);
                RP_rd           <= '1';
                RQ_addr         <= data(3 downto 0);
                RQ_rd           <= '1';
                S0              <= '1';
                S1              <= '0';
                y_next          <= BUSC;
                S_ula           <= "0111";
            -- Pulos
            when DJMP =>
                y_next <= BUSC;
                S_pc <= '1';
                PC_w <= '1';
            when DJNC =>
                if alu_carry = '0' then
                y_next <= DJNC;
                else
                y_next <= BUSC;
                end if;
            when DJC =>
                if alu_carry = '1' then
                y_next <= DJNC;
                else
                y_next <= BUSC;
                end if;
            when DJNZ =>
                if alu_zero = '0' then
                y_next <= DJNC;
                else
                y_next <= BUSC;
                end if;
            when DJZ =>
                if alu_zero = '1' then
                y_next <= DJNC;
                else
                y_next <= BUSC;
                end if;
            
      end case;
   end process;

   process (ck, rst)
   begin
      if rst = '0' then
         y_present <= INIC;
      elsif (ck'event and ck = '1') then
         y_present <= y_next;
      end if;
   end process;
end logica;