vcom Rinaldo/datapath.vhd

vsim data_path

add wave *

force ck 0 0ns, 1 5ns -repeat 10ns
force clr_reg 1 0ns, 0 10ns
force s_in 0 0ns, 1 150ns

# Testa escrita em registradores
force w_reg 1 0ns, 0 120ns
force r_reg 0 0ns

force w_data "1111111111111" 0ns
force w_data "1010101010101" 40ns
force w_data "1100110011001" 60ns
force w_data "1000100010001" 80ns
force w_data "0111011101110" 100ns

# Testa leitura dos registradores
force w_reg 1 0ns, 0 130ns
force r_reg 0 0ns, 1 130ns

run 200ns
