vsim -L work work.banco_registradores
add wave *

force ck 0 0ns, 1 5ns -repeat 10ns
force clr 1 0ns, 0 10ns

# Escrita habilitada entre 20 ns e 120 ns
force wr_reg 0 0ns, 1 20ns, 0 120ns
# Leitura habilitada após concluir as escrituras
force rp_reg 0 0ns, 1 100ns
force rq_reg 0 0ns, 1 100ns

# Endereços e dados de escrita
force wr_addr "0000" 0ns
force wr_data "11111111" 0ns

force wr_addr "0001" 40ns
force wr_data "10101010" 40ns

force wr_addr "0010" 60ns
force wr_data "11001100" 60ns

force wr_addr "0011" 80ns
force wr_data "10001000" 80ns

force wr_addr "0100" 100ns
force wr_data "01110111" 100ns

# Sequência de leitura após 120 ns
force rp_addr "0000" 0ns
force rp_addr "0000" 0ns

force rp_addr "0000" 130ns
force rq_addr "0001" 150ns
force rp_addr "0010" 170ns
force rq_addr "0011" 190ns
force rp_addr "0100" 210ns

# Teste de registrador não escrito
force rq_addr "1111" 230ns

# Porta rq permanece desabilitada, mas endereço definido
force rq_addr "0000" 0ns

run 250ns
