vsim mux2x1 

add wave * 

force e(0) 0 0ns, 1 10ns -repeat 20ns
force e(1) 0 0ns, 1 20ns -repeat 40ns
force s 0 0ns, 1 30ns -repeat 60ns

run 120ns