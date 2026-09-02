vsim double_dabble

add wave *

# Força cada bit de entrada de a
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

run 300ns
