vsim adder_16bit

add wave *

force a(0) 0 0ns, 1 10ns -repeat 20ns
force a(1) 0 0ns, 1 20ns -repeat 40ns
force a(2) 0 0ns, 1 30ns -repeat 60ns
force a(3) 0 0ns, 1 40ns -repeat 80ns
force a(4) 0 0ns, 1 50ns -repeat 100ns
force a(5) 0 0ns, 1 60ns -repeat 120ns
force a(6) 0 0ns, 1 70ns -repeat 140ns
force a(7) 0 0ns, 1 80ns -repeat 160ns
force a(8) 0 0ns, 1 90ns -repeat 180ns
force a(9) 0 0ns, 1 100ns -repeat 200ns
force a(10) 0 0ns, 1 110ns -repeat 220ns
force a(11) 0 0ns, 1 120ns -repeat 240ns
force a(12) 0 0ns, 1 130ns -repeat 260ns
force a(13) 0 0ns, 1 140ns -repeat 280ns
force a(14) 0 0ns, 1 150ns -repeat 300ns
force a(15) 0 0ns, 1 160ns -repeat 320ns
force b(0) 0 0ns, 1 10ns -repeat 20ns
force b(1) 0 0ns, 1 20ns -repeat 40ns
force b(2) 0 0ns, 1 30ns -repeat 60ns
force b(3) 0 0ns, 1 40ns -repeat 80ns
force b(4) 0 0ns, 1 50ns -repeat 100ns
force b(5) 0 0ns, 1 60ns -repeat 120ns
force b(6) 0 0ns, 1 70ns -repeat 140ns
force b(7) 0 0ns, 1 80ns -repeat 160ns
force b(8) 0 0ns, 1 90ns -repeat 180ns
force b(9) 0 0ns, 1 100ns -repeat 200ns
force b(10) 0 0ns, 1 110ns -repeat 220ns
force b(11) 0 0ns, 1 120ns -repeat 240ns
force b(12) 0 0ns, 1 130ns -repeat 260ns
force b(13) 0 0ns, 1 140ns -repeat 280ns
force b(14) 0 0ns, 1 150ns -repeat 300ns
force b(15) 0 0ns, 1 160ns -repeat 320ns
run 340ns