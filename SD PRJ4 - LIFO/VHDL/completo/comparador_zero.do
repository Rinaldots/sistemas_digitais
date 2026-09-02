vcom Rinaldo/comparador_zero.vhd

vsim comparador_zero

add wave *

force a(0) 0 0ns, 1 10ns -repeat 20ns
force a(1) 0 0ns, 1 20ns -repeat 40ns
force a(2) 0 0ns, 1 30ns -repeat 60ns
force a(3) 0 0ns, 1 40ns -repeat 80ns

run 100ns
