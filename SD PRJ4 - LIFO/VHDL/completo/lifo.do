vcom lifo.vhd
vcom Rinaldo/datapath.vhd
vcom controle.vhd

vsim lifo

add wave *

force ck 0 0ns, 1 5ns -repeat 10ns
force clr_lifo 0 0ns, 1 10ns, 0 20ns

# Testa escrita
force wr 0 0ns, 1 30ns, 0 40ns, 1 60ns, 0 80ns, 1 100ns, 0 120ns
force rd 0 0ns, 1 120ns, 0 140ns, 1 160ns, 0 180ns, 1 200ns
force w_data "1111111111111" 20ns
force w_data "1010101010101" 40ns
force w_data "1100110011001" 60ns
force w_data "1000100010001" 80ns
force w_data "0111011101110" 100ns

run 400ns
