vsim bcd_7seg 

add wave * 

force s(0) 0 0ns, 1 10ns -repeat 20ns
force s(1) 0 0ns, 1 20ns -repeat 40ns
force s(2) 0 0ns, 1 40ns -repeat 80ns
force s(3) 0 0ns, 1 80ns -repeat 160ns


run 120ns