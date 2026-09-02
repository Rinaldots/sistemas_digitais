vsim shl_8bit 

add wave * 

force e(0) 0 0ns, 1 10ns -repeat 20ns
force e(1) 0 0ns, 1 20ns -repeat 40ns
force e(2) 0 0ns, 1 30ns -repeat 60ns
force e(3) 0 0ns, 1 40ns -repeat 80ns
force e(4) 0 0ns, 1 50ns -repeat 100ns
force e(5) 0 0ns, 1 60ns -repeat 120ns
force e(6) 0 0ns, 1 70ns -repeat 140ns
force e(7) 0 0ns, 1 80ns -repeat 160ns
force s(0) 0 0ns, 1 60ns -repeat 120ns
force s(1) 0 0ns, 1 30ns -repeat 60ns
force s(2) 0 0ns, 1 15ns -repeat 30ns
run 240ns