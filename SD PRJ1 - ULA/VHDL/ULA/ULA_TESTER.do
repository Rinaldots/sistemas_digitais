vsim ULA_P1 

add wave * 

force A(0) 0 0ns, 1 10ns -repeat 20ns
force A(1) 0 0ns, 1 20ns -repeat 40ns
force A(2) 0 0ns, 1 30ns -repeat 60ns
force A(3) 0 0ns, 1 40ns -repeat 80ns
force A(4) 0 0ns, 1 50ns -repeat 100ns
force A(5) 0 0ns, 1 60ns -repeat 120ns
force A(6) 0 0ns, 1 70ns -repeat 140ns
force A(7) 0 0ns, 1 80ns -repeat 160ns

force B(0) 0 0ns, 1 10ns -repeat 20ns
force B(1) 0 0ns, 1 20ns -repeat 40ns
force B(2) 0 0ns, 1 30ns -repeat 60ns
force B(3) 0 0ns, 1 40ns -repeat 80ns
force B(4) 0 0ns, 1 50ns -repeat 100ns
force B(5) 0 0ns, 1 60ns -repeat 120ns
force B(6) 0 0ns, 1 70ns -repeat 140ns
force B(7) 0 0ns, 1 80ns -repeat 160ns

force S_in(0) 0 0ns
force S_in(1) 0 0ns
force S_in(2) 0 0ns
force S_in(3) 1 0ns 
run 240ns