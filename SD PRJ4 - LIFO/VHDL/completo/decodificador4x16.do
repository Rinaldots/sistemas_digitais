vsim decodificador4x16

add wave *

force EN 1 0ns, 0 200ns

force A(0) 0 0ns, 1 10ns -repeat 20ns
force A(1) 0 0ns, 1 20ns -repeat 40ns
force A(2) 0 0ns, 1 30ns -repeat 60ns
force A(3) 0 0ns, 1 40ns -repeat 80ns

run 240ns
