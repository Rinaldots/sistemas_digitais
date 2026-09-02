vsim comp_4bit

add wave *

force a(0) 0 0ns, 1 10ns -repeat 20ns
force a(1) 0 0ns, 1 20ns -repeat 40ns
force a(2) 0 0ns, 1 40ns -repeat 80ns
force a(3) 0 0ns, 1 80ns -repeat 160ns

force b(0) 0 0ns, 1 5ns -repeat 10ns
force b(1) 0 0ns, 1 10ns -repeat 20ns
force b(2) 0 0ns, 1 20ns -repeat 40ns
force b(3) 0 0ns, 1 40ns -repeat 80ns

run 120ns