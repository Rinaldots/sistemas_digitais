vsim mux_4_bit

add wave *

force D_0(0) 0 0ns, 1 10ns -repeat 20ns
force D_0(1) 0 0ns, 1 20ns -repeat 40ns
force D_0(2) 0 0ns, 1 30ns -repeat 60ns
force D_0(3) 0 0ns, 1 40ns -repeat 80ns

force D_1(0) 1 0ns, 0 10ns -repeat 20ns
force D_1(1) 1 0ns, 0 20ns -repeat 40ns
force D_1(2) 1 0ns, 0 30ns -repeat 60ns
force D_1(3) 1 0ns, 0 40ns -repeat 80ns

force s_in 0 0ns, 1 100ns -repeat 200ns

run 240ns
