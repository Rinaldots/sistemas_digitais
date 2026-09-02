vcom controle.vhd

vsim mde_seq

add wave *

force ck 0 0ns, 1 5ns -repeat 10ns
force clr_lifo 1 0ns, 0 10ns

# Testa escrita
force wr 0 0ns, 1 20ns, 0 120ns
force rd 0 0ns
force comp 0 0ns, 1 60ns, 0 100ns

# Testa leitura
force wr 1 0ns, 0 130ns
force rd 1 130ns
force comp 0 0ns, 1 130ns, 0 170ns

run 200ns
