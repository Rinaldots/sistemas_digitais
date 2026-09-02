vcom Rinaldo/botão.vhd

vsim botao

add wave *

# Clock 10ns period
force ck 0 0ns, 1 5ns -repeat 10ns

# Reset pulse at start and mid-simulation
force rst 1 0ns, 0 15ns, 1 100ns, 0 105ns

# Estímulos para s: gera transições A->B->C->A repetidas
# A (s=0) -> B (s=1) -> C (s=1) -> A (s=0) ...
force s 0 0ns, 1 20ns, 0 60ns, 1 80ns, 0 120ns

run 150ns
