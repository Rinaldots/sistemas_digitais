vsim mult_8bit 

add wave * 

force a(0) 0 0ns, 1 10ns -repeat 20ns
force a(1) 0 0ns, 1 20ns -repeat 40ns
force a(2) 0 0ns, 1 40ns -repeat 80ns
force a(3) 0 0ns, 1 80ns -repeat 160ns
force a(4) 0 0ns, 1 160ns -repeat 320ns
force a(5) 0 0ns, 1 320ns -repeat 640ns
force a(6) 0 0ns, 1 640ns -repeat 1280ns
force a(7) 0 0ns, 1 1280ns -repeat 2560ns

force b(0) 0 0ns, 1 5ns -repeat 10ns
force b(1) 0 0ns, 1 10ns -repeat 20ns
force b(2) 0 0ns, 1 20ns -repeat 40ns
force b(3) 0 0ns, 1 40ns -repeat 80ns
force b(4) 0 0ns, 1 80ns -repeat 160ns
force b(5) 0 0ns, 1 160ns -repeat 320ns
force b(6) 0 0ns, 1 320ns -repeat 640ns
force b(7) 0 0ns, 1 640ns -repeat 1280ns

run 120ns