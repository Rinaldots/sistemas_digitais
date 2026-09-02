vsim reg_4_bit

add wave *

force ck 0 0ns, 1 5ns -repeat 10ns
force en 0 0ns, 1 150ns
force clr 1 0ns, 0 10ns

force d(0) 0 0ns, 1 10ns -repeat 20ns
force d(1) 0 0ns, 1 20ns -repeat 40ns
force d(2) 0 0ns, 1 30ns -repeat 60ns
force d(3) 0 0ns, 1 40ns -repeat 80ns

run 200ns
