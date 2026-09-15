vsim LETRAS

add wave *


force COL(0) 0 0ns, 1 10ns -repeat 20ns
force COL(1) 0 0ns, 1 20ns -repeat 40ns
force COL(2) 0 0ns, 1 40ns -repeat 80ns
force SEL(0) 0 0ns, 1 80ns -repeat 160ns
force SEL(1) 0 0ns, 1 160ns -repeat 320ns
force SEL(2) 0 0ns, 1 320ns -repeat 640ns
force SEL(3) 0 0ns, 1 640ns -repeat 1280ns


run 3000ns