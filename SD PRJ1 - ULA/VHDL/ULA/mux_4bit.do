vsim mux4x1

add wave *

force a(0) 0 0ns, 1 10ns -repeat 20ns
force a(1) 0 0ns, 1 20ns -repeat 40ns
force a(2) 0 0ns, 1 30ns -repeat 60ns
force a(3) 0 0ns, 1 40ns -repeat 80ns

force b(0) 0 0ns, 1 20ns -repeat 40ns
force b(1) 0 0ns, 1 40ns -repeat 80ns
force b(2) 0 0ns, 1 60ns -repeat 120ns
force b(3) 0 0ns, 1 80ns -repeat 160ns

force s 0 0ns, 1 100ns -repeat 200ns

run 1000ns