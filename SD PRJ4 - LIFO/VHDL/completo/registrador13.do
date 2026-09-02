vsim reg_13_bit

add wave *

force ck 0 0ns, 1 5ns -repeat 10ns
force en 0 0ns, 1 20ns 
force clr 1 0ns, 0 10ns

force d(0) 0 0ns, 1 10ns -repeat 20ns
force d(1) 0 0ns, 1 20ns -repeat 40ns
force d(2) 0 0ns, 1 30ns -repeat 60ns
force d(3) 0 0ns, 1 40ns -repeat 80ns
force d(4) 0 0ns, 1 50ns -repeat 100ns
force d(5) 0 0ns, 1 60ns -repeat 120ns
force d(6) 0 0ns, 1 70ns -repeat 140ns
force d(7) 0 0ns, 1 80ns -repeat 160ns
force d(8) 0 0ns, 1 90ns -repeat 180ns
force d(9) 0 0ns, 1 100ns -repeat 200ns
force d(10) 0 0ns, 1 110ns -repeat 220ns
force d(11) 0 0ns, 1 120ns -repeat 240ns
force d(12) 0 0ns, 1 130ns -repeat 260ns

run 300ns
